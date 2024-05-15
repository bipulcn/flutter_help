class NameState {}

class InitalState extends NameState {}

class UpdateState extends NameState {
  final List<String> name;
  UpdateState(this.name);
}
