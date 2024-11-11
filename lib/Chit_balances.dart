import 'package:collection/collection.dart';

class Chitbalances{
  final double x;
  final double y;
  Chitbalances({required this.x,required this.y});
}
List<Chitbalances> get balances{
  final data= <double>[2,4,5,6,8,9];
  return data.mapIndexed(((indext,element)=>Chitbalances(x: indext.toDouble(), y: element))).toList();
}