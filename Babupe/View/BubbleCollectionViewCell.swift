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
            let number = Int.random(in: 1...3)
            self.bubbleImage.image = UIImage(named: "bubble_empty\(number)")
        }
    }

    @IBOutlet weak var bubbleImage: UIImageView!
}
