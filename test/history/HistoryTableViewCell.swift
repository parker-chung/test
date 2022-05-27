//
//  HistoryTableViewCell.swift
//  test
//
//  Created by Parker Chung on 2021/5/3.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var historyDate: UILabel!
    @IBOutlet weak var historyScore: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override var frame: CGRect {
        get {
            return super.frame
        }
        set (newFrame) {
            var frame =  newFrame
            frame.origin.y += 10
            frame.size.height -= 2 * 5
            super.frame = frame
        }
      }
    
}
