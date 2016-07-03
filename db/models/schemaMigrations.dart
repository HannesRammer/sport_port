import 'package:dartabase_model/dartabase_model.dart';
class SchemaMigrations extends Model{

  String version;
  
  String toString() => "SchemaMigrations version=$version";
  //toJSON() is available through the "extends Model"
}

        