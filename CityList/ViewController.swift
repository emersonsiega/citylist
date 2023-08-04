//
//  ViewController.swift
//  CityList
//
//  Created by emersonsiega on 03/08/23.
//

import UIKit

struct Constants {
    static let cellName = "CityCell"
}

class ViewController: UIViewController {
    
    @IBOutlet var citiesTableView: UITableView!
    
    let cities: [String] = [
        "Rio de Janeiro", "London", "Tokyo", "New York", "Buenos Aires",
        "Roma", "Barcelona", "Los Angeles", "San Francisco", "Paris",
    ]
    let countries: [String:String] = [
        "Rio de Janeiro": "Brazil", "London": "England", "Tokyo": "Japan", "New York": "EUA",
        "Buenos Aires": "Argentina", "Roma": "Italy", "Barcelona": "Spain", "Los Angeles": "EUA",
        "San Francisco": "EUA", "Paris": "France",
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        citiesTableView.register(
            UITableViewCell.self,
            forCellReuseIdentifier: Constants.cellName
        )
        
        citiesTableView.dataSource = self
        citiesTableView.delegate = self
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.cellName,
            for: indexPath
        )
        
        var content = cell.defaultContentConfiguration()
        let city = cities[indexPath.row]
        content.text = city
        content.secondaryText = countries[city] ?? "Unknown"
        cell.contentConfiguration = content
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let cityName = cities[indexPath.row]
        let country = countries[cityName] ?? ""
        print("City name \(cityName) at country \(country)")
    }
}
