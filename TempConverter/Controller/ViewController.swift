//
//  ViewController.swift
//  TempConverter
//
//  Created by Arkadijs Makarenko on 26/10/2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var celsiusLabel: UILabel!
    @IBOutlet weak var convertedTempLabel: UILabel!
    @IBOutlet weak var tempSegementControl: UISegmentedControl!
    @IBOutlet weak var infoButton: UIBarButtonItem!
    @IBOutlet weak var tempSlider: UISlider! {
        didSet {
            tempSlider.value = 0
            tempSlider.minimumValue = 0
            tempSlider.maximumValue = 100
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTempLabelFromSlider(value: tempSlider.value)
    }
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        updateTempLabelFromSlider(value: tempSlider.value)
    }
    
    func updateTempLabelFromSlider(value: Float) {
        let celsiusValue = Int(value)
        celsiusLabel.text = "\(celsiusValue) °C"
        
        let (fahrenheit, kelvin) = convertTempFrom(celsius: celsiusValue)
        
        switch tempSegementControl.selectedSegmentIndex {
        case 0: // segment for Fahrenheit
            convertedTempLabel.text = "\(Int(fahrenheit)) °F"
        case 1: // segment for Kelvin
            convertedTempLabel.text = "\(Int(kelvin)) K"
        default:
            break
        }
    }
    
    func convertTempFrom(celsius: Int) -> (fahrenheit: Double, kelvin: Double) {
        let fahrenheit = Double(celsius) * 9.0/5.0 + 32.0
        let kelvin = Double(celsius) + 273.15
        return (fahrenheit, kelvin)
    }
    
    @IBAction func tempSegementControlSelect(_ sender: Any) {
        updateTempLabelFromSlider(value: tempSlider.value)
    }
    
    @IBAction func openInfoViewController(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let infoVC = storyboard.instantiateViewController(withIdentifier: "InfoViewController") as? InfoViewController {
            infoVC.resultTextCelsius = celsiusLabel.text
            infoVC.resultTextKelvinFahrenheit = convertedTempLabel.text
            self.present(infoVC, animated: true, completion: nil)
        }
    }
}


