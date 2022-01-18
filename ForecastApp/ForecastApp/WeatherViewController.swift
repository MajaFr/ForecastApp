//
//  WeatherViewController.swift
//  ForecastApp
//
//  Created by Marzena Frąk on 29/11/2021.
//

import UIKit

class WeatherViewController: UIViewController {

    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var imageWeather: UIImageView!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var weatherReport: WeatherReport!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let weatherReport = weatherReport else { return }
        cityLabel.text = "City : " + weatherReport.name
        imageWeather.image = weatherReport.condtionImage
        tempLabel.text = "\(weatherReport.temperaturaCencjus.temperture) °C"
        descriptionLabel.text = weatherReport.descriptionWeather.first?.description

    }
    
}
