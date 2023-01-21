import 'package:shop_app/models/Settings_model.dart';
import 'package:shop_app/models/change_favorite_model.dart';
import 'package:shop_app/models/login_model.dart';
import 'package:shop_app/models/register_model.dart';

abstract class states{}

class initailstate extends states{}

class EDIT_Viewpage extends states{}

class change_iconpassword extends states{}

class Loginsuccesfulstate extends states{

  final Login_Model User_mode;

  Loginsuccesfulstate(this.User_mode);
}


class Loginerrorstate extends states{
  final String error;
  Loginerrorstate(this.error);
}

class Loginsuccesfulloadingstate extends states{}

class Registersuccesfulstate extends states{

   final Resigter_Model model;

  Registersuccesfulstate(this.model);
}


class Registererrorstate extends states{
  final dynamic error;
  Registererrorstate(this.error);
}

class Registersuccesfulloadingstate extends states{}

class Updatesuccesfulstate extends states{

  final Data_Settings model;

  Updatesuccesfulstate(this.model);
}


class Updateerrorstate extends states{
  final dynamic error;
  Updateerrorstate(this.error);
}

class Updatesuccesfulloadingstate extends states{}

class Change_Screen_layout extends states{}

class Homeloadingstate extends states{}

class Homesuccessstate extends states{}

class Homeerrorstate extends states{
  final dynamic error;
  Homeerrorstate(this.error);
}

class Categoritessuccessstate extends states{}

class Categoriteserrorstate extends states{
  final dynamic error;
  Categoriteserrorstate(this.error);
}
class FavoritesChangestate extends states{

}

class Favoritessuccessstate extends states{
  final Change_Favorite model;
  Favoritessuccessstate(this.model);
}

class Favoriteserrorstate extends states{
  final dynamic error;
  Favoriteserrorstate(this.error);
}

class Favorites_Get_loading extends states{}

class Favorites_Get_Success extends states{}


class Favorites_Get_error extends states{

  final dynamic error;

  Favorites_Get_error(this.error);

}

class Data_Get_User_Success extends states{}

class Data_Get_User_Error extends states{

  final dynamic error;

  Data_Get_User_Error(this.error);

}

class Data_Get_User_Loading extends states{}

class Search_Data_Loading extends states{}

class Search_Data_Succesfull extends states{}

class Search_Data_Error extends states{

  final dynamic error;

  Search_Data_Error(this.error);

}