//
//  Canvas.swift
//  BeAnArtist
//
//  Created by Ahmed Amr on 1/7/19.
//  Copyright © 2019 Ahmed Amr. All rights reserved.
//

import UIKit

class Canvas: UIView {
    
    
    fileprivate var strokeColor  = UIColor.red
    fileprivate var strokeWidth : Float = 8
    fileprivate var lines = [Line]()
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else
        { return }
        
        
        lines.forEach { (line) in
            for (i,p) in line.points.enumerated(){
                context.setLineWidth(CGFloat(line.strokeWidth))
                context.setStrokeColor(line.color.cgColor)
                context.setLineCap(.round)
                if i == 0 {
                    context.move(to: p)
                } else {
                    context.addLine(to: p)
                    
                }
                
            }
            context.strokePath()
        }
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lines.append(Line.init(strokeWidth: strokeWidth, color: strokeColor, points: []))
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: self) else
        { return }
        //   print("(\(Int(point.x)),\(Int(point.y)))")
        guard var lastline = lines.popLast() else { return }
        lastline.points.append(point)
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
    func setStrokeColor(color : UIColor){
        self.strokeColor = color
    }
    func setStrokeWidth(width : Float){
        strokeWidth = width
    }
}
