//
//  ModalViewController.swift
//  the farm
//
//  Created by arina on 11.05.2023.
//

import UIKit


class ModalViewController: UIViewController {
    
    let timeCounter = UILabel()
    let plusButton = UIButton()
    let minusButton = UIButton()
    let startButton = UIButton()
    var timerPage: TimerPageViewController? = nil;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.8, green: 0.52, blue: 0.19, alpha: 1.0)
        view.layer.cornerRadius = 10.0
        
        timeCounter.frame = CGRect(x: 0, y: 20, width: UIScreen.main.bounds.width*0.8, height: UIScreen.main.bounds.width*0.20)
        timeCounter.textAlignment = .center
        timeCounter.text = "10:00"
        timeCounter.textColor = UIColor.white
        timeCounter.font = UIFont.systemFont(ofSize: 60, weight: .ultraLight)
        view.addSubview(timeCounter)
        
        plusButton.setTitle("+10", for: .normal)
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        plusButton.backgroundColor = UIColor(red: 0.91, green: 0.68, blue: 0.49, alpha: 1.0)
        plusButton.layer.cornerRadius = 10
        plusButton.addTarget(self, action: #selector(ModalViewController.increaseTime), for: .touchUpInside)
        view.addSubview(plusButton)
        
        minusButton.setTitle("-10", for: .normal)
        minusButton.translatesAutoresizingMaskIntoConstraints = false
        minusButton.backgroundColor = UIColor(red: 0.91, green: 0.68, blue: 0.49, alpha: 1.0)
        minusButton.layer.cornerRadius = 10
        minusButton.addTarget(self, action: #selector(ModalViewController.reduceTime), for: .touchUpInside)
        view.addSubview(minusButton)
        
        startButton.setTitle("Начать", for: .normal)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.backgroundColor = UIColor(red: 0.91, green: 0.68, blue: 0.49, alpha: 1.0)
        startButton.layer.cornerRadius = 10
        startButton.addTarget(self, action: #selector(ModalViewController.startSession), for: .touchUpInside)
        view.addSubview(startButton)
        
        NSLayoutConstraint.activate([
            plusButton.topAnchor.constraint(equalTo: timeCounter.bottomAnchor, constant: 20),
            plusButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            plusButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5, constant: -30),
            plusButton.heightAnchor.constraint(equalToConstant: 45),
            
            minusButton.topAnchor.constraint(equalTo: timeCounter.bottomAnchor, constant: 20),
            minusButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            minusButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5, constant: -30),
            minusButton.heightAnchor.constraint(equalToConstant: 45),
            
            startButton.topAnchor.constraint(equalTo: plusButton.bottomAnchor, constant: 10),
            startButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            startButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1, constant: -40),
            startButton.heightAnchor.constraint(equalToConstant: 45),
        ])
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        view.frame = CGRect(x: UIScreen.main.bounds.width*0.1,
                            y: view.center.y - UIScreen.main.bounds.width*0.31,
                            width: UIScreen.main.bounds.width*0.8,
                            height: UIScreen.main.bounds.width*0.62)
    }
    
    @objc
    func reduceTime() {
        if let currentTime = timeCounter.text?.components(separatedBy: ":")[0] {
            var minutesCount = Int(currentTime)!
            if (minutesCount > 10) {
                minutesCount -= 10
                timeCounter.text = String(minutesCount) + ":00"
            }
        }
    }
    
    @objc
    func increaseTime() {
        if let currentTime = timeCounter.text?.components(separatedBy: ":")[0] {
            var minutesCount = Int(currentTime)!
            if (minutesCount < 120) {
                minutesCount += 10
                timeCounter.text = String(minutesCount) + ":00"
            }
        }
    }
    @objc
    func startSession() {
        timerPage?.startSession(duration: timeCounter.text)
        dismiss(animated: true, completion: nil)
    }
}
