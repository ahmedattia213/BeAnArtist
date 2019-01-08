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
        // lines are 2D array of lines
        // and a signle line is array of points to make up this line
        // we take the first point as our starting point
        // last point as our ending point
        
        lines.forEach { (line) in
            for (i,p) in line.enumerated() {
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
    
    func undo(){
       _ = lines.popLast()
        setNeedsDisplay()
    }
    func clear(){
        lines.removeAll()
        setNeedsDisplay()
    }
    
}
