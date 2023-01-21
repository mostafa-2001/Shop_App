import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/categorites_model.dart';
import 'package:shop_app/models/products_model.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/cubit/cubit.dart';
import 'package:shop_app/shared/cubit/states.dart';

class Home_Screen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<APP_cubit,states>(
        listener: (context,state){
          if(state is Favoritessuccessstate)
            {
               if(!state.model.status)
                 {
                    toast_screen(text: state.model.message, state: toast_stata.error);
                 }
            }

        },

        builder: (context,state)
        {
          APP_cubit cubit = APP_cubit.get(context);
          Home_Model? model = APP_cubit.get(context).homemodel;
          Categorites_Model? model_cate = APP_cubit.get(context).categoritesdata;
           return cubit.homemodel != null && cubit.categoritesdata !=null?
           productsbuilder(model!,model_cate!,context) :
           Center(child: CircularProgressIndicator());
        }


    );
  }

  Widget productsbuilder(Home_Model build, Categorites_Model  Model_cate,context) => SingleChildScrollView(
    physics: BouncingScrollPhysics(),
    child: Column(
       children: [
            CarouselSlider(
                items: build.data.banners.map((e) =>Image(
                  image: NetworkImage('${e.image}'),
                  width: double.infinity,
                ) ).toList(),
                options: CarouselOptions(
                    height: 250.0,
                    initialPage: 0,
                  viewportFraction: 1,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayAnimationDuration: Duration(seconds: 1),
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayCurve: Curves.easeInOutSine,
                  scrollDirection: Axis.horizontal
                )
            ),
            SizedBox(
              height: 10,
            ),
             Padding(
               padding: const EdgeInsets.all(15.0),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                     Text(
                         'Categorites',
                        style: TextStyle(
                               fontSize: 20,
                               fontWeight: FontWeight.bold
                        ),
                     ),
                     SizedBox(
                       height: 15,
                     ),
                   Container(
                     height: 100,
                     child: ListView.separated(
                         physics: BouncingScrollPhysics(),
                         scrollDirection: Axis.horizontal,
                         itemBuilder: (context,index) => Categoritesbuilder(Model_cate.data.data[index]),
                         separatorBuilder: (context,index) => SizedBox(width: 10,),
                         itemCount: Model_cate.data.data.length),
                   ),
                   SizedBox(
                     height: 20,
                   ),
                   Text(
                     'New Products',
                     style: TextStyle(
                         fontSize: 20,
                         fontWeight: FontWeight.bold
                     ),
                   ),
                   SizedBox(
                     height: 15,
                   ),

                 ],
               ),
             ),

            GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 0.5,
                crossAxisSpacing: 1,
                childAspectRatio: 1/1.6,
                children: List.generate(build.data.products.length, (index) => productsbuilderindex(build.data.products[index],context)),
            )

       ],
    ),
  );
  
  Widget productsbuilderindex(products_Model_Home build,context) {
   return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Image(image: NetworkImage(build.image),
              width: double.infinity,
              height: 200,

            ),
            if(build.discount != 0)
              Container(
                color: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  'DISCOUNT',
                  style: TextStyle(
                      fontSize: 10,
                      color: Colors.white
                  ),
                ),
              )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                build.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 14,
                    height: 1.3

                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    '${build.price}',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.deepPurple
                    ),
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  if(build.discount != 0)
                    Text(
                      '${build.old_price}',

                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.red,
                          decoration: TextDecoration.lineThrough
                      ),
                    ),
                  Spacer(),
                  CircleAvatar(
                    backgroundColor: APP_cubit.get(context).favorite[build.id] ? Colors.deepPurple : Colors.white,
                    child: IconButton(
                        onPressed: () {
                          APP_cubit.get(context).change_favorite_screen(build.id);
                        },
                        icon: Icon(
                            Icons.favorite_border,
                            color: Colors.grey,
                        )
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
  Widget Categoritesbuilder(Data_Categorites_List model) => Container(
    height: 100,
    width: 100,
    child: Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Image(image: NetworkImage(
          model.image,
        ),
          height: 100,
          width: 100,

        ),
        Container(
          width: double.infinity,
          color: Colors.black.withOpacity(0.8),
          child: Text(
            model.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 13,
                color: Colors.white
            ),
          ),
        )
      ],
    ),
  );
}
