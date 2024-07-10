import Foundation

class DatabaseManager: ObservableObject {
    @Published var exerciseData: [ExerciseData] = []
    
    init() {
        // Dummy data for illustration
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        
        exerciseData = [
            ExerciseData(exerciseID: 1, name: "Push Ups", reps: 20, date: dateFormatter.date(from: "2024/07/11")!),
            ExerciseData(exerciseID: 2, name: "Sit Ups", reps: 15, date: dateFormatter.date(from: "2024/07/11")!),
            ExerciseData(exerciseID: 3, name: "Squats", reps: 25, date: dateFormatter.date(from: "2024/07/11")!)
        ]
    }
    
    func fetchExerciseData(for exerciseID: Int) -> [ExerciseData] {
        return exerciseData.filter { $0.exerciseID == exerciseID }
    }
    
    func fetchExerciseCountToday(for exerciseID: Int) -> Int {
        let today = Calendar.current.startOfDay(for: Date())
        return exerciseData.filter { $0.exerciseID == exerciseID && Calendar.current.isDate($0.date, inSameDayAs: today) }
                           .reduce(0) { $0 + $1.reps }
    }
}
