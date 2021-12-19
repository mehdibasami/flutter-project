class PhoneModel {
  late String id;
  late String name;
  late String price;
  late String thumbnail;

  PhoneModel(
    this.id,
    this.name,
    this.price,
    this.thumbnail,
  );

  PhoneModel.fromJson(Map<String, dynamic> phone) {
    id = phone['id'];
    name = phone['name'];
    price = phone['price'];
    thumbnail = phone['thumbnail'];
  }
}
