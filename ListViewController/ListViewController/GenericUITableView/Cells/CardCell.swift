//
//  CardCell.swift
//  ListViewControllerSampleApp
//
//  Created by Pratheesh on 6/28/21.
//

import UIKit
import ListViewController
class CardCell: UITableViewCell, DynamicDataCell {
  var buttonPressedAction: ((TestListUIModel?) -> Void)?
  
  typealias DataType = TestListUIModel
  

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  func configure(_ dataType: TestListUIModel?) {
    self.textLabel?.text = dataType?.name
  }
  

}
