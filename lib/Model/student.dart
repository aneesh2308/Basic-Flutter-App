class Student {
  final String Reg;
  final String Password;
  final String Name;
  final List Course;
  final List Grades;

  const Student({
    required this.Reg,
    required this.Password,
    required this.Name,
    required this.Course,
    required this.Grades,
  });

  Student copy({
    String? Reg,
    String? Password,
    String? Name,
    List? Course,
    List? Grades,
  }) =>
      Student(
        Reg: Reg ?? this.Reg,
        Password: Password ?? this.Password,
        Name: Name ?? this.Name,
        Course: Course ?? this.Course,
        Grades: Grades ?? this.Grades,
      );

  @override
  bool operator == (Object other) =>
      identical(this, other) ||
          other is Student &&
              runtimeType == other.runtimeType &&
              Reg == other.Reg &&
              Name == other.Name &&
              Course == other.Course;
}