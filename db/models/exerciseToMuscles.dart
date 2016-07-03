import 'package:dartabase_model/dartabase_model.dart';
class ExerciseToMuscles extends Model{

  num id;
  num muscle_id;
  num exercise_id;
  num body_part_id;
  String muscle_type;
  num active;
  
  String toString() => "ExerciseToMuscles id=$id:muscle_id=$muscle_id:exercise_id=$exercise_id:body_part_id=$body_part_id:muscle_type=$muscle_type:active=$active";
  //toJSON() is available through the "extends Model"
}

        