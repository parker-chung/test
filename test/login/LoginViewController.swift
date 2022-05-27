//
//  LoginViewController.swift
//  test
//
//  Created by Parker Chung on 2021/4/12.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var account: UITextField!
    @IBOutlet weak var password: UITextField!
    let api = ApiManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func login(_ sender: Any) {
        api.login(account: account.text!, password: password.text!, finish: { loginData in self.performSegue(withIdentifier: "login", sender: nil)
            UserDefaults.standard.set(loginData.data.token, forKey: "token")
        }, error: {
            print("login error")
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
