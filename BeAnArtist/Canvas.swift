//
//  Canvas.swift
//  BeAnArtist
//
//  Created by Ahmed Amr on 1/7/19.
//  Copyright © 2019 Ahmed Amr. All rights reserved.
//

import UIKit

class Canvas: UIView {
    
    
    var lines = [[CGPoint]]()
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else
        { return }
        context.setStrokeColor(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1))
        context.setLineCap(.butt)
        context.setLineWidth(8)
        lines.forEach { (line) in
            for (i,p) in line.enumerated() { //to be able to use my index
                if i == 0 {
                    context.move(to: p)
                } else {
                    context.addLine(to: p)
                }
            }
        }
        context.strokePath()
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lines.append([CGPoint]())
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: self) else
        { return }
        //   print("(\(Int(point.x)),\(Int(point.y)))")
        guard var lastline = lines.popLast() else { return }
        lastline.append(point)
        lines.append(lastline)
        setNeedsDisplay()
    }
    
}
