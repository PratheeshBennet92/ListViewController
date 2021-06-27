import UIKit
protocol ListDelegates: AnyObject {
  func didSelectionOfRow(_ indexPath: IndexPath)
}
public class ListTableViewDelegate: NSObject, UITableViewDelegate, UIScrollViewDelegate {
  // MARK: Property Declrations
  weak var delegate: ListDelegates?
  // MARK: Methods
  init(delegate: ListDelegates) {
    self.delegate = delegate
  }
  public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    self.delegate?.didSelectionOfRow(indexPath)
  }
}
