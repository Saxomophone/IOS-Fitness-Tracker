import SwiftUI

struct ExerciseView: View {
    @EnvironmentObject var exerciseViewManager: ExerciseViewManager
    @State private var reps: Double = 0 // Assuming you want to track reps with the slider
    
    var body: some View {
        VStack {
            Text("Exercise \(exerciseViewManager.selectedExerciseID)") // Replace with actual exercise name if needed
                .font(.largeTitle)
                .padding()
            
            CircleSlider(progress: $reps, total: 100) // Adjust `total` as needed
                .frame(width: 200, height: 200)
                .padding()
            
            Text("Reps: \(Int(reps))")
                .font(.title)
                .padding()
            
            List(exerciseViewManager.fetchExerciseData(for: exerciseViewManager.selectedExerciseID)) { data in
                HStack {
                    Text("Reps: \(data.reps)")
                    Spacer()
                    Text(dateFormatter.string(from: data.date))
                }
            }
        }
    }
}

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter
}()

#Preview {
    ExerciseView()
        .environmentObject(ExerciseViewManager()) // Providing a sample environment object
}
