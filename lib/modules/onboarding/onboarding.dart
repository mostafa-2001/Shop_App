import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/welcome/welcome.dart';
import 'package:shop_app/shared/cubit/cubit.dart';
import 'package:shop_app/shared/cubit/states.dart';
import 'package:shop_app/shared/network/local/shared_perfercence.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class data_model {
  final String title;
  final String body;
  final String image;
  data_model(this.title, this.body, this.image);
}

class OnBoarding extends StatelessWidget {
  var Controller_page = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<APP_cubit,states>(
        listener: (context ,state){},
        builder: (context ,state){
           return Scaffold(
               appBar: AppBar(
                   title: Text(
                         'Online Shop',

                   ),
                 actions: [
                   TextButton(
                       onPressed: (){
                          Submit(context);
                       },
                       child:Text(
                           'Skip',
                           style: TextStyle(
                              color: Colors.black
                           ),

                       )
                   )
                 ],
               ),
               body: Padding(
                 padding: const EdgeInsets.all(20.0),
                 child: Column(

                   children: [
                     Expanded(
                       child: PageView.builder(
                         controller: Controller_page,
                         physics: BouncingScrollPhysics(),
                          onPageChanged: (index)
                         {
                               APP_cubit.get(context).edit_page(index);
                         },
                         itemBuilder: (context, index) => builditem(APP_cubit.get(context).kill[index]),
                         itemCount: APP_cubit.get(context).kill.length,
                       ),
                     ),
                     SizedBox(
                       height: 60,
                     ),
                     Row(
                       children: [
                         SmoothPageIndicator(
                             controller: Controller_page,

                             effect: ExpandingDotsEffect(
                                    dotColor: Colors.transparent,
                                    activeDotColor:Colors.deepPurple ,
                                    dotWidth: 10,
                                    dotHeight: 10,
                                    spacing: 10,
                                    expansionFactor: 5,

                             ),

                             count: APP_cubit.get(context).kill.length
                         ),
                         Spacer(),
                         FloatingActionButton(
                             onPressed: () {
                               if(APP_cubit.get(context).last_page == true)
                                 {
                                   print(APP_cubit.get(context).last_page);
                                    Submit(context);
                                 }else{

                                 print(APP_cubit.get(context).last_page);
                                 Controller_page.nextPage(
                                     duration: Duration(milliseconds: 1000),
                                     curve: Curves.easeInOutSine);
                               }

                             },
                             child: Icon(Icons.arrow_forward_outlined)),
                       ],
                     ),
                     SizedBox(
                       height: 20,
                     ),
                   ],
                 ),
               ));
        },
    );
  }
  void Submit(context)
  {
       cacheHelper.savedata(value: true, key: 'onboarding').then((value) {
         Navigator.pushAndRemoveUntil(
             context,
             MaterialPageRoute(builder: (context) => Login_app() ),
                 (route) => false);
       });
  }
  Widget builditem(data_model model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image(image: AssetImage('${model.image}')),
          ),
          Text(
            '${model.title}',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            '${model.body}',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      );
}
