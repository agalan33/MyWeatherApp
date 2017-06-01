//
//  ViewController.swift
//  MyWeather
//
//  Created by Adahid Galan on 5/28/17.
//  Copyright © 2017 Android bytes Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var todayTempLabel: UILabel!
    @IBOutlet weak var myLocationLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var currentType: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var weatherTypeState: UILabel!
    var currentWeather :CurrentWeather!
    var forecast: Forecast!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        currentWeather = CurrentWeather()
        
        currentWeather.downloadWeatherDetails {
            //Setup UI to load weather data
            self.updateMainUI()
        }
        
        
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath)
        return cell
    }
    
    func updateMainUI(){
        dateLabel.text = currentWeather.date
        todayTempLabel.text = "\(currentWeather.currentTemp)"
        weatherTypeState.text = currentWeather.weatherType
        myLocationLabel.text = currentWeather.cityName
        weatherImage.image = UIImage(named: currentWeather.weatherType)
        
    }

}

