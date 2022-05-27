//
//  RegisterViewController.swift
//  test
//
//  Created by Parker Chung on 2021/4/24.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var account: UITextField!
    @IBOutlet weak var password: UITextField!
    let api = ApiManager()
    
    var alertController = UIAlertController(title: "Notification", message: "", preferredStyle: .alert)
    lazy var okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {_ in
                                 CATransaction.setCompletionBlock({
                                    self.performSegue(withIdentifier: "register", sender: nil)
                                 })
                             })
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        alertController.addAction(okAction)
    }
    
    @IBAction func register(_ sender: Any) {
        api.register(name: name.text!, email: email.text!, account: account.text!, password: password.text!, finish: { registerData in
            self.alertController.message = "Successfully registered!"
            self.present(self.alertController, animated: true, completion: nil)
        }, error: {
            self.alertController.message = "Failed to register.."
            self.present(self.alertController, animated: true, completion: nil)
            print("register error")
        })
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
