//
//  URI.swift
//  controller
//
//  Created by Matheus Gois on 04/11/21.
//

import Foundation

// MARK: - Enums

enum URI: String, JsonFomatter {
    case turnOff = "ssap://system/turnOff"
    case toast = "ssap://system.notifications/createToast"

    case pause = "ssap://media.controls/pause"
    case play = "ssap://media.controls/play"
    case stop = "ssap://media.controls/stop"

    case rewind = "ssap://media.controls/rewind"
    case fastForward = "ssap://media.controls/fastForward"
    case channelUp = "ssap://tv/channelUp"
    case channelDown = "ssap://tv/channelDown"
    case set3DOn = "ssap://com.webos.service.tv.display/set3DOn"
    case set3DOff = "ssap://com.webos.service.tv.display/set3DOff"

    case getStatus = "ssap://audio/getStatus"
    case getCurrentSWInformation = "ssap://com.webos.service.update/getCurrentSWInformation"
    case getInputSocket = "ssap://com.webos.service.networkinput/getPointerInputSocket"

    // Volume
    case volumeUp = "ssap://audio/volumeUp"
    case volumeDown = "ssap://audio/volumeDown"
    case getVolume = "ssap://audio/getVolume"
    case setVolume = "ssap://audio/setVolume"

    case launch = "ssap://system.launcher/launch"
    case close = "ssap://system.launcher/close"
    case getServiceList = "ssap://api/getServiceList"
    case listLaunchPoints = "ssap://com.webos.applicationManager/listLaunchPoints"

    case sendEnterKey = "ssap://com.webos.service.ime/sendEnterKey"
    case deleteCharacters = "ssap://com.webos.service.ime/deleteCharacters"
}
