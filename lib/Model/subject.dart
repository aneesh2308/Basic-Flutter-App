class Subject {
  final String Name;
  final String Marks;

  const Subject({
    required this.Name,
    required this.Marks,
  });

  Subject copy({
    String? Name,
    String? Grade,
  }) =>
      Subject(
        Name: Name ?? this.Name,
        Marks: Grade ?? this.Marks,
      );

  @override
  bool operator == (Object other) =>
      identical(this, other) ||
          other is Subject &&
              runtimeType == other.runtimeType &&
              Name == other.Name &&
              Marks == other.Marks;

}