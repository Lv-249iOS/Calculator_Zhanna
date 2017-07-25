
//
//  Emitter.swift
//  Calculator
//
//  Created by Zhanna Moskaliuk on 7/24/17.
//  Copyright © 2017 Zhanna Moskaliuk. All rights reserved.
//

import UIKit

class Emitter {
    
    // MARK: Generate emitter layer and its properties
    static func get(with image: UIImage) -> CAEmitterLayer {
        let emitter = CAEmitterLayer()
        emitter.emitterShape = kCAEmitterLayerLine
        emitter.emitterCells = generateEmitterCells(with: image)
        return emitter
    }
    // MARK: Generate emitter cells and add  some properties
    static func generateEmitterCells(with image: UIImage) -> [CAEmitterCell] {
        var cells = [CAEmitterCell]()
        let cell = CAEmitterCell()
        cell.contents = image.cgImage
        cell.birthRate = 0.5
        cell.lifetime = 10
        cell.velocity = CGFloat(25)
        cell.emissionLongitude = (180 * (.pi/180))
        cell.emissionRange = (45 * (.pi/180))
        cell.spin = 0.5
        cell.spinRange = 0.5
        cell.scale = 0.1
        cell.scaleRange = 0.05
        
        cells.append(cell)
        
        return cells
        
    }
}
