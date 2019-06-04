//
//  SingleMissionController.swift
//  PicklePOC
//
//  Created by Hugo Medina on 25/04/2019.
//  Copyright © 2019 Razeware. All rights reserved.
//

import Foundation
import UIKit

class SingleMissionController: UIViewController {
    var mission: Mission? = nil
    @IBOutlet weak var passerButton: UIButton!
    @IBAction func passMission(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func acceptMissionAction(_ sender: UIButton) {
        if mission?.duration == 0 {
            PopupAcceptMissionView.instance.showPopup()
            PopupAcceptMissionView.instance.popupMsg.text = mission?.results
            PopupAcceptMissionView.instance.origin = self
        }
    }
    @IBOutlet weak var acceptButton: UIButton!
    @IBOutlet weak var picklesList: UITableView!
    @IBOutlet weak var missionType: UILabel!
    @IBOutlet weak var missionTitle: UILabel!
    @IBOutlet weak var missionDesc: UILabel!
    
    @IBOutlet weak var missionImage: UIImageView!
    var pickles = [PickleContent]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passerButton.layer.borderWidth = 1
        passerButton.layer.borderColor = UIColor.pickleDarkBlue.cgColor
        passerButton.layer.cornerRadius = CGFloat(10.0)
        acceptButton.layer.cornerRadius = CGFloat(10.0)
        
        picklesList.rowHeight = UITableView.automaticDimension
        picklesList.estimatedRowHeight = 600
        
        picklesList.dataSource = self
        picklesList.delegate = self
        
        // Violent fail silent
        guard let mission = mission else {
            dismiss(animated: true, completion: nil)
            return
        }
        
        if let tips = mission.tips {
            for pickle in tips {
                pickles.append(PickleContent(pickle: pickle))
            }
        }
        
        missionType.text = mission.mainSubjectToFrench()
        missionDesc.text = mission.explanations
        missionTitle.text = mission.description
        
        if let imgUrl = mission.image,
           let u = URL(string: "\(ApiConnexion.baseUrl)/\(imgUrl)"),
           let d = try? Data(contentsOf: u) {
            missionImage.image = UIImage(data: d)
        }
    }
}

extension SingleMissionController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pickles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "picklecell", for: indexPath) as! PickleCell
        cell.pickleContentLabel.text = pickles[indexPath.row].pickle
        cell.textLayer.string = "\(indexPath.row + 1)"
        
        return cell
    }
    
}
