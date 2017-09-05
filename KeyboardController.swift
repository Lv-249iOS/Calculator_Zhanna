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
        let beforeColor = button.backgroundColor
        UIView.animate(withDuration: 0.3, animations: {
            button.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            button.layer.backgroundColor = UIColor.purple.withAlphaComponent(0.55).cgColor
            button.layer.backgroundColor = UIColor.clear.cgColor
        }, completion: { _ in
            UIView.animate(withDuration: 0.34) {
                button.transform = CGAffineTransform.identity
                button.layer.backgroundColor = beforeColor?.cgColor
            }
        })
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
