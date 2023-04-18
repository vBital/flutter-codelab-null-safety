/*    ERROR
void main() {
  int a;
  a = null;
  print('a is $a.');
}
*/
/*    FIXED
void main() {
  int a;
  a = 3;
  print('a is $a.');
}
*/
////////////////////////  BOTH INT AND NULL
/*
void main() {
  int? a;
  a = null;
  print('a is $a.');
}
*/

///////////////////////////////////////////////

/*    ERROR
void main() {
  List<String> aListOfStrings = ['one', 'two', 'three'];
  List<String> aNullableListOfStrings;
  List<String> aListOfNullableStrings = ['one', null, 'three'];

  print('aListOfStrings is $aListOfStrings.');
  print('aNullableListOfStrings is $aNullableListOfStrings.');
  print('aListOfNullableStrings is $aListOfNullableStrings.');
}
*/
/*    FIXED
void main() {
  List<String> aListOfStrings = ['one', 'two', 'three'];
  List<String>? aNullableListOfStrings;
  List<String?> aListOfNullableStrings = ['one', null, 'three'];

  print('aListOfStrings is $aListOfStrings.');
  print('aNullableListOfStrings is $aNullableListOfStrings.');
  print('aListOfNullableStrings is $aListOfNullableStrings.');
}
*/

///////////////////////////////////////////////

/*    ERROR
int? couldReturnNullButDoesnt() => -3;

void main() {
  int? couldBeNullButIsnt = 1;
  List<int?> listThatCouldHoldNulls = [2, null, 4];

  int a = couldBeNullButIsnt;
  int b = listThatCouldHoldNulls.first; // first item in the list
  int c = couldReturnNullButDoesnt().abs(); // absolute value

  print('a is $a.');
  print('b is $b.');
  print('c is $c.');
}
*/

/*    FIXED
int? couldReturnNullButDoesnt() => -3;
int? couldBeNullButIsnt = 1;
void main() {
  
  List<int?> listThatCouldHoldNulls = [2, null, 4];

  int a = couldBeNullButIsnt!;
  int b = listThatCouldHoldNulls.first!; // first item in the list
  int c = couldReturnNullButDoesnt()!.abs(); // absolute value

  print('a is $a.');
  print('b is $b.');
  print('c is $c.');
}
*/

///////////////////////////////////////////////

/*    ERROR
int addThreeValues({
  int first,
  int second,
  int third,
}) {
  return first + second + third;
}

void Main() {
  final sum = addThreeValues(
    first: 2,
    second: 5,
    third: 3,
  );

  print(sum);
}
*/
/*    FIXED
int addThreeValues({
  required int first,
  required int second,
  required int third,
}) {
  return first + second + third;
}

void Main() {
  final sum = addThreeValues(
    first: 2,
    second: 5,
    third: 3,
  );

  print(sum);
}
*/

///////////////////////////////////////////////

/*    ERROR
void Main() {
  String? text;

  //if (DateTime.now().hour < 12) {
  //  text = "It's morning! Let's make aloo paratha!";
  //} else {
  //  text = "It's afternoon!! Let's make biryani!";
  //}

  print(text);
  print(text.length);
}
*/
/*    FIXED
void Main() {
  String? text;

  if (DateTime.now().hour < 12) {
    text = "It's morning! Let's make aloo paratha!";
  } else {
    text = "It's afternoon!! Let's make biryani!";
  }

  print(text);
  //print(text?.length);
  print(text.length);
}
*/

///////////////////////////////////////////////

/*    ERROR
int getLength(String? str) {
  // Add null check here

  return str.length;
}

void main() {
  print(getLength('This is a string!'));
}
*/
/*    FIXED
int getLength(String? str) {
  // Add null check here
  if(str == null) {
    return 0;
  }

  return str.length;
}

void main() {
  print(getLength('This is a string!'));
}
*/

///////////////////////////////////////////////

/*    ERROR
import 'dart:math';

class RandomStringProvider {
  String? get value =>
    Random().nextBool() ? 'A String' : null;
}

void printString(String str) => print(str);

void Main() {
final provider = RandomStringProvider();

if (provider.value == null) {
  print('The value is null');
} else {
  print('The value is not null, so print it!');
  printString(provider.value);
}
}
*/
/*    FIXED
import 'dart:math';

class RandomStringProvider {
  String? get value =>
    Random().nextBool() ? 'A String' : null;
}

void printString(String str) => print(str);

void Main() {
final provider = RandomStringProvider();

final str = provider.value;

if (provider.value == null) {
  print('The value is null');
} else {
  print('The value is not null, so print it!');
  printString(str!);
}
}
*/

///////////////////////////////////////////////

/*    ERROR
class Meal {
  String _description;

  set description(String desc) {
    _description = 'Meal description: $desc';
  }

  String get description => _description;
}

void main() {
  final myMeal = Meal();
  myMeal.description = 'Feijoada!';
  print(myMeal.description);
}
*/
/*    FIXED
class Meal {
  late String _description;

  set description(String desc) {
    _description = 'Meal description: $desc';
  }

  String get description => _description;
}

void main() {
  final myMeal = Meal();
  myMeal.description = 'Feijoada!';
  print(myMeal.description);
}
*/

///////////////////////////////////////////////

/*    ERROR
class Team {
  final Coach coach;
}

class Coach {
  final Team team;
}

void main() {
  final myTeam = Team();
  final myCoach = Coach();
  myTeam.coach = myCoach;
  myCoach.team = myTeam;

  print('All done!');
}
*/
/*    FIXED
class Team {
  late final Coach coach;
}

class Coach {
  late final Team team;
}

void main() {
  final myTeam = Team();
  final myCoach = Coach();
  myTeam.coach = myCoach;
  myCoach.team = myTeam;

  print('All done!');
}
*/

///////////////////////////////////////////////

/*    ERROR
int _computeValue() {
  print('In _computeValue...');
  return 3;
}

class CachedValueProvider {
  final _cache = _computeValue();
  int get value => _cache;
}

void main() {
  print('Calling constructor...');
  var provider = CachedValueProvider();
  print('Getting value...');
  print('The value is ${provider.value}!');
}
*/

int _computeValue() {
  print('In _computeValue...');
  return 3;
}

class CachedValueProvider {
  late final _cache = _computeValue();
  int get value => _cache;
}

void main() {
  print('Calling constructor...');
  var provider = CachedValueProvider();
  print('Getting value...');
  print('The value is ${provider.value}!');
}