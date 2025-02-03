import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_mart/const.dart';
import '../../../../../core/utils/functions/Navigate_to_page.dart';
import '../../../../../core/utils/functions/app_router.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_botton.dart';
import '../../../../login/presentation/views/widgets/custom_question_botton.dart';
import '../../../../../core/widgets/custom_title.dart';
import '../../../../login/presentation/views/widgets/section_google_botton.dart';
import '../../../domain/entity/register_entity.dart';
import '../../managers/register_cubit/register_cubit.dart';
import '../add_phone_num_view.dart';
import 'custon_form_signUp.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {

  @override
  Widget build(BuildContext context) {
    RegisterEntity user ;
     double screenHeight= MediaQuery.of(context).size.height;
     double screenWidth= MediaQuery.of(context).size.width;
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
      if (state is RegisterSuccess) {
        print("Registration successful, navigating...");

          navigateToPage(AppRouter.kAddPhoneNumPage, context);

      } else if (state is RegisterFailure) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(state.errorMess)));
      }
      },
  builder: (context, state) {
    return SafeArea(child: GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: screenWidth*.09),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding:  EdgeInsets.only(top: screenHeight*.02),
                  child: CustomTitle(
                    sizeBox: 0,
                    fontTitle: .075*MediaQuery.of(context).size.width,
                    fontSubTitle:.039*MediaQuery.of(context).size.width,
                    title: 'Create account',
                    subTitle: 'Start exploring smarter shopping ',
                  ),
                ),
              ),
              SizedBox(
                height:screenHeight*.03 ,
              ),
              CustonFormSignup(
                screenWidth: screenWidth,
                screenHeight:screenHeight ,
              ),



              Padding(
                padding:  EdgeInsets.symmetric(vertical: screenHeight*.019),
                child: Text('Other sign up options',
                  style: Styles.Urbanist16.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(0.7),
                    fontSize: MediaQuery.of(context).size.height*.018,
                  ),
                ),
              ),
              SectionGoogleBotton(
                screenHeight: screenHeight,
                screenWidth: screenWidth,
              ),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: screenHeight*.02),
                child: CustomQuesBotton(
                  mainQest: 'Already have an account ?',
                  bottonText: 'Log in',
                  onTap: (){
                    GoRouter.of(context).pop();
                  },
                ),
              ),

          ],),
        ),
      ),
    ));
  },);
  }
}
