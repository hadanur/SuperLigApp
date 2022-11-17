//
//  ClubsViewModel.swift
//  SuperLigApp
//
//  Created by Hakan Adanur on 17.11.2022.
//

import Foundation

protocol ClubsVMDelegate {
    func fetchClubsOnSuccess()
    func fetchClubsOnUnSuccess()
}

class ClubsViewModel {
    let service = Webservice()
    var clubs = [Club]()
    var delegate: ClubsVMDelegate?
    
    func fetchClubs() {
        service.downloadClubs { result in
            if let result = result {
                for club in result.clubs {
                    self.clubs.append(club)
                }
                self.delegate?.fetchClubsOnSuccess()
            } else {
                self.delegate?.fetchClubsOnUnSuccess()
            }
        }
    }
}


