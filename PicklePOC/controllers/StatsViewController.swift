//
//  StatsViewController.swift
//  PicklePOC
//
//  Created by Hugo Medina on 04/06/2019.
//  Copyright © 2019 Razeware. All rights reserved.
//

import Foundation
import UIKit

class StatsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var progress: PickleProgressView!
    @IBOutlet weak var helpBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progress.layoutSubviews()
    }
    
    let reuseIdentifier = "stats-mission-cell" // also enter this string as the cell identifier in the storyboard
    let missionsNbList = ["5", "5", "10"]
    let missionsTypes = ["Alimentaire", "Énergie", "Zéro Déchet"]
    let missionsColors = [UIColor.pickleRed, UIColor.pickleLightGreen, UIColor.picklePurple]
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! StatsMissionsCollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.missionsNb.text = self.missionsNbList[indexPath.item]
        cell.missionsType.text = self.missionsTypes[indexPath.item].uppercased()
        cell.backgroundColor = self.missionsColors[indexPath.item]
        cell.layer.cornerRadius = 10// make cell more visible in our example project
        
        return cell
    }
}
