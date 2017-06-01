//
//  CurrentWeather.swift
//  MyWeather
//
//  Created by Adahid Galan on 5/28/17.
//  Copyright © 2017 Android bytes Apple. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
    
    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _currentTemp: Double!
    
    var cityName: String{
        if _cityName == nil{
            _cityName = ""
        }
        return _cityName
    }
    
    var date: String!{
        if _date == nil{
            _date = ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        return _date
        
    }
    var weatherType: String{
        if _weatherType == nil{
            _weatherType = ""
        }
        return _weatherType
    }
    var currentTemp: Double{
        if _currentTemp == nil{
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    func downloadWeatherDetails(completed: DownloadComplete){
        //Alamofire where to download from//
        
        let currentWeather = URL(string: CURRENT_WEATHER_URL)!
        Alamofire.request(currentWeather).responseJSON {response in
            let result = response.result
            if let dic = result.value as? Dictionary<String, AnyObject>{
                if let name = dic["name"] as? String{
                    self._cityName = name.capitalized
                }
                if let weather = dic["weather"] as? [Dictionary<String, AnyObject>]{
                    if let main = weather[0]["main"] as? String{
                        self._weatherType = main.capitalized
                    }
                }
                if let main = dic["main"] as? Dictionary<String, AnyObject>{
                    if let currentTemperature = main["temp"] as? Double{
                        let kelvinToFarenheitPre = (currentTemperature*(9/5) - 459.67)
                        let kelvinToFarenheit = Double(round(10*kelvinToFarenheitPre/10))
                        self._currentTemp = kelvinToFarenheit
                    }
                }
            }
        }
            completed()
    }
}
