
abstract class Role {
  void displayRole();
}
class Person implements Role {
  String name;
  int age;
  String address;
  Person({required this.name, required this.age, required this.address});
  @override
  void displayRole() {
    print("Role: Person");
  }
}

class Student extends Person {
  String studentID;
  String grade;
  List<double> courseScores;
  Student({
    required String name,
    required int age,
    required String address,
    required this.studentID,
    required this.grade,
    required this.courseScores,
  }) : super(name:name, age:age, address:address);

  @override
  void displayRole() {
    print("Role: Student");
  }
  double calculateAverageScore() {
    if (courseScores.isEmpty) return 0.0;
    return courseScores.reduce((a,b) =>a+b) / courseScores.length;
  }
}
class Teacher extends Person {
  String teacherID;
  List<String> coursesTaught;

  Teacher({
    required String name,
    required int age,
    required String address,
    required this.teacherID,
    required this.coursesTaught,
  }) : super(name: name,age: age,address:address);
  @override
  void displayRole() {
    print("Role: Teacher");
  }
  void displayCoursesTaught() {
    print("Courses Taught:");
    for (var course in coursesTaught) {
      print("- $course");
    }
  }
}
class StudentManagementSystem {
  static void main() {
    // Create a Student instance
    Student student = Student(
      name: "John Doe",
      age: 20,
      address: "123 Main St",
      studentID: "123",
      grade: "A",
      courseScores: [90, 85, 82],
    );

    Teacher teacher = Teacher(
      name: "Mrs. Smith",
      age: 35,
      address: "456 Oak St",
      teacherID: "T456",
      coursesTaught: ["Math", "English", "Bangla"],
    );

    print("Student Information:");
    student.displayRole();
    print("Name: ${student.name}");
    print("Age: ${student.age}");
    print("Address: ${student.address}");
    print("Average Score: ${student.calculateAverageScore()}");
    print("");

    print("Teacher Information:");
    teacher.displayRole();
    print("Name: ${teacher.name}");
    print("Age: ${teacher.age}");
    print("Address: ${teacher.address}");
    teacher.displayCoursesTaught();
  }
}
void main() {
  StudentManagementSystem.main();
}
