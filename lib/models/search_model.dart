
class Search_Model
{
       late dynamic status;
       late Search_Data data;

       Search_Model.fromJson(Map<String,dynamic>json)
       {
          status = json['status'];
          data = Search_Data.fromJson(json['data']);
       }

}

class Search_Data
{
  late int current_page;
  List<Search_Data_List> data = [];

  Search_Data.fromJson(Map<String,dynamic>json)
  {
    current_page = json['current_page'];
    json['data'].forEach((element){
        data.add(Search_Data_List.fromJson(element));
    });
  }
}

class Search_Data_List
{
    late int id;
    late dynamic price;
    late String image;
    late String name;
    late bool in_favorite;
    late bool in_cart;

    Search_Data_List.fromJson(Map<String,dynamic>json)
    {
       id = json['id'];
       price = json['price'];
       image = json['image'];
       name = json['name'];
       in_favorite = json['in_favorites'];
       in_cart = json['in_cart'];
    }

}