import SwiftUI

struct ExerciseView: View {
    @EnvironmentObject var exerciseViewManager: ExerciseViewManager
    @EnvironmentObject var viewManager: ViewManager
    @State private var reps: Double = 0
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack {
                // Your existing content here
                Text("Exercise \(exerciseViewManager.selectedExerciseID)") // Replace with actual exercise name if needed
                    .font(.largeTitle)
                    .padding()
                
                CircleSlider(progress: $reps, total: 100) // Adjust `total` as needed
                    .frame(width: 200, height: 200)
                    .padding()
                
                List(exerciseViewManager.fetchExerciseData(for: exerciseViewManager.selectedExerciseID)) { data in
                    HStack {
                        Text("Reps: \(data.reps)")
                        Spacer()
                        Text(dateFormatter.string(from: data.date))
                    }
                }
            }
            HStack {
                Button(action: {
                    viewManager.activeView = .home
                }) {
                    Image(systemName: "house.fill")
                        .font(.title2)
                        .foregroundColor(.mint)
                        .padding(.leading, 20)
                        .padding(.top, 5)
                }
                Spacer()
            }
        }
    }
}

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter
}()

// Preview provider
#Preview {
    ExerciseView()
        .environmentObject(ViewManager())
        .environmentObject(ExerciseViewManager())
}
