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
    
    
    @IBAction func touchDigit(button: UIButton) {
        touchedDigit?(button.tag)
    }
    
    @IBAction func touchSymbol (button : UIButton) {
        touchedSymbol?(button.tag)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(rotated), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)

    }
    
    deinit {
       NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
    }
    
    func rotated() {
        additionalContainerView.isHidden = UIDevice.current.orientation.isPortrait
    }
    
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
