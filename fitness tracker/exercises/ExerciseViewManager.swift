import Foundation

class ExerciseViewManager: ObservableObject {
    @Published var databaseManager: DatabaseManager
    @Published var selectedExerciseID: Int
    
    init(databaseManager: DatabaseManager = DatabaseManager()) {
        self.databaseManager = databaseManager
        self.selectedExerciseID = 0
    }
    
    func fetchExerciseData(for exerciseID: Int) -> [ExerciseData] {
        return databaseManager.fetchExerciseData(for: exerciseID)
    }
    
    func selectExercise(_ exerciseID: Int) {
        selectedExerciseID = exerciseID
    }
}
