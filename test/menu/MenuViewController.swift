//
//  MenuViewController.swift
//  test
//
//  Created by Parker Chung on 2021/4/12.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var drinkImageArr: [UIImage]!
    var drinkNameArr: [String]!
    var drinkPriceArr: Array<String>!
    @IBOutlet weak var menuTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuTable.delegate = self
        menuTable.dataSource = self
        drinkImageArr = [UIImage(named: "bubbleMilkTea")!, UIImage(named: "lemonJuice")!, UIImage(named: "matchaMilkTea")!]
        drinkNameArr = ["Bubble Milk Tea", "Lemon Juice", "Matcha Milk Tea"]
        drinkPriceArr = ["60", "50", "70"]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drinkImageArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell") as! MenuTableViewCell
        cell.drinkImage.image = drinkImageArr[indexPath.row]
        cell.drinkName.text = drinkNameArr[indexPath.row]
        cell.drinkPrice.text = drinkPriceArr[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Name: \(drinkNameArr[indexPath.row])\n Price: \(drinkPriceArr[indexPath.row])")
        let alert = UIAlertController(title: "Drink", message: "\(drinkNameArr[indexPath.row])", preferredStyle: .alert)
        let okBtn = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okBtn)
        present(alert, animated: true, completion: nil)
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
