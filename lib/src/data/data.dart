import 'package:flutter/material.dart';
import 'package:greengrocher/src/model/greenGrocerModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Data extends ChangeNotifier {
  List<Greengrocermodel> greenDataList = [];

  // add water
  void addGreenGrocer(Greengrocermodel green) async {
    final url =
        Uri.https('quitanda-fef8a-default-rtdb.firebaseio.com', 'green.json');
    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(
        {
          'id': green.id,
          'itemName': green.itemName,
          'imgUrl': green.imgUrl,
          'unit': green.unit,
          'price': double.parse(green.price.toString()),
          'description': green.description,
          'dateTime': DateTime.now().toString()
        },
      ),
    );

    if (response.statusCode == 200) {
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      greenDataList.add(Greengrocermodel(
        id: green.id,
        itemName: green.itemName,
        imgUrl: green.imgUrl,
        description: green.description,
        price: green.price,
        unit: green.unit,
        dateTime: green.dateTime,
      ));
    } else {
      print('${response.statusCode}');
    }

    //notifyListeners();
  }

  Future<List<Greengrocermodel>> getWater() async {
    final url =
        Uri.https('quitanda-fef8a-default-rtdb.firebaseio.com', 'green.json');

    final response = await http.get(url);
    if (response.statusCode == 200 && response.body != null) {
      // it is ok
      greenDataList.clear();
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      for (var element in extractedData.entries) {
        greenDataList.add(Greengrocermodel(
          id: element.value['id'],
            itemName: element.value['itemName'],
            price: element.value['price'],
            description: element.value['description'],
            imgUrl: element.value['imgUrl'],
            dateTime: DateTime.parse(element.value['dateTime']),
            unit: element.value['unit']));
      }
    }

    notifyListeners();
    return greenDataList;
  }

  // get weekday from a dateTime object
  String? getWeekday(DateTime dateTime) {
    switch (dateTime.weekday) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tues';
      case 3:
        return 'Wed';
      case 4:
        return 'thur';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
    }
  }

  DateTime getStartofWeek() {
    DateTime? startofWeek;

    // get the current date
    DateTime dateTime = DateTime.now();

    for (int i = 0; i < 7; i++) {
      if (getWeekday(dateTime.subtract(Duration(days: i))) == 'Sun') {
        startofWeek = dateTime.subtract(Duration(days: i));
      }
    }
    return startofWeek!;
  }

  void delete(Greengrocermodel waterModel) {
    final url = Uri.https('quitanda-fef8a-default-rtdb.firebaseio.com',
        'green./${waterModel.id}.json');
//http.delete(url);

// remove the item from our list
    greenDataList.removeWhere((element) => element.id == waterModel.id!);
    notifyListeners();

    }
}
