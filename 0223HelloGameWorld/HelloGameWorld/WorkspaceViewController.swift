//
//  WorkspaceViewController.swift
//  HelloGameWorld
//
//  Created by 송지연 on 2023/02/21.
//

import UIKit

class WorkspaceViewController: UIViewController {

    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var genderNJobLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    
    @IBOutlet weak var workingButton: UIButton!
    
    @IBOutlet weak var changeJobButton: UIButton!
    
    var newCharacter: Character = Character(name: "", gender: "")   // 객체 생성
    
//    let newCharacter = Character.shared       // Singleton Pattern (다른 뷰컨에서 서로 같은 주소를 가리키게 됨)
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 초기 레이블 세팅
        helloLabel.text = "Hello, \(newCharacter.getName())😊"
        genderNJobLabel.text = "\(newCharacter.getGender())"
        
        // 일하기 버튼 비활성화
        workingButton.isEnabled = false
        workingButton.tintColor = UIColor.gray
        
        // 직업 변경 버튼 비활성화
        changeJobButton.isEnabled = false
        changeJobButton.tintColor = UIColor.gray
    }
    
    
    func setJob() {
        let alertController = UIAlertController(title: nil, message: "원하는 직업을 입력하세요.", preferredStyle: .alert)
        alertController.addTextField{ field in
            field.placeholder = "What's your job?"
        }
        
        let okAction = UIAlertAction(title: "완료", style: .default) { action in
            if let firstTextField = alertController.textFields?.first {
                self.newCharacter.job = firstTextField.text ?? "무직"
                if self.newCharacter.job == "" {
                    self.newCharacter.job = "무직"
                }
                self.genderNJobLabel.text = "\(self.newCharacter.getGender()), \(self.newCharacter.job)"
            }
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion:  nil)
    }
    
    @IBAction func levelUpClicked(_ sender: UIButton) {
        newCharacter.level += 1
        levelLabel.text = "Lv. \(newCharacter.level)"
        
        
        // 10레벨 부터 직업을 가질 수 있다.
        if newCharacter.level == 10 {
            setJob()
            // 일하기 버튼 활성화
            workingButton.isEnabled = true
            workingButton.tintColor = UIColor.systemBlue
            
            // 직업 변경 버튼 활성화
            changeJobButton.isEnabled = true
            changeJobButton.tintColor = UIColor.systemBlue
        }
        
    }
    
    
    @IBAction func clickedChangeJob(_ sender: UIButton) {
        setJob()
    }
    
    
    @IBAction func workClicked(_ sender: UIButton) {
        newCharacter.work()
        moneyLabel.text = String(newCharacter.money)
    }

    
    @IBAction func showServerInfo(_ sender: UIButton) {
    
        print("-- Server Info : \(Character.server)")       // 타입 속성 접근
        
    }
    

}
