class FitnessModel {
  List<Exercises>? exercises;

  FitnessModel.fromJson(Map<String, dynamic> json) {
    exercises =
        (json['exercises'] as List).map((e) => Exercises.fromJson(e)).toList();
  }
}

class Exercises {
  dynamic id;
  String? title;
  String? image;
  String? gif;
  String? time;

  Exercises.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['thumbnail'];
    gif = json['gif'];
    time = json['seconds'];
  }
}
