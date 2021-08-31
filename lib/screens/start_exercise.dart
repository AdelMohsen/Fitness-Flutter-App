import 'package:fitness_app/bloc/main_bloc.dart';
import 'package:fitness_app/bloc/main_states.dart';
import 'package:fitness_app/constans/theme.dart';
import 'package:fitness_app/model/FitnessModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Exercise extends StatelessWidget {
  final int second;
  final FitnessModel fitnessModel;
  final int index;

  Exercise(
      {required this.second, required this.fitnessModel, required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FitnessBloc, FitnessState>(
      builder: (context, state) {
        var cubit = FitnessBloc.get(context);
        return Scaffold(
          backgroundColor: mainColor,
          body: Stack(
            children: [
              Container(
                alignment: Alignment.center,
                child: FadeInImage(
                  height: 400.0,
                  width: double.infinity,
                  image: NetworkImage('${fitnessModel.exercises![index].gif}'),
                  placeholder: AssetImage('assets/fitLoading.gif'),
                ),
              ),
              SafeArea(
                  child: Container(
                      padding: const EdgeInsets.all(20.0),
                      alignment: Alignment.topLeft,
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                            if (cubit.timer != null) cubit.timer!.cancel();
                            cubit.countTimer = 0;
                            cubit.isRun = false;
                          },
                          icon: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 25.0,
                          )))),
              SafeArea(
                  child: Container(
                      padding: const EdgeInsets.all(20.0),
                      alignment: Alignment.topCenter,
                      child: Text(
                        '${cubit.countTimer} / $second',
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ))),
              if (cubit.isRun != true)
                SafeArea(
                    child: Container(
                        padding: const EdgeInsets.all(20.0),
                        alignment: Alignment.topRight,
                        child: IconButton(
                            onPressed: () {
                              cubit.isRun = true;
                              cubit.timerPeriodic();
                            },
                            icon: Icon(
                              Icons.run_circle_outlined,
                              color: Colors.white,
                              size: 25.0,
                            )))),
            ],
          ),
        );
      },
    );
  }
}
