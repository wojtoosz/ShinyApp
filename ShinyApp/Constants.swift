//
//  Constants.swift
//  ShinyApp
//
//  Created by Wojciech Charuza on 07.11.2016.
//  Copyright © 2016 Wojciech Charuza. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "9a2e5b02b2664695d03a9cebbed3e303"
let UNITS = "&units=metric"
let LANG = "&lang=pl"

typealias DownloadComplete = () ->()

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)23\(LONGITUDE)45\(UNITS)\(LANG)\(APP_ID)\(API_KEY)"

