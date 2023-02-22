//
//  ViewController.swift
//  HelloGameWorld
//
//  Created by 송지연 on 2023/02/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var manSelectButton: UIButton!
    @IBOutlet weak var womanSelectButton: UIButton!
    
//    let newCharacter = Character.shared       // Singleton Pattern
    
    var gender: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func genderChosed(_ sender: UIButton) {
        let title = sender.currentTitle
        
        switch title{
        case "남":
            manSelectButton.backgroundColor = #colorLiteral(red: 0.9446405768, green: 0.4286645651, blue: 0.3995049596, alpha: 1)
            womanSelectButton.backgroundColor = UIColor.darkGray
            gender = "남자"
        
        case "여":
            manSelectButton.backgroundColor = UIColor.darkGray
            womanSelectButton.backgroundColor = #colorLiteral(red: 0.9446405768, green: 0.4286645651, blue: 0.3995049596, alpha: 1)
            gender = "여자"
        
        default:
            break
        }
        
    }
    
    
    
    @IBAction func moveToWorkspace(_ sender: UIButton) {

        guard isEmpty() else { return }
        
        let workspaceViewStoryboard = UIStoryboard(name: "Workspace", bundle: nil)
        guard let workspaceViewController =  workspaceViewStoryboard.instantiateViewController(withIdentifier: "workspace") as? WorkspaceViewController else { return }
        
        
        // 입력한 캐릭터의 이름과 성별을 이용하여 Character 클래스 객체 생성
        // nameTextField가 비었는지는 앞에 isEmpty() 함수로 확인하였으므로 강제 옵셔널 벗기기 가능
        workspaceViewController.newCharacter = Character(name: nameTextField.text!, gender: gender)
        
        
        // Singleton Pattern
//        newCharacter.name = nameTextField.text!
//        newCharacter.gender = gender
        
        self.navigationController?.pushViewController(workspaceViewController, animated: true)
    }
    
    func isEmpty() -> Bool {
        if nameTextField.text != "" {
            return true
        }
        let alert = UIAlertController(title: "‼️", message: "항목을 빠짐없이 입력해주세요", preferredStyle: UIAlertController.Style.alert)
            
        let ok = UIAlertAction(title: "네, 알겠습니다.", style: .default, handler: nil)
        alert.addAction(ok)
            
        present(alert, animated: true, completion: nil)
        
        return false
    }
    


}

