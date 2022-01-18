//
//  ViewController.swift
//  ForecastApp
//
//  Created by Marzena Frąk on 29/11/2021.
// API KEY 830b0bdda9796570f8cd223cc2c4363e
//http://api.openweathermap.org/data/2.5/weather?q=Warsaw&units=metric&appid=830b0bdda9796570f8cd223cc2c4363e

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cityTextField: UITextField!
    
    @IBOutlet weak var entryButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityTextField.attributedPlaceholder = NSAttributedString(
            string: "Enter a city",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    }
    
    @IBAction func entryButtonAction(_ sender: UIButton) {
        
        guard cityTextField.text?.isEmpty == false else { return }
        
        var components = URLComponents(string: "http://api.openweathermap.org/data/2.5/weather")
        let cityQuery = URLQueryItem(name: "q", value: cityTextField.text)
        let unitsQuery = URLQueryItem(name: "units", value: "metric")
        let appIdQuery = URLQueryItem(name: "appid", value: "830b0bdda9796570f8cd223cc2c4363e")
        
        components?.queryItems = [cityQuery, unitsQuery, appIdQuery]
        
        guard let url = components?.url else { return }
        print(url.absoluteString)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url) { data, _, error  in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                do {
                    let weatherReport = try JSONDecoder().decode(WeatherReport.self, from: data)
                    print(weatherReport)
                    
                   DispatchQueue.main.async {
                        self.performSegue(withIdentifier:"segue.Main.enterCityToWeather", sender: weatherReport)
                    }
                    
                } catch {
                        print(error)
                }
            }
        }
        
        dataTask.resume()
    }
    
    @IBAction func returnToMainViewController(_ sender: UIStoryboardSegue) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if let weatherViewController = segue.destination as? WeatherViewController, let weatherReport = sender as? WeatherReport {
            weatherViewController.weatherReport = weatherReport
        }
    }
}

