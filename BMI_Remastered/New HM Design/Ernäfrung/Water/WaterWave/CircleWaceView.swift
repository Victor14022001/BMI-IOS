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
                        WaveShape(offset: Angle(degrees: self.waveOffset.degrees), percent: Double(percent)/100)
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

struct WaveShape: Shape {
    var offset: Angle
    var percent: Double

    var animatableData: AnimatablePair<Double, Double> {
        get {
            AnimatablePair(offset.radians, percent)
        }
        set {
            offset = Angle(radians: newValue.first)
            percent = newValue.second
        }
    }

    func path(in rect: CGRect) -> Path {
        let waveHeight = 0.05 * rect.height
        let waveLength = rect.width
        let yOffset = CGFloat(1.0 - percent) * rect.height

        var path = Path()
        path.move(to: CGPoint(x: 0, y: yOffset))

        for xStride in stride(from: 0, to: Double(waveLength), by: 1) {
            let relativeX = CGFloat(xStride) / waveLength
            let sine = sin(relativeX * 2 * .pi + offset.radians)
            let yStride = yOffset + waveHeight * sine
            path.addLine(to: CGPoint(x: CGFloat(xStride), y: yStride))
        }

        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        path.closeSubpath()

        return path
    }
}
