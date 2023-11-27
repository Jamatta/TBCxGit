//
//  FactsListViewController.swift
//  catFact
//
//  Created by Nika Jamatashvili on 21.11.23.
//

import UIKit

final class FactsListViewController: UIViewController {
    private var viewModel = FactsListViewModel()
    
    private var facts = [Fact]()
    
    private let tableView: UITableView = {
           let tableView = UITableView()
           tableView.translatesAutoresizingMaskIntoConstraints = false
           return tableView
       }()
    
    struct Cells {
        static let factCells = "FactCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
        setupViewModelDelegate()
        configureTableView()
    }
    
    private func setupViewModelDelegate() {
        viewModel.delegate = self
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.rowHeight = 64
        tableView.register(CatFactCell.self, forCellReuseIdentifier: Cells.factCells)
        tableView.pin(to: view)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
    }
}

extension FactsListViewController: CatFactsListViewModelDelegate {
    func factFetched(_ facts: [Fact]) {
        self.facts = facts
        self.tableView.reloadData()
    }
    
    func showError(_ error: Error) {
        print("Ups!")
    }
}

extension FactsListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        facts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.factCells, for: indexPath) as! CatFactCell
        cell.set(with: facts[indexPath.row])
        return cell
    }
}
