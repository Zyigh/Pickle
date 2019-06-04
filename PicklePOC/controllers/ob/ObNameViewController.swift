//
//  ObNameViewController.swift
//  gaiaApp
//
//  Created by Molika THAI on 29/01/2019.
//  Copyright © 2019 hetic. All rights reserved.
//

import UIKit

class ObNameViewController: UIViewController {
    
    @IBOutlet var nextButton: PickleButton!
    @IBOutlet var nameTextField: PickleUsernameTextField!
    @IBOutlet var errorMessage: PickleFormErrorMessage!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.isEnabled = false
        nextButton.setDisabledButtonStyle()
        
        errorMessage.text = ""
        nameTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
    }
    
    @IBAction func textFieldDidChange(_ sender:UITextField) {
        guard let username = nameTextField.text else {
            return
        }
        
        toggleButton(value: username)
    }
    
    @IBAction func nameValidation(_ sender:UIButton){
        guard let username = nameTextField.text else {
                return
        }
        
        nameTextField.hasError = false
        errorMessage.text = ""
        
        validateInputValue(value: username)

        nextObStepLevel()
    }
    
    func nextObStepLevel(){
        let sb = UIStoryboard(name: "Onboarding", bundle: nil)
        
        if let levelVC = sb.instantiateViewController(withIdentifier: "ObLevelViewController") as? ObLevelViewController {
            present(levelVC, animated: true, completion: nil)
        }
    }
    
    func toggleButton(value: String){
        if value.count >= 1 {
            nextButton.isEnabled = true
            nextButton.setEnabledButtonStyle()
        } else {
            nextButton.isEnabled = false
            nextButton.setDisabledButtonStyle()
        }
    }

    func validateInputValue(value: String){
        if value.isEmpty {
            nameTextField.hasError = !nameTextField.hasError
            errorMessage.text = "Votre pseudo est vide. Veuillez entrer un pseudo ayant au moins un caractère."
            
            return
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
