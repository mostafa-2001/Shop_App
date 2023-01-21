class Home_Model
{
      late bool status;
      late Data_Home data;
      Home_Model.fromJson( Map<String,dynamic> json)
      {
         status = json['status'];
         data = Data_Home.fromJson(json['data']);
      }
}

class Data_Home {

  List<banners_Model_Home> banners = [];
  List<products_Model_Home> products = [];

  Data_Home.fromJson(Map<String,dynamic> json)
  {
     json['banners'].forEach((element){
           banners.add(banners_Model_Home.fromJson(element));
     });
     json['products'].forEach((element){
           products.add(products_Model_Home.fromJson(element));
     });
  }

}

class banners_Model_Home {

  late int id;
  late String image;

  banners_Model_Home.fromJson(Map<String,dynamic> json)
  {
       id = json['id'];
       image = json['image'];
  }

}

class products_Model_Home {

  late int id;
  late dynamic price;
  late dynamic old_price;
  late dynamic discount;
  late String image;
  late String name;
  late bool in_favorites;
  late bool in_cart;

   products_Model_Home.fromJson( Map<String,dynamic> json)
   {
       id = json['id'];
       price = json['price'];
       old_price = json['old_price'];
       discount = json['discount'];
       image = json['image'];
       name = json['name'];
       in_favorites = json['in_favorites'];
       in_cart = json['in_cart'];

   }

}