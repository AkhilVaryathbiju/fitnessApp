import 'package:hive/hive.dart';

part 'userModel.g.dart';

@HiveType(typeId : 0)
class workout{
  @HiveField(0)
  final String name;

  @HiveField(1)
  final int sets;

  @HiveField(2)
  final int reps;

  @HiveField(3)
  final String type;
 
 workout(this.name,this.sets,this.reps,this.type);

}