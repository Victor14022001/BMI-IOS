//
//  WaveShapeModel.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 16.03.24.
//

import Foundation
import SwiftUI

struct Wave: Shape {
    var offset: Angle
    var percent: Double
    
    var animatableData: Double {
        get { offset.degrees }
        set { offset = Angle(degrees: newValue) }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let lowfudge = 0.02
        let hightfugde = 0.98
        
        let newPercent = lowfudge + (hightfugde - lowfudge) * percent
        let waveHeight = 0.015 * rect.height
        let yoffset = CGFloat(1 - newPercent) * (rect.height - 4 * waveHeight) + 2 - waveHeight
        let startAngle = offset
        let endAngle = offset + Angle(degrees: 360)
        
        path.move(to: CGPoint(x: 0, y: yoffset + waveHeight * CGFloat(sin(offset.radians))))
        
        for angle in stride(from: startAngle.degrees, through: endAngle.degrees, by: 5) {
            let xAxis = CGFloat((angle - startAngle.degrees) / 360) * rect.width
            path.addLine(to: CGPoint(x: xAxis, y: yoffset + waveHeight * CGFloat(sin(Angle(degrees: angle).radians))))
        }
        
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        path.closeSubpath()
        
        return path
    }
}
