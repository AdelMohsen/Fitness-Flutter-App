import 'dart:io';
import 'package:fitness_app/bloc/main_bloc.dart';
import 'package:fitness_app/bloc/main_states.dart';
import 'package:fitness_app/constans/reuse_widget.dart';
import 'package:fitness_app/constans/theme.dart';
import 'package:fitness_app/model/FitnessModel.dart';
import 'package:fitness_app/screens/start_wiget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Fitness app'),
        backgroundColor: mainColor,
        elevation: 0.0,
      ),
      body: BlocBuilder<FitnessBloc, FitnessState>(
        builder: (context, state) {
          var cubit = FitnessBloc.get(context);
          FitnessModel? fitnessModel = cubit.fitnessModel;
          return Conditional.single(
              context: context,
              conditionBuilder: (context) => cubit.fitnessModel != null,
              widgetBuilder: (context) => ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) =>
                        buildFitnessItem(cubit, context, index, fitnessModel!),
                    itemCount: cubit.fitnessModel!.exercises!.length,
                  ),
              fallbackBuilder: (context) => Platform.isAndroid
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : Center(
                      child: CupertinoActivityIndicator(),
                    ));
        },
      ),
    );
  }

  buildFitnessItem(
          FitnessBloc cubit, context, int index, FitnessModel fitnessModel) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
        child: InkWell(
          onTap: () {
            navigateTo(
                context,
                StartExercise(
                  fitnessModel: fitnessModel,
                  index: index,
                ));
          },
          child: Hero(
            tag: cubit.fitnessModel!.exercises![index].id,
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  height: 200.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: FadeInImage(
                      height: 200.0,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      image: NetworkImage(
                          '${cubit.fitnessModel!.exercises![index].image}'),
                      placeholder: AssetImage('assets/fitLoading.gif'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    '${cubit.fitnessModel!.exercises![index].title}',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w900,
                        decoration: TextDecoration.none),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
