void main() {
  //Tugas Praktvoid main()
  String namaLengkap = "Fifi Novitasari";
  String nim = "2241760035";

  for (int a = 2; a <= 201; a++) {
    bool prima = true;
    for (int b = 2; b < a; b++) {
      if (a % b == 0) {
        prima = false;
        break;
      }
    }
    if (prima) {
      print(a);
      print(namaLengkap + "-" + nim);
    }
  }
}
