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
    
    
    
    
    @IBAction func touchDigit(button: UIButton) {
        touchedDigit?(button.tag)
    }
    
    @IBAction func touchSymbol (button : UIButton) {
        touchedSymbol?(button.tag)
        
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
    
    
    
//    func orientationChanged() {
//        if (UIDeviceOrientationIsLandscape(UIDevice.current.orientation)) {
//            self.view.viewWithTag(11)?.isHidden = true
//        } else {
//        
//            if UIDeviceOrientationIsPortrait(UIDevice.current.orientation) {
//                self.view.viewWithTag(11)?.isHidden = false
//            }
//        
//    }
//    
//    }
}
