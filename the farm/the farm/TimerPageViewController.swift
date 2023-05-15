//
//  ViewController.swift
//  the farm
//
//  Created by arina on 05.05.2023.
//

import UIKit


class TimerPageViewController: UIViewController {
    var progressBar: CircularProgressBar!
    var timer: TimerComponent!
    var animalPic: AnimalPic!
    var controlButton = UIButton()
    var timerState = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.82, green: 0.61, blue: 0.41, alpha: 1.0)
                
        
        progressBar = CircularProgressBar(frame: CGRect(x: view.center.x - UIScreen.main.bounds.width*0.7/2, y: view.center.y - UIScreen.main.bounds.width*0.7/2, width: UIScreen.main.bounds.width*0.7, height: UIScreen.main.bounds.width*0.7))
        view.addSubview(progressBar)
        
        timer = TimerComponent(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50), timeInMinutes: 10, progressBar: self.progressBar)
        timer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(timer)
        
        controlButton.frame = CGRect(x: 0, y: 0, width: 300, height: 50)
        controlButton.layer.cornerRadius = 10.0
        controlButton.setTitle("Начать", for: .normal)
        controlButton.backgroundColor = UIColor(red: 0.91, green: 0.68, blue: 0.49, alpha: 1.0)
        controlButton.addTarget(self, action: #selector(TimerPageViewController.sessionSettings), for: .touchUpInside)
        controlButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(controlButton)
        
        NSLayoutConstraint.activate([
            timer.topAnchor.constraint(equalTo: progressBar.bottomAnchor, constant: 60),
            controlButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            controlButton.topAnchor.constraint(equalTo: timer.topAnchor, constant: 80),
            controlButton.widthAnchor.constraint(equalToConstant: 150),
            controlButton.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        animalPic = AnimalPic(frame: CGRect(x: view.center.x - UIScreen.main.bounds.width*0.5/2, y: view.center.y - UIScreen.main.bounds.width*0.5/2, width: UIScreen.main.bounds.width*0.5, height: UIScreen.main.bounds.width*0.5))
        animalPic.setImage()
        view.addSubview(animalPic)

    }
    
    @objc func sessionSettings() {
        let vc = ModalViewController()
        vc.timerPage = self
        vc.modalPresentationStyle = .custom
        vc.view.frame = CGRect(x: 0, y: 0, width: vc.preferredContentSize.width, height: vc.preferredContentSize.height)
        present(vc, animated: true, completion: nil)
    }
    
    @objc
    func startSession(duration: String?) {
        if let currentTime = duration?.components(separatedBy: ":")[0] {
            let duration = Int(currentTime)!
            timer.setDuration(duration: duration)
            timer.startTimer()
            controlButton.setTitle("Остановить", for: .normal)
            controlButton.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
            controlButton.setTitleColor(UIColor(red: 0.7, green: 0.7, blue: 0.7, alpha: 1.0), for: .normal)
            controlButton.removeTarget(self, action: #selector(TimerPageViewController.sessionSettings), for: .touchUpInside)
            controlButton.addTarget(self, action: #selector(TimerPageViewController.updateButton), for: .touchUpInside)
        }
    }
    @objc
    func updateButton() {
        timer.stopTimer()
        timer.setDuration(duration: 10)
        progressBar.animateProgress(withDuration: 10, progress: 0.00)
        controlButton.setTitle("Начать", for: .normal)
        controlButton.backgroundColor = UIColor(red: 0.91, green: 0.68, blue: 0.49, alpha: 1.0)
        controlButton.setTitleColor(UIColor.white, for: .normal)
        controlButton.addTarget(self, action: #selector(TimerPageViewController.sessionSettings), for: .touchUpInside)
    }
}

