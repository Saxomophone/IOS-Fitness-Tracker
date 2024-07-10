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
                    .stroke(lineWidth: 10)
                    .foregroundColor(.gray.opacity(0.3))
                
                Circle()
                    .trim(from: 0, to: CGFloat(progress / total))
                    .stroke(lineWidth: 10)
                    .foregroundColor(.blue)
                    .rotationEffect(.degrees(-90))
                
                Circle()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.blue)
                    .position(handlePoint)
                    .gesture(
                        DragGesture(minimumDistance: 0)
                            .onChanged { value in
                                let vector = CGVector(dx: value.location.x - center.x, dy: value.location.y - center.y)
                                let angle = atan2(vector.dy, vector.dx) + .pi / 2
                                let fixedAngle = angle < 0 ? angle + 2 * .pi : angle
                                progress = min(max(0, fixedAngle / (2 * .pi) * total), total)
                            }
                    )
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
