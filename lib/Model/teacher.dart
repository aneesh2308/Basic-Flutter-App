class Teacher {
  final String Reg;
  final String Password;
  final String Name;
  final List Course;
  final List Studystud;

  const Teacher({
    required this.Reg,
    required this.Password,
    required this.Name,
    required this.Course,
    required this.Studystud
  });

  Teacher copy({
    String? Reg,
    String? Password,
    String? Name,
    List? Course,
    List? Studystud,
  }) =>
      Teacher(
        Reg: Reg ?? this.Reg,
        Password: Reg ?? this.Password,
        Name: Name ?? this.Name,
        Course: Course ?? this.Course,
        Studystud: Studystud ?? this.Studystud,
      );

  @override
  bool operator == (Object other) =>
      identical(this, other) ||
          other is Teacher &&
              runtimeType == other.runtimeType &&
              Name == other.Name &&
              Course == other.Course &&
              Reg == other.Reg;
}