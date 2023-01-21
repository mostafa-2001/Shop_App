class Data_Settings {
 late bool status;
 late Data_user data;

  Data_Settings.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data =  Data_user.fromJson(json['data']);
  }

}

class Data_user {

 late int id;
 late String name;
 late String email;
 late String phone;
 late String image;
 late dynamic token;

 Data_user.fromJson(Map<String, dynamic> json){


      id = json['id'];
      name = json['name'];
      email = json['email'];
      phone = json['phone'];
      image = json['image'];
      token = json['token'];

  }


}