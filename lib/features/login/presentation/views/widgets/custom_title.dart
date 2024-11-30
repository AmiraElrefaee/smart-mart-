import 'package:flutter/cupertino.dart';

import '../../../../../const.dart';
import '../../../../../utils/styles.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
       // This ensures the widget rebuilds and triggers animation
      width: MediaQuery.of(context).size.width,
      top: MediaQuery.of(context).size.height * .34,
      child: Column(
        children: [
          Text(
            'Welcome Back', // Assuming `contents[index].title` is the title
            style: Styles.NexaBold32.copyWith(
            height: 0,
                fontSize: .09*MediaQuery.of(context).size.width),
            textAlign: TextAlign.center,

          ),
          SizedBox(height: 0),
          Text('Let’s get started and go shopping',
            style: Styles.Urbanist25.copyWith(color: kcolor3,

                fontSize: .04*MediaQuery.of(context).size.width),

              )
        ],
      ),
    );
  }
}
