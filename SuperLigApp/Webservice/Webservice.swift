//
//  Webservice.swift
//  SuperLigApp
//
//  Created by Hakan Adanur on 17.11.2022.
//

import Foundation

class Webservice {
    
    func downloadMatches(completion : @escaping (MatchBase?) -> ()) {
        
        let url = URL(string: "https://raw.githubusercontent.com/openfootball/football.json/master/2019-20/tr.1.json")
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                do {
                    let matchlist = try JSONDecoder().decode(MatchBase.self, from: data)
                    completion(matchlist)
                } catch {
                    print(error.localizedDescription)
                    print(String(describing: error))
                }
            }
        }.resume()
    }
    
    func downloadClubs(completion : @escaping (Clubs?) -> ()) {
        
        let url = URL(string: "https://raw.githubusercontent.com/openfootball/football.json/master/2019-20/tr.1.clubs.json")
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                do {
                    let clublist = try JSONDecoder().decode(Clubs.self, from: data)
                    print(clublist)
                    completion(clublist)
                } catch {
                    print(error.localizedDescription)
                    print(String(describing: error))
                }
            }
        }.resume()
    }
}
