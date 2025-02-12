import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
