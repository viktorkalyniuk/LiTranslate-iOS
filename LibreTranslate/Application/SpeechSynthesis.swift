//
//  SpeechSynthesis.swift
//  LibreTranslate
//
//  Created by vktr on 13.08.2022.
//

import Foundation
import AVFoundation

struct SpeechSynthesis {
    static func play(_ string: String, language: Languages) {
        let utterance = AVSpeechUtterance(string: string)
        utterance.voice = AVSpeechSynthesisVoice(language: language.rawValue)
        AVSpeechSynthesizer().speak(utterance)
    }

    static func canSynthesis(language: Languages) -> Bool {
        let speechVoices = AVSpeechSynthesisVoice.speechVoices()
        for speechVoice in speechVoices {
            if speechVoice.language.prefix(2) == language.rawValue.lowercased() {
                return true
            }
        }
        return false
    }
}
