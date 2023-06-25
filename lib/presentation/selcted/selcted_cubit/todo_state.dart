

abstract class States {}

class InitialState extends States {}

class ChangeNavBar extends States {}

class InsertTaskSuccessState extends States {}

class UpdateTaskSuccessState extends States {}

class UpdateTaskErrorState extends States {}

class DeleteTaskSuccessState extends States {}

class DeleteTaskErrorState extends States {}

class TasksLoading extends States {}




class ToggleDoneSuccessState extends States {}

class ToggleArchiveSuccessState extends States {}
