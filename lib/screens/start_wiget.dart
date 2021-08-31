import 'package:fitness_app/bloc/main_bloc.dart';
import 'package:fitness_app/bloc/main_states.dart';
import 'package:fitness_app/constans/reuse_widget.dart';
import 'package:fitness_app/constans/strings.dart';
import 'package:fitness_app/model/FitnessModel.dart';
import 'package:fitness_app/screens/start_exercise.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class StartExercise extends StatelessWidget {
  final FitnessModel fitnessModel;
  final int index;

  StartExercise({required this.fitnessModel, required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FitnessBloc, FitnessState>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Hero(
                  tag: fitnessModel.exercises![index].id,
                  child: Image(
                    image:
                        NetworkImage('${fitnessModel.exercises![index].image}'),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                  alignment: Alignment.center,
                  child: MaterialButton(
                    height: 50.0,
                    onPressed: () {
                      navigateTo(
                          context,
                          Exercise(
                            second: FitnessBloc.get(context).second,
                            index: index,
                            fitnessModel: fitnessModel,
                          ));
                    },
                    child: Text(
                      'start exercise',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    color: Colors.purpleAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                  )),
              Container(
                height: 200.0,
                width: 200.0,
                child: SleekCircularSlider(
                  appearance: CircularSliderAppearance(),
                  onChange: (double value) {
                    seconds = value;
                    FitnessBloc.get(context).changeTimer(value.toInt());
                  },
                  initialValue: seconds == 0 ? 30 : seconds,
                  min: 10,
                  max: 60,
                  innerWidget: (value) {
                    seconds = value;
                    return Container(
                      alignment: Alignment.center,
                      child: Text(
                        '${value.toInt()} S',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            decoration: TextDecoration.none),
                      ),
                    );
                  },
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.purpleAccent,
                          size: 25,
                        )),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
