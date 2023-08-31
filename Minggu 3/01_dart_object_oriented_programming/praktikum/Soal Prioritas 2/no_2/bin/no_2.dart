import 'package:no_2/no_2.dart' as no_2;
import 'package:test/scaffolding.dart';

class Course {
  final String judul;
  final String deskripsi;

  Course({required this.judul, required this.deskripsi});
}

class Student {
  String nama = "", kelas = "";
  List<Course> daftarCourse = [];

  Student({required this.nama, required this.kelas});

  void tambahCourse(Course course) {
    if (!daftarCourse.contains(course)) {
      daftarCourse.add(course);
    }
  }

  void hapusCourse(String judul) {
    daftarCourse.removeWhere((judulCourse) => judulCourse.judul == judul);
  }

  List getSemuaCourse() {
    return daftarCourse;
  }
}

void main(List<String> arguments) {
  Course course1 = Course(judul: 'Matematika', deskripsi: 'Belajar Menghitung');
  Course course2 =
      Course(judul: 'Bahasa Indonesia', deskripsi: 'Belajar Memabaca');

  Student student1 = Student(nama: 'Ferdy', kelas: '12');
  var semuaCourse = student1.getSemuaCourse();

  print('Nama = ${student1.nama}');
  print('Kelas = ${student1.kelas}');
  print('\n======List Pelajaran diambil======');

  student1.tambahCourse(course1);
  student1.tambahCourse(course2);

  for (var course in semuaCourse) {
    print('Judul : ${course.judul} \nDeskripsi : ${course.deskripsi} \n');
  }

  //Hapus Matematika dari list dengan judul = Matematika
  student1.hapusCourse('Matematika');
  print('\n======List Pelajaran diambil setelah dihapus======');

  for (var course in semuaCourse) {
    print('Judul : ${course.judul} \nDeskripsi : ${course.deskripsi} \n');
  }
}
