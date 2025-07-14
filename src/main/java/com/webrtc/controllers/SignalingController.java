package com.webrtc.controllers;


import org.springframework.messaging.handler.annotation.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;

@Controller
@CrossOrigin
public class SignalingController {

    @MessageMapping("/signal/{roomId}")
    @SendTo("/topic/signal/{roomId}")
    public String signaling(@Payload String message, @DestinationVariable String roomId) {
        return message;
    }
}
