//
//  FixturesVC.swift
//  SuperLigApp
//
//  Created by Hakan Adanur on 17.11.2022.
//

import UIKit

class FixturesVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var viewModel = FixtureViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        viewModel.delegate = self
        viewModel.fetchFixtures()
    }
}

extension FixturesVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.matches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toFixturesTableViewCell") as! FixturesTableViewCell
        let data = viewModel.matches[indexPath.row]
        cell.resultsLabel.text = "\(data.team1) \(data.score.ft[0]) - \(data.score.ft[1]) \(data.team2)"
        return cell
    }
}

extension FixturesVC: FixtureVMDelegate {
    
    func fetchFixturesOnSuccess() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func fetchFixturesOnUnsuccess() {
        DispatchQueue.main.async {
            self.showAlert(title: "Error", message: "Try Again")
        }
    }
    }
