
class Greengrocermodel {
  String? id;
  String itemName;
  String imgUrl;
  String unit;
  double price;
  String description;
  DateTime dateTime;

  Greengrocermodel(
      {
        this.id,
        required this.itemName,
        required this.imgUrl,
        required this.unit,
        required this.price,
        required this.description,
      required this.dateTime});

  factory Greengrocermodel.fromJson(Map<String, dynamic> json) {
    return Greengrocermodel(
      id: json['id'],
        itemName: json['itemName'],
        imgUrl: json['imgUrl'],
        unit: json['unit'],
        price: json['price'],
        description: json['description'],
        dateTime: DateTime.parse(json['dateTime'])
    );
  }

// convert watermode to JSON, for sending data to firebase
  Map<String, dynamic> toJason() {
    return {
      'id': id,
      'itemName': itemName,
      'imgUrl' : imgUrl,
      'unit' : unit,
      'price' : price,
      'description': description,
      'dateTime': DateTime.now(),
    };
  }
}
