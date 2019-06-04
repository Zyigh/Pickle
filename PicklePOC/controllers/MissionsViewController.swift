//
//  MissionsViewController.swift
//  PicklePOC
//
//  Created by Hugo Medina on 02/06/2019.
//  Copyright © 2019 Razeware. All rights reserved.
//

import Foundation
import UIKit

class MissionsViewController: UIViewController {
    
    @IBOutlet weak var longMissionDuration: UILabel!
    @IBOutlet weak var longMissionImage: UIImageView!
    @IBOutlet weak var longMissionType: UILabel!
    @IBOutlet weak var longMissionTitle: UILabel!
    
    @IBOutlet weak var shortMissionList: UICollectionView!
    var shortMissions = [Mission]()
    var longMission: Mission? = nil
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let ud = UserDefaults()
        if nil == ud.getValue(key: "uuid") {
            present("ObIntroViewController", storyboard: "Onboarding", bundle: nil) {_ in}
        } else {
            ApiConnexion.createUser() {
                response in
                
                switch response {
                case .success(let user):
                    CurrentUser.user = user as? User
                case .error(let e):
                    print(e)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ApiConnexion.getMissions() {
            response in
            
            switch response {
            case .success(let user):
                guard let user = user as? User else { return }
                user.missions.forEach { mission in
                    if mission.duration == 0 {
                        self.shortMissions.append(mission)
                    } else {
                        DispatchQueue.main.async {
                            self.setupLongMission(with: mission)
                        }
                    }
                }
                DispatchQueue.main.async {
                    self.setUpShortMissionList()
                    self.shortMissionList.reloadData()
                }
            case .error(let e):
                print(e)
            }
        }
    }
    
    @objc func missionTap(gesture: UITapGestureRecognizer) {
        
        present("single", storyboard: "Main", bundle: nil) {
            ctrl in
        
            if let ctrl = ctrl as? SingleMissionController {
                ctrl.mission = self.longMission
            }
        }
    }
    
    private func setupLongMission(with mission: Mission) {
        longMission = mission
        setMissionDuration(mission.duration ?? 8)
        if let imageName = mission.image,
           let u = URL(string: "\(ApiConnexion.baseUrl)/\(imageName)"),
           let d = try? Data(contentsOf: u) {
            longMissionImage.image = UIImage(data: d)
        } else {
            print("\(ApiConnexion.baseUrl)/\(mission.image ?? "")")
        }
        longMissionType.text = mission.mainSubjectToFrench()
        longMissionTitle.text = mission.description
        Tap.addTapGesture(view: longMissionImage, target: self, action: #selector(missionTap))
    }
    
    func setMissionDuration(_ n: Int) {
        longMissionDuration.text = "CHALLENGE \(n) JOUR"
        if n > 1 {
            longMissionDuration.text = longMissionDuration.text! + "S"
        }
    }
    
    func setMissionDuration(_ n: String) {
        longMissionDuration.text = "CHALLENGE \(n) JOUR"
        if let int = Int(n),
           int > 1 {
            longMissionDuration.text = longMissionDuration.text! + "S"
        }
    }
}

extension MissionsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shortMissions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "shortmissioncell", for: indexPath) as! ShortMissionCell
        
        cell.configure(with: shortMissions[indexPath.row])
        Tap.addTapGesture(view: cell, target: cell, action: #selector(missionTap))
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 196)
    }
    
    func setUpShortMissionList() {
        shortMissionList.dataSource = self
        shortMissionList.delegate = self
    }
}
