import ListViewController
struct TestListUIModel: ListUIModel, Codable {
  var identifier: String? = String(describing: Self.self)
  var name: String?
}
