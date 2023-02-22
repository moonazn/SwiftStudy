//
//  Model.swift
//  HelloGameWorld
//
//  Created by 송지연 on 2023/02/21.
//

import Foundation

enum Server: Int {
    case noServer = 0, earth, venus, mars, jupiter, uranus
    
    static subscript(n: Int) -> Server {        // 열거형 서브스크립트 예시
        guard Server(rawValue: n) != nil else { return Server(rawValue: 0)!}
        
        return Server(rawValue: n)!
    }
}

class Character {
    
//    static let shared = Character()           // 싱글톤으로 만들 경우
    
    // << 속성 >>
                                    // 타입 속성
    static var server: Server = Server[Int.random(in: 1...5)]        // 서브스크립트 활용 -> 랜덤으로 서버 배정
    
    
    private var name: String        // 저장 속성
    private var gender: String      // 저장 속성
    var level: Int = 0 {            // 속성 감시자
        didSet {
            print("--레벨업 !!--")
            print("Lv \(String(oldValue)) => Lv \(String(level))")
        }
    }
    
    lazy var job: String = "무직"     // 지연 저장 속성 -> Workspace에서 일정 레벨 이상이 되면 선언되게 .. (alert에 textField 추가해서 직업 직접 설정할 수 있게.)
    
    var workingTime: Int = 0        // 저장 속성
    
    var money: Int {                // 계산 속성
        return workingTime * 8
    }
    
    init(name: String, gender: String) {        // 생성자
        self.name = name
        self.gender = gender
    }
    
    
//    private init() {}
    
    
    // << 메서드 >>
    
    
    // 일하면 workingTime이 올라가는 메서드
    func work(){
        workingTime += 1
        print("일하는 중..")
    }
    
    // private로 선언한 속성 값을 얻어내는 메서드
    func getName() -> String{
        return self.name
    }
    
    func getGender() -> String {
        return self.gender
    }
    
}
