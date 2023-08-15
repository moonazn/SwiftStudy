//
//  ViewController.swift
//  TextFieldProject
//
//  Created by 송지연 on 2023/08/05.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self   // 대리자(delegate) 역할 누가 할지 설정 : self(= 이 뷰컨트롤러가 수행)
        
        setup()
    }

    func setup() {
        view.backgroundColor = UIColor.gray
        
        textField.keyboardType = UIKeyboardType.emailAddress
        textField.placeholder = "이메일 입력"
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .always
        textField.returnKeyType = .next
        
        textField.becomeFirstResponder()    // 해당 화면을 들어가자마자 텍스트필드가 first Responder(응답객체)가 되어서 자동으로 키보드가 올라옴
    }
    
    // 화면의 탭을 감지하는 메소드
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)  // 화면의 빈 곳을 클릭시 키보드가 내려감
        //textField.resignFirstResponder()
    }
    
    // 텍스트필드의 입력을 시작할 때 호출 (시작할지 말지의 여부 허락하는 것)
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // 시점 -
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("텍스트필드 입력 시작")
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
    
    // 텍스트 글자 내용이 (한글자 한글자) 입력되거나 지워질 때 호출이 되고 (허락)
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        print(string)
        
        
        // 10글자 까지만 입력되게 설정
        
//        let maxLength = 10
//        let currentString: NSString = (textField.text ?? "") as NSString
//        let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
//
//        return newString.length <= maxLength
        
        // 입력되고 있는 글자가 "숫자"인 경우 입력을 허용하지 않는 논리
        if Int(string) != nil {
            return false
        } else {
            // 10글자 이상 입력되는 것을 막는 코드
            guard let text = textField.text else { return true }
            let newLength = text.count + string.count - range.length
            return newLength <= 10
        }
    }
    
    // 텍스트필드의 엔터키가 눌러지면 다음 동작을 허락할것인지 말것인지
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField.text == "" {
            textField.placeholder = "Type Something!"
            return false    // 다음 동작 허락 X
        } else {
            return true
        }
    }
    
    // 텍스트필드의 입력이 끝날때 호출 (끝날지 말지를 허락)
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    // 텍스트필드의 입력이 실제 끝났을때 호출 (시점)
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("텍스트필드 입력 완료")
    }
    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        textField.resignFirstResponder()    // DONE 버튼 클릭 시 키보드가 내려감
    }
    

}

