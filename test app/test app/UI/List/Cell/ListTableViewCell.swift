//
//  ListTableViewCell.swift
//  test app
//
//  Created by Prefect on 27.10.2022.
//

import UIKit

class ListTableViewCell: UITableViewCell {
  @IBOutlet weak var idLabel: UILabel!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var descLabel: UILabel!

  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
