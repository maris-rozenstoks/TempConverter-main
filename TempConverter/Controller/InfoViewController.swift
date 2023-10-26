//
//  InfoViewController.swift
//  TempConverter
//
//  Created by maris.rozenstoks on 26/10/2023.
//

import UIKit

class InfoViewController: UIViewController {
    
    
    @IBOutlet weak var textLabelCelsius: UILabel!
    @IBOutlet weak var textLabelKelvinFahrenheit: UILabel!
    
    @IBOutlet weak var closeButton: UIButton!
    
    var resultTextCelsius: String?
    var resultTextKelvinFahrenheit: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabelCelsius.text = resultTextCelsius
        textLabelKelvinFahrenheit.text = resultTextKelvinFahrenheit
        // Do any additional setup after loading the view.
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
