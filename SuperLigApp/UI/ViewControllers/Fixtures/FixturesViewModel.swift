//
//  FixturesViewModel.swift
//  SuperLigApp
//
//  Created by Hakan Adanur on 17.11.2022.
//

import Foundation

protocol FixtureVMDelegate {
    func fetchFixturesOnSuccess()
    func fetchFixturesOnUnsuccess()
}

class FixtureViewModel {
    let service = Webservice()
    var matches = [Match]()
    var delegate: FixtureVMDelegate?
    var choosenRound: String?
    
    
    func fetchFixtures() {
        service.downloadMatches { result in
            if let result = result {
                for match in result.matches {
                    if match.round == self.choosenRound {
                        self.matches.append(match)
                    }
                }
                self.delegate?.fetchFixturesOnSuccess()
            } else {
                self.delegate?.fetchFixturesOnUnsuccess()
            }
        }
    }
}
