import { Injectable } from '@angular/core';
import {ChatMessage} from "../models/chat-message";
import {BehaviorSubject} from "rxjs";
import {Stomp} from "@stomp/stompjs";
import * as SockJS from "sockjs-client";
import {Message} from "stompjs";

@Injectable({
  providedIn: 'root'
})
export class ChatService {

  private chatClient: any
  private messageSubject: BehaviorSubject<ChatMessage[]> = new BehaviorSubject<ChatMessage[]>([]);

  constructor() {
    this.initConnectionSocket();
  }

  initConnectionSocket() {
    const url = '//localhost:8080/poc-chat';
    const socket = new SockJS(url);
    this.chatClient = Stomp.over(socket);
  }

  joinRoom(roomId: string) {
    this.chatClient.connect({}, ()=>{
      this.chatClient.subscribe(`/topic/${roomId}`, (messages: Message) => {
        const messageContent = JSON.parse(messages.body);
        const currentMessage = this.messageSubject.getValue();
        currentMessage.push(messageContent);

        this.messageSubject.next(currentMessage);

      })
    })
  }

  sendMessage(roomId: string, chatMessage: ChatMessage) {
    this.chatClient.send(`/app/chat/${roomId}`, {}, JSON.stringify(chatMessage))
  }

  getMessageSubject(){
    return this.messageSubject.asObservable();
  }
}
