import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/login/body.dart';
import 'package:shop_app/shared/cubit/cubit.dart';
import 'package:shop_app/shared/cubit/states.dart';
import 'package:shop_app/shared/network/local/shared_perfercence.dart';

class Settings_Screen extends StatelessWidget {
   var form_key =GlobalKey<FormState>();
   var name_controller = TextEditingController();
   var email_controller = TextEditingController();
   var phone_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<APP_cubit,states>
      (
        builder:(context,state){
           name_controller.text = APP_cubit.get(context).model.data.name;
           email_controller.text = APP_cubit.get(context).model.data.email;
           phone_controller.text = APP_cubit.get(context).model.data.phone;
           return state is Data_Get_User_Loading ?
           Center(child: CircularProgressIndicator())
               :
           SingleChildScrollView(
             child: Padding(
               padding: const EdgeInsets.all(20.0),
               child: Form(
                 key: form_key,
                 child: Column(
                   children: [
                     if(state is Updatesuccesfulloadingstate)
                         LinearProgressIndicator(),
                     SizedBox(
                       height: 20,
                     ),
                     TextFormField(
                       keyboardType: TextInputType.name,
                       controller: name_controller,
                       validator: (value)
                       {
                         if(value == null)
                         {
                           return 'Please Enter Your Name';
                         }
                       },
                       decoration: InputDecoration(
                           border: OutlineInputBorder(),
                           labelText: 'Name',
                           prefixIcon: Icon(
                               Icons.person
                           )
                       ),
                     ),
                     SizedBox(
                       height: 20,
                     ),
                     TextFormField(
                       keyboardType: TextInputType.emailAddress,
                       controller: email_controller,
                       validator: (value)
                       {
                         if(value == null)
                         {
                           return 'Please Enter Your Email';
                         }
                       },
                       decoration: InputDecoration(
                           border: OutlineInputBorder(),
                           labelText: 'Email',
                           prefixIcon: Icon(
                               Icons.email
                           )
                       ),
                     ),
                     SizedBox(
                       height: 20,
                     ),
                     TextFormField(
                       keyboardType: TextInputType.name,
                       controller: phone_controller,
                       validator: (value)
                       {
                         if(value == null)
                         {
                           return 'Please Enter Your Phone';
                         }
                       },
                       decoration: InputDecoration(
                           border: OutlineInputBorder(),
                           labelText: 'Phone',
                           prefixIcon: Icon(
                               Icons.phone
                           )
                       ),
                     ),
                     SizedBox(
                       height: 20,
                     ),
                     Container(
                       width: double.infinity,
                       color: Colors.deepPurple,
                       child: TextButton(
                           onPressed: (){
                                if(form_key.currentState!.validate())
                                  {
                                     APP_cubit.get(context).Updata_screen(
                                         name: name_controller.text,
                                         email: email_controller.text,
                                         phone: phone_controller.text
                                     );
                                  }
                           },
                           child: Text(
                             'Update',
                             style: TextStyle(
                                 fontSize: 20,
                                 fontWeight: FontWeight.bold,
                                 color: Colors.white
                             ),
                           )
                       ),
                     ),
                     SizedBox(
                       height: 20,
                     ),
                     Container(
                       width: double.infinity,
                       color: Colors.deepPurple,
                       child: TextButton(
                           onPressed: (){
                                 cacheHelper.removegata(key: 'token').then((value) {
                                     if(value)
                                       {
                                          Navigator.pushAndRemoveUntil(context,
                                              MaterialPageRoute(builder: (context) => Body()),
                                                  (route) => false);
                                       }
                                 });
                           },
                           child: Text(
                             'Logout',
                             style: TextStyle(
                                 fontSize: 20,
                                 fontWeight: FontWeight.bold,
                                 color: Colors.white
                             ),
                           )
                       ),
                     )
                   ],
                 ),
               ),
             ),
           );
        }
        , listener:(context,state){

    }
    );
  }
}
