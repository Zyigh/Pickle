//
//  StatsHelpViewController.swift
//  PicklePOC
//
//  Created by Hugo Medina on 04/06/2019.
//  Copyright © 2019 Razeware. All rights reserved.
//

import Foundation
import UIKit

class StatsHelpViewController: UIViewController {
    
    @IBOutlet weak var levelImg: UIImageView!
    @IBOutlet weak var levelSlider: PickleSlider!
    @IBOutlet weak var levelName: UILabel!
    @IBOutlet weak var levelDesc: UILabel!
    @IBOutlet weak var levelPicklesNb: UILabel!
    
    var levelNames = ["Jeune pousse", "Arbuste", "Grand Chêne"]
    var levelDescs = ["Vous avez la volonté d’agir pour la planète, mais ne savez pas vraiment par où commencer.", "Vous êtes déjà sensibilisé à une approche environnementale responsable et souhaitez poursuivre vos efforts.", "Vous avez développé votre conscience écologie au quotidien et vous vous sentez prêt a aller plus loin."]
    var levelPickles = ["0 - 80 Pickles", "80 - 200 Pickles", "> 200 Pickles"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initHelpLevel()
    }
    
    func initHelpLevel(){
        levelImg.image = UIImage(named: "plant-green-pot--round-pousse")
        levelName.text = levelNames[0]
        levelDesc.text = levelDescs[0]
        levelPicklesNb.text = levelPickles[0]
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        let value = slider.value.rounded()
        
        if value < 50 {
            levelImg.image = UIImage(named: "plant-green-pot--round-pousse")
            levelName.text = levelNames[0]
            levelDesc.text = levelDescs[0]
            levelPicklesNb.text = levelPickles[0]
        } else if value < 80 {
            levelImg.image = UIImage(named: "plant-green-pot--round-arbuste")
            levelName.text = levelNames[1]
            levelDesc.text = levelDescs[1]
            levelPicklesNb.text = levelPickles[1]
        } else {
            levelImg.image = UIImage(named: "plant-green-pot--round-chene")
            levelName.text = levelNames[2]
            levelDesc.text = levelDescs[2]
            levelPicklesNb.text = levelPickles[2]
        }
    }
}
