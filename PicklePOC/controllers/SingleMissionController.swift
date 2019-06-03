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
    @IBOutlet weak var acceptButton: UIButton!
    @IBOutlet weak var picklesList: UITableView!
    
    let pickles = [
        PickleContent(pickle: "Branchez vos appareils sur une multiprise pour tout éteindre en un geste."),
        PickleContent(pickle: "Les configurez pour les éteindre, et non les mettre en veille."),
        PickleContent(pickle: "Si vous travaillez sur ordinateur, pensez à bien l'éteindre à la fin de la journée."),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passerButton.layer.borderWidth = 1
        passerButton.layer.borderColor = UIColor.pickleDarkBlue.cgColor
        passerButton.layer.cornerRadius = CGFloat(10.0)
        acceptButton.layer.cornerRadius = CGFloat(10.0)
        
        picklesList.dataSource = self
        picklesList.delegate = self
    }
}

extension SingleMissionController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pickles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PickleCell", for: indexPath) as! PickleCell
        cell.rowNumberLabel.text = "\(indexPath.row)"
        cell.pickleContentLabel.text = pickles[indexPath.row].pickle
        
        return cell
    }
    
    func registerTableViewCell() {
        picklesList.register(PickleCell.self, forCellReuseIdentifier: "PickleCell")
    }
}
