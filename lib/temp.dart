void main(List<String> args) {
  RegExp exp =
      new RegExp(r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$");
  String str = "Attesld.284";
  Iterable<RegExpMatch> matches = exp.allMatches(str);
  print(matches.first);
}
