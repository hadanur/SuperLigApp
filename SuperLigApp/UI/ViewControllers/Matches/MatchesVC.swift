//
//  ViewController.swift
//  SuperLigApp
//
//  Created by Hakan Adanur on 17.11.2022.
//

import UIKit

class MatchesVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var viewModel = MatchesViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        viewModel.fetchRounds()
        viewModel.delegate = self
    }
}

extension MatchesVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rounds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toMatchesTableViewCell") as! MatchesTableViewCell
        let data = viewModel.rounds[indexPath.row]
        cell.roundLabel.text = "Round \(data)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toFixturesVC", sender: nil)
    }
}

extension MatchesVC: MatchesVMDelegate {
    
    func fetchRoundsOnSuccess() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func fetchRoundsOnUnsuccess() {
        DispatchQueue.main.async {
            self.showAlert(title: "Error", message: "Try Again Later")
        }
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }
}
