//
//  TheaterCell.swift
//  MyMovieChart
//
//  Created by JinBae Jeong on 2020/11/16.
//

import UIKit

class TheaterCell: UITableViewCell {

  @IBOutlet weak var name: UILabel!
  @IBOutlet weak var tel: UILabel!
  @IBOutlet weak var addr: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
