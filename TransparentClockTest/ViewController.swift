//
//  ViewController.swift
//  TransparentClockTest
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var textField: NSTextField!
    var myTimer = MyTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        myTimer.delegate = self
        myTimer.startTimer()
    }
    
}

extension ViewController: MyTimerProtocol {

  func timeRemainingOnTimer(_ timer: MyTimer, timeRemaining: TimeInterval) {
    updateDisplay(for: timeRemaining)
  }

  func timerHasFinished(_ timer: MyTimer) {
    updateDisplay(for: 0)
  }
}

extension ViewController {

    // MARK: - Display
    func updateDisplay(for timeRemaining: TimeInterval) {
      textField.stringValue = textToDisplay(for: timeRemaining)
    }

    private func textToDisplay(for timeRemaining: TimeInterval) -> String {
      if timeRemaining == 0 {
        return "Done!"
      }

      let minutesRemaining = floor(timeRemaining / 60)
      let secondsRemaining = timeRemaining - (minutesRemaining * 60)

      let secondsDisplay = String(format: "%02d", Int(secondsRemaining))
      let timeRemainingDisplay = "\(Int(minutesRemaining)):\(secondsDisplay)"

      return timeRemainingDisplay
    }
}
