abstract class FitnessState{}

class FitnessInitialState extends FitnessState{}

class GetFitnessDataLoadingState extends FitnessState{}

class GetFitnessDataSuccessState extends FitnessState{}

class GetFitnessDataErrorState extends FitnessState{}

class ChangeTimerValue extends FitnessState{}

class ChangeTimerTickValue extends FitnessState{}

class ChangeCounterTimerTick extends FitnessState{}
