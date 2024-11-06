//
//  GameViewController.swift
//  CatchAang
//
//  Created by Canan Yavuz on 5.11.2024.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highscoreLabel: UILabel!
    
    @IBOutlet weak var imageview: UIImageView!
    
    var timer = Timer()
    var coortimer = Timer()
    var count = 10
    var score = 0
    var highscore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        highscore = UserDefaults.standard.integer(forKey: "highscore")
        highscoreLabel .text = "Highscore: \(highscore)"
        scoreLabel.text = "Score: 0"
        imageview.isUserInteractionEnabled = true
        play()
        
    }
    
    func play() {
        count = 10
        timeLabel.text = "10"
        score = 0
        scoreLabel.text = "Score: \(score)"

        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        coortimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(setCoordinates), userInfo: nil, repeats: true)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureAction))
        imageview.addGestureRecognizer(tapGesture)
        
        UserDefaults.standard.set(highscore, forKey: "highscore")
        
    }
    
    @objc func tapGestureAction() {
        score += 1
        scoreLabel.text = "Score: \(score)"
        if highscore < score {
            highscore = score
            highscoreLabel.text = "Highscore: \(highscore)"
        }
    }
    
    @objc func updateTime() {
        
        count -= 1
        timeLabel.text = "\(count)"
        
        if count == 0 {
            
            showAlert()
            timer.invalidate()
            coortimer.invalidate()
        }
        
    }
    
    @objc func setCoordinates() {
        for _ in 0...10 {
            let x = Int.random(in: 16..<257)
            let y = Int.random(in: 210..<561)
            imageview.frame = CGRect(x: x, y: y, width: 120, height: 120)
        }
        
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Time's Up", message: "Your score is \(score). Do you want to play again?", preferredStyle: .alert)
        let action = UIAlertAction(title: "Play Again", style: .default, handler: { _ in
            self.play()
        })
        let action2 = UIAlertAction(title: "Quit", style: .destructive, handler: { _ in
            self.imageview.isUserInteractionEnabled = false
        })
        alert.addAction(action)
        alert.addAction(action2)
        self.present(alert, animated: true, completion: nil)
    }
    
    
}
