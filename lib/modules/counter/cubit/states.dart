abstract class counterStates{}
class initState extends counterStates{}
class plusState extends counterStates
{
  final counter;

  plusState(this.counter);

}
class minusState extends counterStates
{
  final counter;

  minusState(this.counter);
}

