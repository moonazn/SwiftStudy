import UIKit

//randomBingo
//1~10 사이의 랜덤 값

var com = Int.random(in: 1...10)
var me = 5

if com > me {
    print("Up")
} else if com < me {
    print("Down")
} else {
    print("Bingo")
}
