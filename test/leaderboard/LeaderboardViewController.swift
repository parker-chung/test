//
//  LeaderboardViewController.swift
//  test
//
//  Created by Parker Chung on 2021/6/5.
//

import UIKit

class LeaderboardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var ownUsername: UILabel!
    @IBOutlet weak var ownScore: UILabel!
    @IBOutlet weak var leaderboardTable: UITableView!
    var leaders: [LeaderData]!
    let api = ApiManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        leaderboardTable.delegate = self
        leaderboardTable.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        api.leaderboard(token: UserDefaults.standard.string(forKey: "token")!, finish: { leaderboardModel in
            self.leaderData(data: leaderboardModel)
            self.leaderboardTable.reloadData()
        }, error: { print("Failed to get leaderboard..")
        })
    }
    
    func leaderData (data: LeaderboardModel) {
        DispatchQueue.main.async {
            self.leaders = data.data.leaderboard
            self.ownUsername.text = data.data.own.user.name
            self.ownScore.text = String(data.data.own.score)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if leaders == nil {
            return 0
        }
        return leaders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "leaderboardCell") as! LeaderboardTableViewCell
        cell.name.text = leaders[indexPath.row].user.name
        cell.score.text = String(leaders[indexPath.row].score)
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
