import ListViewController
import Foundation
class ListViewModel: ListViewModelProtocol {
  var outputModel: [ListUIModel]? = [TestListUIModel(name: "Test Cell 1"),
                                     TestListUIModel(name: "TestCell 2")]
}
