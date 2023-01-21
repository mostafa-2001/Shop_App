class Categorites_Model {
  late bool status;
  late Data_Categorites data;
  Categorites_Model.fromjson(Map<String,dynamic> json)
  {
       status = json['status'];
       data = Data_Categorites.fromJson(json['data']);
  }
}

class Data_Categorites{

   late int current_page;
   List<Data_Categorites_List> data = [];
   Data_Categorites.fromJson(Map<String,dynamic> json)
   {
       current_page = json['current_page'];
       json['data'].forEach((element){
           data.add(Data_Categorites_List.fromJson(element));
       });
   }
}

class Data_Categorites_List
{
       late int id;
       late String name;
       late String image;
       Data_Categorites_List.fromJson(Map<String,dynamic> json)
       {
             id = json['id'];
             name = json['name'];
             image = json['image'];
       }

}