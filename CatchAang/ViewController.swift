//
//  ViewController.swift
//  CatchAang
//
//  Created by Canan Yavuz on 5.11.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var highscoreLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    var highScore = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        highScore = UserDefaults.standard.integer(forKey: "highscore")
        highscoreLabel.text = "Highscore: \(highScore)"
    }
    
    
}

