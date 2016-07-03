import 'package:dartabase_model/dartabase_model.dart';
class Exercises extends Model{

  num id;
  String name;
  String image1;
  String description;
  String image2;
  String main_description;
  String how_to;
  String how_not_to;
  String info;
  String exercise_type;
  
  String toString() => "Exercises id=$id:name=$name:image1=$image1:description=$description:image2=$image2:main_description=$main_description:how_to=$how_to:how_not_to=$how_not_to:info=$info:exercise_type=$exercise_type";
  //toJSON() is available through the "extends Model"
}

        