import SwiftUI

struct CircleSlider: View {
    @Binding var progress: Double
    let total: Double
    
    var body: some View {
        GeometryReader { geometry in
            let size = min(geometry.size.width, geometry.size.height)
            let radius = size / 2
            let center = CGPoint(x: size / 2, y: size / 2)
            let angle = Angle(degrees: 360 * progress / total)
            let handlePoint = CGPoint(
                x: center.x + radius * cos(CGFloat(angle.radians) - .pi / 2),
                y: center.y + radius * sin(CGFloat(angle.radians) - .pi / 2)
            )
            
            ZStack {
                Circle()
                    .stroke(lineWidth: 20)
                    .foregroundColor(.gray.opacity(0.3))
                
                Circle()
                    .trim(from: 0, to: CGFloat(progress / total))
                    .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                    .foregroundColor(.mint)
                    .rotationEffect(.degrees(-90))
                
                Circle()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.mint)
                    .position(handlePoint)
                    .gesture(
                        DragGesture(minimumDistance: 0)
                            .onChanged { value in
                                let vector = CGVector(dx: value.location.x - center.x, dy: value.location.y - center.y)
                                var angle = atan2(vector.dy, vector.dx) + .pi / 2
                                if angle < 0 { angle += 2 * .pi }
                                let newProgress = (angle / (2 * .pi)) * total
                                progress = min(max(0, newProgress), total)
                            }
                    )
                
                Text("\(Int(progress))")
                    .font(.system(size: 40, weight: .bold, design: .serif))
                    .foregroundColor(.mint)
            }
            .frame(width: size, height: size)
        }
    }
}

struct CircleSlider_Previews: PreviewProvider {
    static var previews: some View {
        CircleSlider(progress: .constant(25), total: 100)
            .frame(width: 200, height: 200)
            .padding()
    }
}
