import 'dart:io';

void main() {
  int i, j, nilai, jmlsmt, jmlmk, jumlahnilai, jumlahsks, totalsks = 0;
  List<List<int>> sks = [];
  List<int> skssmt = List.filled(14, 0);
  List<List<String>> nilaihuruf = [];
  List<List<String>> matkul = [];
  List<double> nr = List.filled(14, 0.0);
  double ipk, totalnr = 0.0;

  print("==============================================");
  print("\tProgram Menghitung IPK Mahasiswa");
  print("==============================================");

  stdout.write("Masukkan jumlah semester: ");
  jmlsmt = int.parse(stdin.readLineSync()!);

  if (jmlsmt < 2 || jmlsmt > 14) {
    print("Jumlah semester salah!");
    return;
  } else {
    for (i = 0; i < jmlsmt; i++) {
      jumlahnilai = 0;
      jumlahsks = 0;

      stdout.write("Masukkan jumlah mata kuliah semester ${i + 1}: ");
      jmlmk = int.parse(stdin.readLineSync()!);

      if (jmlmk < 2) {
        print("Jumlah mata kuliah kurang dari 2 setiap semester");
        return;
      } else {
        sks.add(List.filled(jmlmk, 0));
        nilaihuruf.add(List.filled(jmlmk, ''));
        matkul.add(List.filled(jmlmk, ''));

        for (j = 0; j < jmlmk; j++) {
          print("Masukkan mata kuliah ke ${j + 1}");
          stdout.write("Masukkan nama matkul: ");
          matkul[i][j] = stdin.readLineSync()!;
          stdout.write("Masukkan jumlah sks matkul: ");
          sks[i][j] = int.parse(stdin.readLineSync()!);
          stdout.write("Masukkan nilai matkul: ");
          nilaihuruf[i][j] = stdin.readLineSync()!;
          print("--------------------------------------------");

          if (nilaihuruf[i][j] == 'A') {
            nilai = 4 * sks[i][j];
          } else if (nilaihuruf[i][j] == 'B') {
            nilai = 3 * sks[i][j];
          } else if (nilaihuruf[i][j] == 'C') {
            nilai = 2 * sks[i][j];
          } else if (nilaihuruf[i][j] == 'D') {
            nilai = 1 * sks[i][j];
          } else if (nilaihuruf[i][j] == 'E') {
            nilai = 0 * sks[i][j];
          } else {
            print("Input nilai salah!");
            return;
          }
          jumlahnilai += nilai;

          jumlahsks += sks[i][j];
        }

        if (jumlahsks > 24) {
          print("Jumlah SKS semester lebih dari 24");
          return;
        } else {
          skssmt[i] = jumlahsks;
          nr[i] = jumlahnilai / jumlahsks;
        }
      }
    }
  }

  print("==============================================");
  print("\t\tTranskrip Nilai");
  print("==============================================");

  for (i = 0; i < jmlsmt; i++) {
    print("\nHasil Semester ${i + 1}:\n");
    print(
        "${'Mata Kuliah'.padRight(12)}${'SKS'.padRight(12)}${'Nilai'.padRight(12)}");

    for (j = 0; j < sks[i].length; j++) {
      print(
          "${matkul[i][j].padRight(12)}${sks[i][j].toString().padRight(12)}${nilaihuruf[i][j].padRight(12)}");
    }

    print("\nSKS\t: ${skssmt[i]}");
    print("NR\t: ${nr[i].toStringAsFixed(2)}");
    totalsks += skssmt[i];
    totalnr += nr[i];
    print("--------------------------------------------");
  }

  ipk = totalnr / jmlsmt;
  print("\nTotal SKS\t: $totalsks");
  print("IPK\t\t: ${ipk.toStringAsFixed(2)}");
  print("==============================================");
}
