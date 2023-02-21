//
//  ProfileViewController.swift
//  profileWithEnum
//
//  Created by 송지연 on 2023/02/16.
//

import UIKit

class ProfileViewController: UIViewController {

    
    @IBOutlet weak var partLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
            
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var congratLabel: UILabel!
    
    @IBOutlet weak var ageInfoLabel: UILabel!
    @IBOutlet weak var emailInfoLabel: UILabel!
    
    
    var part: String = ""
    
    var user: Profile?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.partLabel.text = part

    }
    
    
    @IBAction func submitTapped(_ sender: UIButton) {
        
        guard isEmpty() else { return }
        
        
        backgroundView.backgroundColor = UIColor.white
        
        switch part {
        case "IOS":
            user = Profile.iOS(name: nameTextField.text!,
                               age: Int(ageTextField.text!) ?? 0,
                               email: emailTextField.text!)
            
            if case let .iOS(name, age, email) = user {
                infoLabel.text = "\(part) 파트의 \(name) 님"
                ageInfoLabel.text = "* 나이 정보 : \(age) 세"
                emailInfoLabel.text = "* 이메일 정보 : \(email)"
            }
            
            
            
        case "Android":
            user = .android(name: nameTextField.text!,
                            age: Int(ageTextField.text!) ?? 0,
                            email: emailTextField.text!)
            
            if case let .android(name, age, email) = user {
                infoLabel.text = "\(part) 파트의 \(name) 님"
                ageInfoLabel.text = "* 나이 정보 : \(age) 세"
                emailInfoLabel.text = "* 이메일 정보 : \(email)"
            }
        case "back-end":
            user = .backEnd(name: nameTextField.text!,
                            age: Int(ageTextField.text!) ?? 0,
                            email: emailTextField.text!)
            
            if case let .backEnd(name, age, email) = user {
                infoLabel.text = "\(part) 파트의 \(name) 님"
                ageInfoLabel.text = "* 나이 정보 : \(age) 세"
                emailInfoLabel.text = "* 이메일 정보 : \(email)"
            }
        case "front-end":
            user = .frontEnd(name: nameTextField.text!,
                             age: Int(ageTextField.text!) ?? 0,
                             email: emailTextField.text!)
            
            if case let .frontEnd(name, age, email) = user {
                infoLabel.text = "\(part) 파트의 \(name) 님"
                ageInfoLabel.text = "* 나이 정보 : \(age) 세"
                emailInfoLabel.text = "* 이메일 정보 : \(email)"
            }
        
        case "not dev":
            user = .none
            infoLabel.text = "not dev \(nameTextField.text!)"
            ageInfoLabel.text = "* 나이 정보 : \(ageTextField.text!) 세"
            emailInfoLabel.text = "* 이메일 정보 : \(emailTextField.text!)"
            
        default:
            break
        }
        
        
        congratLabel.text = "가입을 축하합니다! 🎁"

        
        
        
    }
    
    func isEmpty() -> Bool {
        
        
        if nameTextField.text == "" || ageTextField.text == "" || emailTextField.text == "" {
            let alert = UIAlertController(title:"‼️",
                message: "모든 항목을 입력해주세요.",
                                          preferredStyle: UIAlertController.Style.alert)
            let ok = UIAlertAction(title: "알겠습니다", style: .default, handler: nil)
            alert.addAction(ok)
            present(alert,animated: true,completion: nil)
            
        } else {
            return true
        }
        return false
    }
    
    
    

}
