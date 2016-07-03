import 'package:dartabase_model/dartabase_model.dart';
class Muscles extends Model{

  num id;
  String name;
  num picture_id;
  
  String toString() => "Muscles id=$id:name=$name:picture_id=$picture_id";
  //toJSON() is available through the "extends Model"
}

        