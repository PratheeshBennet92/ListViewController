import Foundation
public protocol DynamicDataCell {
  associatedtype DataType
  func configure(_ dataType: DataType?)
  var buttonPressedAction: ((DataType?) -> Void)? { get set }
}
