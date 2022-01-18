//
//  WeatherReport.swift
//  ForecastApp
//
//  Created by Marzena Frąk on 01/12/2021.
//

import UIKit

struct WeatherReport: Decodable {
    
    let name: String
    let temperaturaCencjus: TemperaturaC
    let descriptionWeather: [WeatherDesctription]
    
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case temperaturaCencjus = "main"
        case descriptionWeather = "weather"
    }
    
    var condtionImage: UIImage? {
        guard let mainCondtion = descriptionWeather.first else { return nil }
        
        switch mainCondtion.id {
        case 200...299: return #imageLiteral(resourceName: "thunder")
        case 300...399: return #imageLiteral(resourceName: "drizzle")
        case 500...599: return #imageLiteral(resourceName: "rain")
        case 600...699: return #imageLiteral(resourceName: "snow-1")
        case 700...799: return #imageLiteral(resourceName: "atmosphere")
        case 800: return #imageLiteral(resourceName: "sunny")
            
            
        default: return nil
        }
    }
}

struct TemperaturaC: Decodable {
    
    let temperture: Double
    private enum CodingKeys: String, CodingKey {
        case temperture = "temp"
    }
}

struct WeatherDesctription: Decodable {
    let id: Int
    let description: String
}


