//
//  ViewController.swift
//  ListViewControllerSampleApp
//
//  Created by Pratheesh on 6/26/21.
//

import UIKit
import ListViewController

class ViewController: UIViewController {
  private lazy var listView: ListViewController<CardCell, TestListUIModel> = {
    let viewModel = ListViewModel()
    let view = ListViewController<CardCell, TestListUIModel>(viewModel: viewModel)
    view.view.translatesAutoresizingMaskIntoConstraints  = false
    return view
  }()
  override func viewDidLoad() {
    super.viewDidLoad()
    addListView()
    // Do any additional setup after loading the view.
  }
  private func addListView() {
    self.addChild(listView)
    self.view.addSubview(listView.view)
    listView.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
    listView.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
    listView.view.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
    listView.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
    listView.didMove(toParent: self)
  }
}

