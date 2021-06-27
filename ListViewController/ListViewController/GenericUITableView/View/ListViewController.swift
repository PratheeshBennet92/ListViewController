import UIKit
public class ListViewController<Cell: DynamicDataCell, DataType: ListUIModel>: UIViewController where Cell: UITableViewCell {
  // MARK: Property Declrations
  public var selectedCallback: ((ListUIModel) -> Void)?
  var viewModel: ListViewModelProtocol?
  public lazy var listTableView: UITableView = {
    let table = UITableView()
    table.translatesAutoresizingMaskIntoConstraints = false
    table.separatorStyle = .none
    return table
  }()
  public var listDataSource: ListTableViewDataSource<Cell, DataType>?
  public var listDelegate: ListTableViewDelegate?
  // MARK: Lifecycle Methods
  public override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
  }
  public override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationController?.navigationBar.isHidden = true
    configureTable()
    addTableView()
  }
  public override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }
  public override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
  }
  init() {
    super.init(nibName: nil, bundle: nil)
  }
  public convenience init(viewModel: ListViewModelProtocol) {
    self.init()
    self.viewModel = viewModel
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  deinit {
  }
  // MARK: Table Configuration
  private func configureTable() {
    listTableView.register(UINib(nibName: String(describing: Cell.self), bundle: nil), forCellReuseIdentifier: String(describing: Cell.self))
    listDataSource = ListTableViewDataSource<Cell, DataType>(delegate: self)
    listDataSource?.dataSource = viewModel?.outputModel
    listTableView.rowHeight = UITableView.automaticDimension
    listDelegate = ListTableViewDelegate(delegate: self)
    listTableView.dataSource = listDataSource
    listTableView.delegate = listDelegate
    listTableView.tableFooterView = UIView()
    listTableView.backgroundColor = UIColor.white
  }
  // MARK: Add subviews
  private func addTableView() {
    listTableView.translatesAutoresizingMaskIntoConstraints = false
    self.view.addSubview(listTableView)
    listTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: .zero).isActive = true
    listTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: .zero).isActive = true
    listTableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: .zero).isActive = true
    listTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: .zero).isActive = true
  }
  func reload() {
    listTableView.reloadData()
  }
}
extension ListViewController: ListDataSource {
  
}
extension ListViewController: ListDelegates {
  func didSelectionOfRow(_ indexPath: IndexPath) {
    if let selectedModel = listDataSource?.dataSource?[indexPath.row] {
    selectedCallback?(selectedModel)
    }
  }
}

