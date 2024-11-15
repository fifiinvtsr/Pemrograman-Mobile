void main() {
//Praktikum 3: Menerapkan Perulangan "for" dan "break-continue"

// for (int Index = 10; index < 27; index++) {
//   print(Index);
// }

  for (int index = 10; index < 27; index++) {
    if (index == 21)
      break;
    else if (index > 1 || index < 7) continue;
    print(index);
  }
}
