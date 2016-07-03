import 'package:dartabase_model/dartabase_model.dart';
class Test extends Model{

  num id;
  DateTime created_at;
  DateTime updated_at;
  
  String toString() => "Test id=$id:created_at=$created_at:updated_at=$updated_at";
  //toJSON() is available through the "extends Model"
}

        