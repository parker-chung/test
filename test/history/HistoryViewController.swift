//
//  HistoryViewController.swift
//  test
//
//  Created by Parker Chung on 2021/5/3.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var historyTable: UITableView!
    var historyDateArr: [String]!
    var historyScoreArr: [String]!
    var histories: [HistoryData] = []
    let api = ApiManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        historyTable.delegate = self
        historyTable.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        api.history(token: UserDefaults.standard.string(forKey: "token")!, finish:{ historyModel in
            self.historyData(data: historyModel)
            self.historyTable.reloadData()
        }, error: {
            print("Failed to get histories..")
        })
    }
    
    
    
    func historyData (data: HistoryModel) {
        DispatchQueue.main.async {
            self.histories = data.data
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return histories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyCell") as! HistoryTableViewCell
        cell.historyDate.text = histories[indexPath.row].created_at
        cell.historyScore.text = String(histories[indexPath.row].score)
        return cell
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
