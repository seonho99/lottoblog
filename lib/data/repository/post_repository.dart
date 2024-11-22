class WorkoutRepository{
  FakeDb fakeDb;
  WorkoutRepository(this.fakeDb);

  List<Workout> fetchWorkouts(){
    return fakeDb.fetchWorkouts();
  }

  Workout getWorkout(int index){
    return fakeDb.getWorkout(index);
  }
  void addWorkout(Workout workout){
    fakeDb.adddWorkout(workout);
  }

  void deleteWorkout(Workout workout){
    fakeDb.deleteWorkout(workout);
  }

  void updateWorkout(Workout workout){
    fakeDb.updateWorkout(workout);
  }
}