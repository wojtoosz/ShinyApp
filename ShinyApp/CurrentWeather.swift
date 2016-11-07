//
//  CurrentWeather.swift
//  ShinyApp
//
//  Created by Wojciech Charuza on 07.11.2016.
//  Copyright © 2016 Wojciech Charuza. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class CurrentWeather {
    
    private var _cityName: String!
    private var _date: String!
    private var _weatherType: String!
    private var _currentTemp: Double!
    
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "\(currentDate)"
        
        return _date
    }
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        
        let currentWeatherUrl = URL(string: CURRENT_WEATHER_URL)!
        Alamofire.request(currentWeatherUrl).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let name = dict["name"] as? String {
                    
                    self._cityName = name.capitalized
                    
                }
                
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                    
                    if let main = weather[0]["main"] as? String {
                        
                        self._weatherType = main.capitalized
                        print(self._weatherType)
                    
                    }
                }
                
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    
                    if let currentTemperature = main["temp"] as? Double {
                        
                        self._currentTemp = currentTemperature
                    }
                }
            }
            
        completed()   
        }
        
    }
    
    
    
    
    
    
    
    
    
    
}
