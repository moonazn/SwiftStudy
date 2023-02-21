//
//  ViewController.swift
//  profileWithEnum
//
//  Created by 송지연 on 2023/02/16.
//

import UIKit

class ViewController: UIViewController {
    
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func whichPartTapped(_ sender: UIButton) {
        
        let title = sender.currentTitle
        guard let partTitle = title else { return }
        
        let profileViewStoryboard = UIStoryboard(name: "Profile", bundle: nil)
        guard let profileViewController = profileViewStoryboard.instantiateViewController(withIdentifier: "ProfileViewController") as? ProfileViewController else { return }
        
        profileViewController.part = partTitle
        
        print(partTitle)
        
        
        self.navigationController?.pushViewController(profileViewController, animated: true)


    }
    

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let output = segue.destination as? ProfileViewController{
//            output.part = partStr
//        }
//
//    }
    
    
    
}
