//
//  BubbleCollectionViewCell.swift
//  Babupe
//
//  Created by Zewu Chen on 15/04/20.
//  Copyright © 2020 Zewu Chen. All rights reserved.
//

import UIKit

class BubbleCollectionViewCell: UICollectionViewCell {

    var bursted = false {
        didSet {
            var name = "bubble_filled"
            if self.bursted == true {
                let number = Int.random(in: 1...3)
                name = "bubble_empty\(number)"
            }
            self.bubbleImage.image = UIImage(named: name)
        }
    }

    @IBOutlet weak var bubbleImage: UIImageView!
}
