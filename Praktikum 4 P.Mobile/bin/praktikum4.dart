void main() {
  var list = [1, 2, 3];
  var list2 = [0, ...list];
  // print(list1);
  print(list);
  print(list2);
  print(list2.length);

  // list = [1, 2, null];

  list = [1, 2, 3];
  print(list);
  var list3 = [0, ...?list];
  print(list3.length);

  //Tambahkan variabel list berisi NIM Anda menggunakan Spread Operators. Dokumentasikan hasilnya dan buat laporannya!
  list = [2241760035];
  print(list);
  var list4 = [0, ...?list];
  print(list4.length);

  //langkah 4
  bool promoActive = true;
  var nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
  print(nav);

  //langkah 5
  String login = 'Manager';
  var nav2 = [
    'Home',
    'Furniture',
    'Plants',
    if (login case 'Manager') 'Inventory'
  ];
  print(nav2);

  //langkah 6
  var listOfInts = [1, 2, 3];
  var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
  assert(listOfStrings[1] == '#1');
  print(listOfStrings);
}
