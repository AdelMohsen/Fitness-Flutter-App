import 'dart:async';
import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:fitness_app/Dio_helper/dio.dart';
import 'package:fitness_app/bloc/main_states.dart';
import 'package:fitness_app/constans/strings.dart';
import 'package:fitness_app/model/FitnessModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FitnessBloc extends Cubit<FitnessState> {
  FitnessBloc() : super(FitnessInitialState());

  static FitnessBloc get(context) => BlocProvider.of(context);

  FitnessModel? fitnessModel;

  getFitnessData() {
    emit(GetFitnessDataLoadingState());
    DioHelper.getData(path: pathUrl).then((value) {
      fitnessModel = FitnessModel.fromJson(jsonDecode(value.data));

      emit(GetFitnessDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetFitnessDataErrorState());
    });
  }

  int second = 30;

  changeTimer(int value) {
    second = value;
    emit(ChangeTimerValue());
  }

  bool isCompleted = false;
  int countTimer = 0;
  Timer? timer;
  bool isRun = false;

  timerPeriodic() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (timer.tick == second) {
        timer.cancel();
        isCompleted = true;
        isRun = false;
        playAudio();
        emit(ChangeTimerTickValue());
      } else {
        countTimer = timer.tick;
        emit(ChangeCounterTimerTick());
      }
    });
  }

  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache();
  String path = 'train.wav';

  void playAudio() async {
    audioCache.play(
      path,
    );
  }
}
