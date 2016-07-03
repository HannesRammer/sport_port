import 'package:dartabase_model/dartabase_model.dart';
class BodyParts extends Model{

  num id;
  String name;
  
  String toString() => "BodyParts id=$id:name=$name";
  //toJSON() is available through the "extends Model"
}

        