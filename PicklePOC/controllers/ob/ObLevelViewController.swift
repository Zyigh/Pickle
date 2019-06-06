//
//  ObLevelViewController.swift
//  gaiaApp
//
//  Created by Molika THAI on 01/05/2019.
//  Copyright © 2019 hetic. All rights reserved.
//

import UIKit

class ObLevelViewController: UIViewController {
    
    @IBOutlet var startButton: PickleButton!
    @IBOutlet var slider: PickleSlider!
    @IBOutlet var avatar: UIImageView!
    @IBOutlet var levelName: UILabel!
    @IBOutlet var levelDesc: UILabel!
    
    var levelNames = ["Jeune pousse", "Arbuste", "Grand Chêne"]
    var levelDescs = ["Vous avez la volonté d’agir pour la planète, mais ne savez pas vraiment par où commencer.", "Vous êtes déjà sensibilisé à une approche environnementale responsable et souhaitez poursuivre vos efforts.", "Vous avez développé votre conscience écologie au quotidien et vous vous sentez prêt a aller plus loin."]
    var selectedLevel: Level = .jeunepousse
    var selectedAvatarSrc: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.setEnabledButtonStyle()

        let startValue = 5
        slider.value = Float(startValue)
        levelName.text = levelNames[0]
        levelDesc.text = levelDescs[0]
        avatar.image = UIImage(named: "plant-green-pot--round-pousse")
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        let value = slider.value.rounded()
        
        if value < 34 {
            selectedLevel = .jeunepousse
        } else if value < 67 {
            selectedLevel = .arbuste
        } else {
            selectedLevel = .vieuxchene
        }
        
        levelName.text = levelNames[selectedLevel.rawValue]
        levelDesc.text = levelDescs[selectedLevel.rawValue]
        
        switch selectedLevel {
        case .jeunepousse:
            avatar.image = UIImage(named: "plant-green-pot--round-pousse")
        case .arbuste:
            avatar.image = UIImage(named: "plant-green-pot--round-arbuste")
        case .vieuxchene:
            avatar.image = UIImage(named: "plant-green-pot--round-chene")
        }
    }
    
    @IBAction func goToMissionsList() {
        CurrentUser.user?.level = selectedLevel

        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        if let missionsVC = sb.instantiateViewController(withIdentifier: "missions_list") as? MissionsViewController {
            present(missionsVC, animated: true, completion: nil)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
