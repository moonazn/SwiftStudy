//
//  ResultViewController.swift
//  0209주사위세개
//
//  Created by 송지연 on 2023/02/09.
//

import UIKit


// 0209 스터디
// 조건문 활용하기

class ResultViewController: UIViewController {

    @IBOutlet weak var prizeLabel: UILabel!
    @IBOutlet weak var diceNumber: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        randomDice()
        // Do any additional setup after loading the view.
    }
    
    func randomDice() -> Void {
        // 주사위 랜덤 숫자 생성
        let num1: Int = Int.random(in: 1...6)
        let num2: Int = Int.random(in: 1...6)
        let num3: Int = Int.random(in: 1...6)
        
        diceNumber.text = String(num1) + "  " + String(num2) + "  " + String(num3)
        
        prizeLabel.text = String(howMuchPrize(num1: num1, num2: num2, num3: num3))
        print("주사위 눈: ", num1, num2, num3)
        print("Congratulations!")
        
    }
    
    func howMuchPrize(num1: Int, num2: Int, num3: Int) -> Int {
        var prizeMoney = 0
        
        if num1 == num2 && num2 == num3 {
            prizeMoney = 10000 + (num1 * 1000)
        } else if num1 == num2 || num1 == num3 {
            prizeMoney = 1000 + num1 * 100
        } else if num2 == num3 {
            prizeMoney = 1000 + num2 * 100
        } else {
            prizeMoney = max(num1, num2, num3) * 100
        }
        
        
        
//          (같은 게임 조건으로 switch문으로 바꾸기엔 너무 비효율적인 코드라고 느껴져서,, 조건 살짝 변경)
//
//        같은 눈이 나온 주사위의 개수가 짝수 / 홀수 (1, 2, 3의 경우)
//         짝수 -> 10,000원 + (같은 눈) * 1,000
//         홀수 -> 4,000원
        
//        var sameNumDice = 0
//
//        if num1 == num2 && num2 == num3 {
//            sameNumDice = 3
//        } else if num1 == num2 || num1 == num3 {
//            sameNumDice = 2                   //1, 2번 또는 1, 3번 주사위 눈이 같을 때
//        } else if num2 == num3 {
//            sameNumDice = 5                   //2, 3번 주사위 눈이 같을 때
//        } else {
//            sameNumDice = 1
//        }
//       
//        
//          (---1---)
//        
//        switch sameNumDice {
//        case let n where n % 2 == 0 :
//            prizeMoney = 10000 + (num1 * 1000)
//        case 5 :
//            prizeMoney = 10000 + (num2 * 1000)
//        default:
//            prizeMoney = 4000
//        }
//
        
//          (---2---)
        
//        switch sameNumDice {
//            //같은 눈 주사위 홀수
//        case 3 :
//            fallthrough
//        case 1 :
//            prizeMoney = 4000
//
//            //같은 눈 주사위 짝수
//        case 2 :
//            prizeMoney = 10000 + (num1 * 1000)
//        case 5 :                              //2, 3번 주사위 눈이 같을 때
//            prizeMoney = 10000 + (num2 * 1000)
//        default:
//            break
//        }
        
        return prizeMoney
    }


}
