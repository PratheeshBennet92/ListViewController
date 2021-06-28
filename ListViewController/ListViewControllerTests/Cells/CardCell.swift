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
  func configure(_ dataType: TestListUIModel?) {
    self.textLabel?.text = dataType?.name
  }
}
