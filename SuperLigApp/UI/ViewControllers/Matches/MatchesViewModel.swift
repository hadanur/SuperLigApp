//
//  MatchesViewModel.swift
//  SuperLigApp
//
//  Created by Hakan Adanur on 17.11.2022.
//

import Foundation

protocol MatchesVMDelegate {
    func fetchRoundsOnSuccess()
    func fetchRoundsOnUnsuccess()
    func reloadTableView()
}

class MatchesViewModel {
    var rounds = [Int]()
    let service = Webservice()
    var delegate: MatchesVMDelegate?
    
    func fetchRounds() {
        service.downloadMatches { result in
            
            if let result = result {
                
                for match in result.matches {
                    let index = match.round.index(of: " ")
                    var round = String(match.round[index!...])
                    
                    if round.count == 2 {
                        round = String(round.suffix(1))
                    } else {
                        round = String(round.suffix(2))
                    }
                    
                    self.rounds.append(Int(round) ?? 0)
                }
                
                self.rounds = Array(Set(self.rounds))
                self.rounds = self.rounds.sorted { $0 < $1 }
                self.delegate?.fetchRoundsOnSuccess()
            } else {
                
            }
//            if let result = result {
//                for match in result.matches {
//                    self.matches.append(match)
//                }
//                self.delegate?.fetchRoundsOnSuccess()
//            } else {
//                self.delegate?.fetchRoundsOnUnsuccess()
//            }
        }
    }

}
