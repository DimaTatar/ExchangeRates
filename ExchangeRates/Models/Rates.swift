//
//  Rates.swift
//  ExchangeRates
//
//  Created by Дмитрий Татаринцев on 15.12.2021.
//


struct CurrencyRates: Decodable {
    let Date: String
    let Valute: [String: Valute]
}

struct Valute: Decodable {
    let NumCode: String
    let CharCode: String
    let Nominal: Int
    let Name: String
    let Value: Double
    let Previous: Double
}
