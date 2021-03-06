//
//  ViewController.swift
//  Babupe
//
//  Created by Zewu Chen on 15/04/20.
//  Copyright © 2020 Zewu Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var resetButton: UIBarButtonItem!
    @IBOutlet weak var soundButton: UIBarButtonItem!

    let NUMBERCELLS = 50
    let hapticController = HapticController()
    let soundController = SoundController()
    var cells: [BubbleCollectionViewCell] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        self.navigationController?.navigationBar.barTintColor = .navigationBar
        resetButton.tintColor = .navigationButtons
        soundButton.tintColor = .navigationButtons
    }

    @IBAction func reset(_ sender: Any) {
        for cell in cells {
            cell.bursted = false
        }
    }

    @IBAction func sound(_ sender: Any) {
        if UserDefaults.standard.bool(forKey: "sound") {
            UserDefaults.standard.set(false, forKey: "sound")
            soundButton.image = UIImage(systemName: "speaker.slash")
        } else {
            UserDefaults.standard.set(true, forKey: "sound")
            soundButton.image = UIImage(systemName: "speaker.3")
        }
    }

}

extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return NUMBERCELLS
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bubbleCell", for: indexPath) as! BubbleCollectionViewCell
        cells.append(cell)
        return cell
    }

}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? BubbleCollectionViewCell, !cell.bursted {
            cell.bursted = true
            hapticController.haptic()
            soundController.playSound()
        }
    }
}
