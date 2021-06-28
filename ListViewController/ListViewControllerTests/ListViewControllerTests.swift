//
//  ListViewControllerTests.swift
//  ListViewControllerTests
//
//  Created by Pratheesh on 6/26/21.
//

import XCTest
@testable import ListViewController

class ListViewControllerTests: XCTestCase {
  private lazy var listView: ListViewController<CardCell, TestListUIModel> = {
    let viewModel = ListViewModel()
    let view = ListViewController<CardCell, TestListUIModel>(viewModel: viewModel)
    view.view.translatesAutoresizingMaskIntoConstraints  = false
    view.loadView()
    return view
  }()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
  func testNoOfRows() {
    XCTAssert(listView.listDataSource?.dataSource?.count == 2, "No of row test")
  }
  func testDidSelectRow() {
    let exp = expectation(description: "Loading Table")
    listView.selectedCallback = { model in
      switch model {
      case let testListUIModel as TestListUIModel:
        exp.fulfill()
        XCTAssert(testListUIModel.name == "Test Cell 1", "Did select Row")
      default:
        break;
      }
    }
    let indexPath = IndexPath(row: 0, section: 0)
    listView.listTableView.selectRow(at: indexPath, animated: true, scrollPosition: .bottom)
    listView.listTableView.delegate?.tableView!(listView.listTableView, didSelectRowAt: indexPath)
    waitForExpectations(timeout: 0.5)
  }
  func testCellForRow() {
    let indexPath = IndexPath(row: 0, section: 0)
    let cell = listView.listTableView.dataSource?.tableView(listView.listTableView, cellForRowAt: indexPath)
    (cell as? CardCell)?.textLabel?.text = "Test Cell 1"
    XCTAssert( (cell as? CardCell)?.textLabel?.text == "Test Cell 1", "Cell for Row")
    
  }
}
