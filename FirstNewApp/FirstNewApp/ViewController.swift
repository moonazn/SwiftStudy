//
//  ViewController.swift
//  FirstNewApp
//
//  Created by 송지연 on 2023/08/05.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    weak var timer: Timer?
    
    var number = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }

    func configureUI() {
        mainLabel.text = "초를 선택하세요"
        slider.value = 0.5
    }
    
    // event: value changed -> slider의 값이 변할 때마다 해당 함수가 호출됨
    @IBAction func sliderChanged(_ sender: UISlider) {
        
        // slider의 value를 가지고 mainLabel.text 세팅 (slider.value : 0.0 ~ 1.0)
        number = Int(slider.value * 60)
        mainLabel.text = "\(number) 초"
        
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        // 1s 지나갈 때마다 무언가를 실행
        timer?.invalidate()
        
        // target : ViewController(인스턴스) 의미 = self, ViewController 안에 있는 doSomethingAfter1Second 함수를 1초마다 반복적으로 실행. (무한반복 방지를 위해서 Timer 중지는 저 함수 안에서 조건부 설정)
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(doSomethingAfter1Second), userInfo: nil, repeats: true)
       

//        // [self] <- 내부에서 굳이 self를 적지 않아도 한번만 적으면 되도록 만들어줌 (=[strong self]) / [weak self]도 있음!
//        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] _ in // 객체 내에서 클로저 사용 시 self를 붙여야함
//
//            // 반복하고자 하는 코드
//
//            if number > 0 {
//                number -= 1
//                // 슬라이더 줄이기
//                // 레이블 표시 다시 해주기
//                slider.value = Float(number) / Float(60)    // slider.value: 0.0 ~ 1.0
//                mainLabel.text = "\(number) 초"
//
//            } else {
//                number = 0
//                mainLabel.text = "초를 선택하세요"
//                // 타이머 비활성화 (1초 뒤에 실행되는 게 무한반복될 수 있기 때문에..)
//                timer?.invalidate()
//
//                // 소리를 나게 해야함 (system sound)
//                AudioServicesPlayAlertSound(SystemSoundID(1322))
//
//            }
//
//
//        }
    }
    
    @objc func doSomethingAfter1Second() {
        
        if number > 0 {
            number -= 1
            slider.value = Float(number) / Float(60)    // slider.value: 0.0 ~ 1.0
            mainLabel.text = "\(number) 초"
            
        } else {
            number = 0
            mainLabel.text = "초를 선택하세요"
            // 타이머 비활성화 (1초 뒤에 실행되는 게 무한반복될 수 있기 때문에..)
            timer?.invalidate()
            
            // 소리를 나게 해야함 (system sound)
            AudioServicesPlayAlertSound(SystemSoundID(1322))
            
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // 초기화 세팅
        configureUI()
        number = 0
        timer?.invalidate()     // timer = nil
    }
    
}

