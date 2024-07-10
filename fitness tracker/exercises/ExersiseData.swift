import Foundation

struct ExerciseData: Identifiable {
    let id = UUID()
    let exerciseID: Int
    let name: String
    let reps: Int
    let date: Date
}
