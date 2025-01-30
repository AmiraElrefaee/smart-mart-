import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_mart/const.dart';
import 'package:smart_mart/features/home/presentation/views/widgets/home_page_view_body.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation:  FloatingActionButtonLocation.miniCenterDocked,

      floatingActionButton: Container(
        width: 80,
        height: 80,
        margin: EdgeInsets.only(top: 110),
        child: FloatingActionButton(

          onPressed: (){},
          backgroundColor: kColor,
          shape:   CircleBorder(
             eccentricity: .1
          ),
        child:const Icon( Icons.qr_code_scanner_outlined,

        color: Colors.white,
            size: 50,
            ),),
      ) ,


      bottomNavigationBar:Container(
        height: 120,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/Subtract.png', // Replace with your image path
                fit: BoxFit.fill,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                IconButton(onPressed: (){}, icon:Column(
                  children: [
                    Icon( Icons.home_outlined),
                    Text('home',
                      style: TextStyle(
                          color: Color(0xff484C52)
                      ),
                    ),
                  ],
                )),

                Spacer(flex: 1,),
                IconButton(onPressed: (){}, icon:Column(
                  children: [
                    Icon( Icons.home_outlined),
                    Text('home',
                      style: TextStyle(
                          color: Color(0xff484C52)
                      ),
                    ),
                  ],
                )),

                Spacer(flex: 3,),
                IconButton(onPressed: (){}, icon:Column(
                  children: [
                    Icon( Icons.home_outlined),
                    Text('home',
                      style: TextStyle(
                          color: Color(0xff484C52)
                      ),
                    ),
                  ],
                )),
                Spacer(flex: 1,),
                IconButton(onPressed: (){}, icon:Column(
                  children: [
                    Icon( Icons.home_outlined),
                    Text('home',
                      style: TextStyle(
                          color: Color(0xff484C52)
                      ),
                    ),
                  ],
                )),

              ],
            ),
          ],
        ),
      ) ,
      body: HomePageViewBody(),
    );
  }
}
