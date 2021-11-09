//
//  CommunicatorButtons.swift
//  controller
//
//  Created by Matheus Gois on 07/11/21.
//

import Foundation


enum CommunicatorButton: String, JsonFomatter {
    case volumeUp = "VOLUMEUP"
    case volumeDown = "VOLUMEDOWN"
    case left = "LEFT"
    case right = "RIGHT"
    case down = "DOWN"
    case up = "UP"
    case menu = "MENU"
    case back = "BACK"
    case enter = "ENTER"
    case dash = "DASH"
    case info = "INFO"
    case exit = "EXIT"
    case mute = "MUTE"
    case channelUp = "CHANNELUP"
    case channelDown = "CHANNELDOWN"
    case play = "PLAY"
    case pause = "PAUSE"
    case zero = "0"
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case height = "8"
    case nine = "9"
    case home = "HOME"

    var message: URLSessionWebSocketTask.Message {
        .string("type:button\nname:\(rawValue)\n\n")
    }
}
