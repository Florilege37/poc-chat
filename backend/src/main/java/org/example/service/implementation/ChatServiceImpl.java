package org.example.service.implementation;

import org.example.dto.ChatMessageDto;
import org.example.service.ChatService;
import org.springframework.stereotype.Service;

@Service
public class ChatServiceImpl implements ChatService {

    public ChatMessageDto sendChat(ChatMessageDto message) {
        return new ChatMessageDto(message.getMessage(), message.getUser());
    }

}
