//
//  enum.swift
//  profileWithEnum
//
//  Created by 송지연 on 2023/02/16.
//

import Foundation

enum Profile {
    case iOS(name: String = "", age: Int = 0, email: String = "@")
    case android(name: String = "", age: Int = 0, email: String = "@")
    case backEnd(name: String = "", age: Int = 0, email: String = "@")
    case frontEnd(name: String = "", age: Int = 0, email: String = "@")
}


//enum greeting: Int {
//    case hi(String)
//    case hello
//}     // -> 하나의 열거형에서 원시값과 연관값을 동시에 사용하는 것은 불가능


