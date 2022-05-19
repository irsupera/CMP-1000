//
//  ViewController.swift
//  API
//
//  Created by IR Supera on 2022-05-18.
//  A00237146

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showGoTQoutes(_ sender: Any) {
        API_Helper.setURL(apiURL: "https://game-of-thrones-quotes.herokuapp.com/v1/random/10")
        API_Helper.fetchData { printString in
            print(printString)
        }
    }
    
    @IBAction func showTTCBus(_ sender: Any) {
        API_Helper.setURL(apiURL: "https://myttc.ca/finch_station.json")
        API_Helper.fetchData { printString in
            print(printString)
        }
    }
    
    @IBAction func showWeather(_ sender: Any) {
        API_Helper.setURL(apiURL: "https://weatherdbi.herokuapp.com/data/weather/canada")
        API_Helper.fetchData { printString in
            print(printString)
        }
    }
}

