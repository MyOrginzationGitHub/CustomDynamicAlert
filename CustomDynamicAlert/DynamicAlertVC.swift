//
//  DynamicAlertVC.swift
//  CustomDynamicAlert
//
//  Created by YuthFight's MacBook Pro  on 3/3/24.
//

import UIKit

typealias CompletionBool = (Bool) -> Void

class DynamicAlertVC: UIViewController {
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var confirmCompletion : CompletionBool = {_ in }
    
    var titleMess = ""
    var descMess = ""
    var confirmString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.bgView.layer.cornerRadius = 5
        self.cancelButton.layer.cornerRadius = 5
        self.okButton.layer.cornerRadius = 5
        
        titleLabel.text = titleMess
        descLabel.text = descMess
        okButton.setTitle(confirmString, for: .normal)
    }
    
    @IBAction func cancelAction(_ sender: UIButton) {
        self.dismiss(animated: true,completion: nil)
    }
    
    @IBAction func confirmAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        confirmCompletion(true)
    }
    

}

extension UIViewController {
    
    func callCommonPopup(withStoryboardName storyboard: String, identifier: String) -> UIViewController {
        let vc = UIStoryboard(name: storyboard, bundle: nil).instantiateViewController(identifier: identifier)
        vc.modalPresentationStyle                       = .overFullScreen
        vc.modalTransitionStyle                         = .crossDissolve
        vc.providesPresentationContextTransitionStyle   = true
        vc.definesPresentationContext                   = true
        return vc
    }
    
    func dynamicAlert(titleMsg: String, descMsg: String, confirm: String, completion: @escaping CompletionBool = {_ in}) {
        let vc = callCommonPopup(withStoryboardName: "Main", identifier: "DynamicAlertVC") as! DynamicAlertVC
        vc.modalPresentationStyle = .custom
        vc.modalTransitionStyle = .crossDissolve
        vc.providesPresentationContextTransitionStyle = true
        vc.definesPresentationContext = true
        
        vc.titleMess = titleMsg
        vc.descMess = descMsg
        vc.confirmString = confirm
        
        vc.confirmCompletion = { _ in
            completion(true)
        }
        
        self.present(vc, animated: true)
    }
    
}
