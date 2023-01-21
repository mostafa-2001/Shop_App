class Resigter_Model
{
  late bool status;
  late String message;
  Resigter_Data? data;

  Resigter_Model.formjson(Map<String,dynamic> json){

    status = json['status'] ;
    message = json['message'] ;
    data = json['data'] != null ? Resigter_Data.formjson(json['data']) : null;

  }

}

class Resigter_Data
{
  late int id;
  late String name;
  late String email;
  late String phone;
  late String image;
  late String token;

 Resigter_Data.formjson(Map<String,dynamic> json)
  {
    id = json['id'];
    name = json['name'] ;
    email = json['email'] ;
    phone = json['phone'] ;
    image = json['image'] ;
    token = json['token'] ;
  }

}