class Get_Favorites{
     late bool status;
     late Data_Favorites data;
     Get_Favorites.fromJson(Map<String,dynamic> json)
     {
        status = json['status'];
        data = Data_Favorites.fromJson(json['data']);
     }
}

class Data_Favorites{
    late int current_page;
    List <Data_Favorites_List> data = [];
    Data_Favorites.fromJson(Map<String,dynamic> json )
    {
       current_page = json['current_page'];
       json['data'].forEach((element){
          data.add(Data_Favorites_List.fromJson(element));
       });
    }
}

class Data_Favorites_List{

  late int id;
  late Data_Favorites_List_product product;
  
  Data_Favorites_List.fromJson(Map<String,dynamic> json)
  {
    id = json['id'];
    product = Data_Favorites_List_product.fromJson(json['product']);
  }

}

class Data_Favorites_List_product{
    late int id;
    late dynamic price;
    late dynamic old_price;
    late dynamic discount;
    late String image;
    late String name;

    Data_Favorites_List_product.fromJson(Map<String,dynamic> json)
    {
       id = json['id'];
       price =json['price'];
       old_price = json['old_price'];
       discount = json['discount'];
       image = json['image'];
       name = json['name'];
    }

}