//
//  NetworkManager.swift
//  ExchangeRates
//
//  Created by Дмитрий Татаринцев on 15.12.2021.
//

import Foundation

class NetworkManager {
    
   static let shared = NetworkManager()
   
    private init () {}
    
    func fetchData(_ completion: @escaping (CurrencyRates, [Valute]) -> Void) {
        
        let jsonURL = "https://www.cbr-xml-daily.ru/daily_json.js"
        guard let url = URL(string: jsonURL) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error { print(error); return }
            guard let data = data else { return }
            
            do {
                let currencyRates = try JSONDecoder().decode(CurrencyRates.self, from: data)
                let rates = currencyRates.Valute.map { $0.value }
                completion(currencyRates, rates)
            } catch let jsonError {
                print("Ошибка получения данных:", jsonError)
            }
        }.resume()
    }
}
