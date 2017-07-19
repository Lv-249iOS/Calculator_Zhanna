//
//  KeyboardController.swift
//  Calculator
//
//  Created by Zhanna Moskaliuk on 6/28/17.
//  Copyright © 2017 Zhanna Moskaliuk. All rights reserved.
//

import UIKit

class KeyboardController: UIViewController {
    
    
    var touchedDigit: ((_ digit: Int) -> ())?
    var touchedSymbol: ((_ symbol: Int) -> ())?
    var additionalController: AdditionalController!
    
    @IBOutlet weak var additionalContainerView: UIView!
    
    @IBOutlet weak var additionalWidthConstraint: NSLayoutConstraint!
    
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(rotated), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
    }
    
    // MARK: IBActions
    
    @IBAction func touchDigit(button: UIButton) {
        touchedDigit?(button.tag)
        _touched(button: button)
    }
    
    @IBAction func touchSymbol (button : UIButton) {
        touchedSymbol?(button.tag)
        _touched(button: button)
    }
    
    // MARK: Animate buttons
    private func _touched(button: UIButton) {
        //        button.backgroundColor = UIColor.white.withAlphaComponent(0.1)
        //        button.layer.borderWidth = 2.0
        //        button.layer.borderColor = UIColor.white.cgColor
        //        button.layer.cornerRadius = 5.0
        //        button.layer.masksToBounds = true
        //        button.layer.backgroundColor = UIColor.gray.cgColor
        
        
        // learn the difference between FRAME and BOUNDS
        
        UIView.animate(withDuration: 0.19, animations: {
            button.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            button.layer.backgroundColor = UIColor.purple.withAlphaComponent(0.55).cgColor
        }, completion: { _ in
            UIView.animate(withDuration: 0.34) {
                button.transform = CGAffineTransform.identity
                button.layer.backgroundColor = UIColor.clear.cgColor
            }
        })
        
    }
    
    // MARK: Rotating AdditionalController
    func rotated() {
        additionalContainerView.isHidden = UIDevice.current.orientation.isPortrait
    }
    
    // MARK: Navigation of AdditionalController
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier  == "AdditionalControllerSeque",
            let controller = segue.destination as? AdditionalController {
            additionalController = controller
            additionalController.touchedUtilitySymbol = { [weak self] button in
                self?.touchSymbol(button: button)
                
                
            }
        }
    }
    
}
