import UIKit

//rockPaperScissors
//  가위 - 0, 바위 - 1, 보 - 2

var com = Int.random(in: 0...2)
var me = 0

print(" ========== Game Start ========== ")

switch com {
case 0:
    print("컴퓨터는 가위!")
case 1:
    print("컴퓨터는 바위!")
case 2:
    print("컴퓨터는 보!")
default:
    break
}

switch me {
case 0:
    print("당신은 가위!")
case 1:
    print("당신은 바위!")
case 2:
    print("당신은 보!")
default:
    break
}
    

if (com - me == 1) || (me - com == 2){
    print("컴퓨터가 이겼습니다. YOU LOSE.. T.T ")
} else if com == me {
    print("컴퓨터와 당신이 비겼습니다 ~ ")
} else {
    print("당신이 이겼습니다. YOU WIN!!! ")
}

print(" ========== The End ========== ")

