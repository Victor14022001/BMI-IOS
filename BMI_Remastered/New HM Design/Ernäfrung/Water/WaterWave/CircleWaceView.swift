//
//  WaterWaveView.swift
//  BMI_Remastered
//
//  Created by Victor Horn on 16.03.24.
//

import SwiftUI

struct CircleWaveView: View {
    @State private var waveOffset = Angle(degrees: 0)
    let percent: Int
    
    var body: some View {
        GeometryReader { geoRe in
            ZStack {
                Text("\(self.percent)%")
                    .foregroundStyle(Color("appOrange"))
                    .font(Font.system(size: 0.25 * min(geoRe.size.width, geoRe.size.height)))
                
                Circle()
                    .stroke(Color("appOrange"), lineWidth: 0.025 * min(geoRe.size.width, geoRe.size.height))
                    .overlay (
                        Wave(offset: Angle(degrees: self.waveOffset.degrees), percent: Double(percent)/100)
                            .fill(Color(red: 0, green: 0.5, blue: 0.75, opacity: 0.5))
                            .clipShape(Circle().scale(0.92))
                    )
            }
            }
            .aspectRatio(1, contentMode: .fit)
            .onAppear {
                withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)) {
                    self.waveOffset = Angle(degrees: 360)
            }
        }
    }
}
