//
//  ViewController.swift
//  test
//
//  Created by Parker Chung on 2021/3/29.
//

import UIKit

class UserProfileViewController: UIViewController {
    
    @IBOutlet weak var ProfilePicSegment: UISegmentedControl!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var userTotalQuestionAmount: UILabel!
    let api = ApiManager()
    
    @IBOutlet weak var testBtn: UIButton!
    
    // Create the alert controller
    var alertController = UIAlertController(title: "Error", message: "Failed to access user data", preferredStyle: .alert)

        // Create the actions
    let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
            UIAlertAction in
            NSLog("OK Pressed")
        }
    let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel) {
            UIAlertAction in
            NSLog("Cancel Pressed")
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        api.user(token: UserDefaults.standard.string(forKey: "token") ?? "Failed to get token", finish: userProfile, error: {
            self.present(self.alertController, animated: true, completion: nil)
                    print("Failed to access user data...")
        })
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        api.user(token: UserDefaults.standard.string(forKey: "token") ?? "Failed to get token", finish: userProfile, error: {
            self.present(self.alertController, animated: true, completion: nil)
                    print("Failed to access user data..")
        })
    }
    
    func userProfile(data: UserModel) {
        DispatchQueue.main.async {
            self.userName.text = "Name: "  + String(data.data.name)
            self.userEmail.text = "E-mail: " + String(data.data.email)
            self.userTotalQuestionAmount.text = "Total Question: " + String(data.data.total_question_amount ?? 0)
        }
    }
    
    
    @IBAction func selectedProfileSegment(_ sender: Any) {
        switch ProfilePicSegment.selectedSegmentIndex {
        case 0:
            profileImage.image = UIImage(named: "smilingShibaInu")
            break
        case 1:
            profileImage.image = UIImage(named: "shibaInuStickingTongue")
            break
        default:
        profileImage.image = UIImage(named: "smilingShibaInu")
            break
        }
    }
    
    
}

