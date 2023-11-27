//
//  breedsListViewController.swift
//  catFact
//
//  Created by Nika Jamatashvili on 28.11.23.
//

import UIKit

final class BreedsListViewController: UIViewController {
    private var viewModel = BreedsListViewModel()
    private var breeds = [Breed]()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    struct Cells {
        static let breedCell = "BreedCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.viewDidLoad()
        configureTableView()
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.register(BreedCell.self, forCellReuseIdentifier: Cells.breedCell)
        tableView.pin(to: view)
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension BreedsListViewController: BreedsListViewModelDelegate {
    func breedsFetched(_ breeds: [Breed]) {
        self.breeds = breeds
        self.tableView.reloadData()
    }
    
    func showError(_ error: Error) {
        print("Error: \(error.localizedDescription)")
    }
}

extension BreedsListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return breeds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.breedCell, for: indexPath) as! BreedCell
        cell.configure(with: breeds[indexPath.row])
        return cell
    }
}

