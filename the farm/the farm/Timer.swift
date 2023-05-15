import UIKit

class TimerComponent: UIView {

    let timerLabel = UILabel()
    
    var progressBar: CircularProgressBar?
    var timer: Timer?
    var timeLeft: Int
    var timeFormat: String
    var startTime: Int
    
    init(frame: CGRect, timeInMinutes: Int, progressBar: CircularProgressBar) {
        self.progressBar = progressBar
        self.startTime = timeInMinutes * 60
        self.timeLeft = startTime
        let minutes = timeLeft%60 < 10 ? "0" + String(timeLeft%60) : String(timeLeft%60)
        self.timeFormat = String(timeLeft/60) + ":" + String(minutes)
        super.init(frame: frame)
        setupTimer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupTimer() {
        let fullWidth = UIScreen.main.bounds.width
        timerLabel.frame = CGRect(x: 0, y: 0, width: fullWidth, height: 90)
        timerLabel.center = center
        timerLabel.textAlignment = .center
        timerLabel.text = timeFormat
        timerLabel.font = UIFont.systemFont(ofSize: 90, weight: .ultraLight)
        timerLabel.textColor = UIColor.white
        timerLabel.numberOfLines = 0
        addSubview(timerLabel)
    }

    @objc
    func setDuration(duration: Int) {
        startTime = duration * 60
        timeLeft = duration * 60
        let minutes = timeLeft%60 < 10 ? "0" + String(timeLeft%60) : String(timeLeft%60)
        timeFormat = String(timeLeft/60) + ":" + String(minutes)
        timerLabel.text = timeFormat
    }
    
    // Обновление таймера
    @objc
    func updateTimer() {
        timeLeft -= 1
        let minutes = timeLeft%60 < 10 ? "0" + String(timeLeft%60) : String(timeLeft%60)
        timeFormat = String(timeLeft/60) + ":" + String(minutes)
        timerLabel.text = timeFormat
        progressBar?.animateProgress(withDuration: 1, progress: Float((Float(startTime-timeLeft))/Float(startTime)))
        
        if timeLeft == 0 { stopTimer() }
    }

    // Запуск таймера
    @objc
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }

    // Остановка таймера
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}
