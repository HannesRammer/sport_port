import 'package:dartabase_model/dartabase_model.dart';
class UserToExercises extends Model{

  num id;
  num user_id;
  num exercise_id;
  DateTime created_at;
  DateTime updated_at;
  
  String toString() => "UserToExercises id=$id:user_id=$user_id:exercise_id=$exercise_id:created_at=$created_at:updated_at=$updated_at";
  //toJSON() is available through the "extends Model"
}

        