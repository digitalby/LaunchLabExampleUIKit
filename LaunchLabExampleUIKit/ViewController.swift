//
//  ViewController.swift
//  LaunchLabExampleUIKit
//
//  Created by Digital on 27/03/2024.
//

import UIKit

class ViewController: UIViewController {

    private let networkRepository: NetworkRepository
    private var page = 0
    private var currentTotalPages = 0
    private var currentItems = [Item]()

    private let tableView = UITableView(frame: .zero, style: .plain)

    init(networkRepository: NetworkRepository) {
        self.networkRepository = networkRepository
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ItemCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])

        fetchNewItems()
    }

    private func fetchNewItems() {
        Task {
            do {
                let items = try await networkRepository.getPage(page)
                currentItems.append(contentsOf: items.items)
                currentTotalPages = items.totalPages
                page += 1
                tableView.reloadData()
            } catch {
                showErrorAlert(error: error)
            }
        }
    }

    @MainActor
    private func showErrorAlert(error: Error) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        currentItems.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? ItemCell else {
            fatalError("Cell not found")
        }
        let item = currentItems[indexPath.row]
        cell.setData(title: item.name, description: item.description, energyGrade: item.grade)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = currentItems[indexPath.row]
        let alert = UIAlertController(title: item.description ?? "Description unavailable", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
