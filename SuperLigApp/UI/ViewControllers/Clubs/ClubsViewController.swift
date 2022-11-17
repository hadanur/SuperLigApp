//
//  ClubsViewController.swift
//  SuperLigApp
//
//  Created by Hakan Adanur on 17.11.2022.
//

import UIKit

class ClubsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var viewModel = ClubsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        viewModel.delegate = self
        viewModel.fetchClubs()
    }
}

extension ClubsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.clubs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toClubsTableViewCell") as! ClubsTableViewCell
        let data = viewModel.clubs[indexPath.row]
        cell.clubNameLabel.text = data.name
        cell.countryLabel.text = data.country
        return cell
    }
}

extension ClubsViewController: ClubsVMDelegate {
    
    func fetchClubsOnSuccess() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func fetchClubsOnUnSuccess() {
        self.showAlert(title: "Error", message: "Try Again Later")
    }
}
