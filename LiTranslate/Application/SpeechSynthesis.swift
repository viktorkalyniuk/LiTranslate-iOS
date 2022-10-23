//
//  SpeechSynthesis.swift
//  LiTranslate
//
//  Created by Viktor Kalyniuk on 13.08.2022.
//

import Foundation
import AVFoundation

class SpeechSynthesis {
    private let synthesize = AVSpeechSynthesizer()

    func play(_ string: String, language: Languages) {
        let utterance = AVSpeechUtterance(string: string)

         do {
             try AVAudioSession.sharedInstance().setCategory(.playback,mode: .default)
         } catch let error {
             print("\(error.localizedDescription)")
         }

        utterance.voice = AVSpeechSynthesisVoice(language: language.rawValue)
        synthesize.speak(utterance)
    }

    func canSynthesis(language: Languages) -> Bool {
        let speechVoices = AVSpeechSynthesisVoice.speechVoices()
        for speechVoice in speechVoices {
            if speechVoice.language.prefix(2) == language.rawValue {
                return true
            }
        }
        return false
    }
}
