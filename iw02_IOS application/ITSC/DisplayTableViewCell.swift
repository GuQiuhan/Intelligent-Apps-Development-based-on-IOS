//
//  DisplayTableViewCell.swift
//  ITSC
//
//  Created by nju on 2021/11/14.
//

import UIKit

//控制每一个tableViewCell

class DisplayTableViewCell: UITableViewCell {

    
    @IBOutlet weak var date:UILabel!//关联日期
    @IBOutlet weak var title:UILabel!//关联标题
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
