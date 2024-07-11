import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewManager: ViewManager
    @StateObject var exerciseViewManager = ExerciseViewManager()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(exerciseViewManager.databaseManager.exerciseData.unique(by: \.exerciseID), id: \.exerciseID) { exercise in
                    HStack {
                        Image(systemName: "figure.walk") // Replace with appropriate icon
                            .font(.system(size: 40))
                            .foregroundColor(.blue)
                            .padding()
                        
                        VStack(alignment: .leading) {
                            Text(exercise.name)
                                .font(.headline)
                            Text("Today's count: \(exerciseViewManager.databaseManager.fetchExerciseCountToday(for: exercise.exerciseID))")
                                .font(.subheadline)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            exerciseViewManager.selectExercise(exercise.exerciseID)
                            viewManager.activeView = .exercise
                        }) {
                            Text("View")
                                .foregroundColor(.blue)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Exercises")
        }
    }
}

extension Array {
    func unique<T: Hashable>(by keyPath: KeyPath<Element, T>) -> [Element] {
        var seen = Set<T>()
        return filter { seen.insert($0[keyPath: keyPath]).inserted }
    }
}

#Preview {
    HomeView()
        .environmentObject(ViewManager())
        .environmentObject(ExerciseViewManager())
}
