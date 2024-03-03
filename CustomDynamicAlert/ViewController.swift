//
//  ViewController.swift
//  CustomDynamicAlert
//
//  Created by YuthFight's MacBook Pro  on 3/3/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showDynamicAlert(_ sender: UIButton) {
        self.dynamicAlert(titleMsg: "Hello", descMsg: "I'm your man", confirm: "Confirm") { isTrue in
            if isTrue {
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyBoard.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    

}

