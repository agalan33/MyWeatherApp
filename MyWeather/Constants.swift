//
//  Constants.swift
//  MyWeather
//
//  Created by Adahid Galan on 5/28/17.
//  Copyright © 2017 Android bytes Apple. All rights reserved.
//

import Foundation

let Base_URL = "http://api.openweathermap.org/data/2.5/weather?"
let lat = "lat="
let lon = "&lon="
let App_ID = "&appid="
let API_KEY = "e22ae0c978a400f7e2b4ad612252cfc3"

typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "\(Base_URL)\(lat)18.14\(lon)-67.1\(App_ID)\(API_KEY)"

var urll = "http://api.openweathermap.org/data/2.5/weather?lat=37.7921494&lon=-122.3688785&appid=e22ae0c978a400f7e2b4ad612252cfc3"
