//
//  MissionsViewController.swift
//  PicklePOC
//
//  Created by Hugo Medina on 02/06/2019.
//  Copyright © 2019 Razeware. All rights reserved.
//

import Foundation
import UIKit

class MissionsTest {
    static let missions = [
        Mission(
            id: UUID(),
            duration: "3",
            description: "Mission longue",
            image: "https://specials-images.forbesimg.com/imageserve/5ceacb3e142c500008f3bead/416x416.jpg",
            mainSubject: "Energy",
            explanations: "Faire une mission longue",
            tips: ["tip1", "tip2"], elo: Elo(energy: 8, waste: 42, food: 12)
        ), Mission(
            id: UUID(),
            duration: "0",
            description: "Mission Courte 1",
            image: "https://www.nautiljon.com/images/perso/00/53/shizuku_9835.jpg",
            mainSubject: "waste",
            explanations: "Faire une mission courte",
            tips: ["Faire", "Une", "Mission", "Courte"], elo: Elo(energy: 8, waste: 42, food: 12)
        ), Mission(
            id: UUID(),
            duration: "0",
            description: "Mission Courte 2",
            image: "https://i.skyrock.net/2578/87742578/pics/3182916395_1_6_5hdVz4PK.jpg",
            mainSubject: "energy",
            explanations: "Faire une mission courte energy",
            tips: ["Faire", "Une", "Mission", "Courte", "Energy"], elo: Elo(energy: 8, waste: 42, food: 12)
        ), Mission(
            id: UUID(),
            duration: "0",
            description: "Mission Courte 3",
            image: "https://i.pinimg.com/originals/eb/04/50/eb04504c222c39972d9fb10c3e9e6549.jpg",
            mainSubject: "food",
            explanations: "MANGER MIEUX",
            tips: ["Bouffe"], elo: Elo(energy: 8, waste: 42, food: 12)
        )
    ]
}

class MissionsViewController: UIViewController {
    
    @IBOutlet weak var longMissionDuration: UILabel!
    @IBOutlet weak var longMission: UIImageView!
    @IBOutlet weak var longMissionType: UILabel!
    @IBOutlet weak var longMissionTitle: UILabel!
    
    @IBOutlet weak var shortMissionList: UICollectionView!
    var shortMissions = [ShortMission]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Tap.addTapGesture(view: longMission, target: self, action: #selector(longMissionTap))
        
        setUpShortMissionList()
        
        let shorts = MissionsTest.missions
        for mission in shorts {
            if mission.duration == "0",
               let u = URL(string: mission.image ?? "not url"),
               let d = try? Data(contentsOf: u) {
                shortMissions.append(ShortMission(image: UIImage(data: d),
                                    category: mission.mainSubject,
                                    title: mission.description))
            }
        }
    }
    
    @objc func longMissionTap(gesture: UITapGestureRecognizer) {
        present("single")
    }
    
    func setMissionDuration(_ n: Int) {
        longMissionDuration.text = "CHALLENGE \(n) JOUR"
        if n > 1 {
            longMissionDuration.text = longMissionDuration.text! + "S"
        }
    }
}

extension MissionsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shortMissions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = shortMissionList.dequeueReusableCell(withReuseIdentifier: "ShortMissionCell", for: indexPath) as! ShortMissionCell
        cell.configure(with: shortMissions[indexPath.row])
        return cell
    }
    
    func setUpShortMissionList() {
        shortMissionList.dataSource = self
        shortMissionList.delegate = self
//        shortMissionList.register(UINib.init(nibName: "ShortMissionCell", bundle: nil), forCellWithReuseIdentifier: "ShortMissionCell")
        shortMissionList.register(ShortMissionCell.self, forCellWithReuseIdentifier: "ShortMissionCell")
    }
}
