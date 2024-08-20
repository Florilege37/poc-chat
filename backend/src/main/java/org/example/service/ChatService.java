package org.example.service;

import org.example.dto.ChatMessageDto;

public interface ChatService {

    ChatMessageDto sendChat(ChatMessageDto message);

}
