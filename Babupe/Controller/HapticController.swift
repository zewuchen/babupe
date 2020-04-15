//
//  HapticController.swift
//  Babupe
//
//  Created by Zewu Chen on 15/04/20.
//  Copyright © 2020 Zewu Chen. All rights reserved.
//

import UIKit

class HapticController {

    let haptics: [UIImpactFeedbackGenerator.FeedbackStyle] = [.heavy, .light, .medium, .medium, .medium, .rigid, .soft, .soft]

    func haptic() {
        let number = Int.random(in: 0...haptics.count-1)
        let generator = UIImpactFeedbackGenerator(style: haptics[number])
        generator.prepare()
        generator.impactOccurred()
    }
    
}
