//
//  AdditionalController.swift
//  Calculator
//
//  Created by Zhanna Moskaliuk on 7/11/17.
//  Copyright © 2017 Zhanna Moskaliuk. All rights reserved.
//

import UIKit

class AdditionalController: UIViewController {
    
    var touchedUtilitySymbol: ((_ button: UIButton) -> ())?
    
    
    @IBAction func touchUtilitySymbol(_ button: UIButton) {
        touchedUtilitySymbol?(button)
    }
    
}
