/*1กค-5533-57
  2กค-6087-61
  3กค-6230-41
  4กค-5916-44
  5กค-6166-50
  */
void main() {
  // const KEY_DATE = 'date';
  for(int i=3;i>=1;i--)
    print(i);
  for(int i=1;i<=3;i++)
    print(i);
  List<Map<String, dynamic>> reportList = [
    {'date': '1กค', 'case': 5533, 'death': 57}, // date case death คือ key
    {'date': '2กค', 'case': 6027, 'death': 61},
    {'date': '3กค', 'case': 6230, 'death': 41},
    {'date': '4กค', 'case': 5916, 'death': 44},
    {'date': '5กค', 'case': 6166, 'death': 50},
  ];

  /*List<String> dateList = ['1กค', '2กค', '3กค', '4กค', '5กค'];
  List<int> caseList = [5533, 6087, 6230, 5916, 6166];
  List<int> deathList = [57, 61, 41, 44, 50];*/

  /*for (var i = 0; i < reportList.length; i++) {
    print(
        'วันที่ ${reportList[i]['date']}, ติดเชื้อ ${reportList[i]['case']}, เสียชีวิต ${reportList[i]['death']}');
  }*/

  /*var f = (Map<String, dynamic> i){
    print(i);
  };*/

  /*reportList.forEach((Map<String, dynamic> item){
    print( 'วันที่ ${item['date']}, ติดเชื้อ ${item['case']}, เสียชีวิต ${item['death']}');
  });*/

  reportList.forEach((Map<String, dynamic> item) =>
    print( 'วันที่ ${item['date']}, ติดเชื้อ ${item['case']}, เสียชีวิต ${item['death']}')
  );

  List list = [1,2,3,4,5];
  list.forEach((item) {
    print(item);
  });
  List list2 = list.map((i) { return i+10; }).toList();
  print(list2);
  list2.forEach((item) {
    print(item);
  });
  List list3 = list.map((i) { return { 'data' : i} ; }).toList(); // ทำเป็น Map
  print(list3);
  /*list.map((e) {
    return e+10;
  }).toList();*/
}
