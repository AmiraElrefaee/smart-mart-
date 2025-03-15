import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_mart/features/payment/presentation/views/widgets/section_credit_or_debit.dart';

import '../../../../../const.dart';
import '../../../../../core/widgets/custom_botton.dart';
import 'custom_text_form_filed_add_cart.dart';
import 'custom_title_payment_method.dart';

class AddCartCardsPageView extends StatefulWidget {
  const AddCartCardsPageView({super.key});

  @override
  State<AddCartCardsPageView> createState() => _AddCartCardsPageViewState();
}

class _AddCartCardsPageViewState extends State<AddCartCardsPageView> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  String? selectedCardType;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: 20),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SectionCrediaOrDebit(screenWidth: screenWidth),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: 15),
                      width: screenWidth,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Color(0xffD8DADC)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomSideTitlePayemtMethod(
                              title: "Select your bank",
                            ),

                            DropdownButtonFormField<String>(
                              value: selectedCardType,
                              decoration:InputDecoration(
                                prefixIcon: SizedBox(width: screenWidth*.2,
                                  child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset('assets/payment_icons/image 65.png'
                                      ,width: screenWidth*.12,
                                    ),

                                    Container(
                                      margin: EdgeInsets.only(left: 5),
                                      height: 30,
                                      width: 1,
                                      color: Color(0xffD9D9D9),)
                                  ],),),
                                counterText: "",
                                hintText: 'Banque Masr',
                                hintStyle:TextStyle(
                                  fontWeight: FontWeight.w500, fontFamily: 'Urbanist', fontSize: 16, color: kcolor3,

                                ),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Color(0xffD8DADC))),
                              ),
                              items: ["Visa", "MasterCard", "American Express"].map((String cardType) {
                                return DropdownMenuItem<String>(
                                  value: cardType,
                                  child: Text(cardType, style: TextStyle(
                                    fontWeight: FontWeight.w500, fontFamily: 'Urbanist', fontSize: 16, color: kcolor3,

                                  ),),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedCardType = value;
                                });
                              },
                              validator: (value) => value == null ? "Please select a card type" : null,
                            ),
                            const SizedBox(height: 15),

                            CustomSideTitlePayemtMethod(
                              title:"Cardholder Name",

                            ),
                            CustomTextField(controller: nameController, hint: "Enter your name"),
                            const SizedBox(height: 15),
                            CustomSideTitlePayemtMethod(

                              title:"Card Number",

                            ),

                            CustomTextField(
                              controller: cardNumberController,
                              hint: "Enter cardholder number",
                              keyboardType: TextInputType.number,
                              maxLength: 19,
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly, CardNumberFormatter()],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomSideTitlePayemtMethod(
                                        title: "Expiration Date",
                                      ),


                                      CustomTextField(
                                        controller: expiryDateController,
                                        hint: "02/2026",
                                        keyboardType: TextInputType.number,
                                        maxLength: 5,
                                        inputFormatters: [FilteringTextInputFormatter.digitsOnly, ExpiryDateFormatter()],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomSideTitlePayemtMethod(
                                        title:"CVV Code",
                                      ),

                                      CustomTextField(
                                        controller: cvvController,
                                        hint: "823",
                                        keyboardType: TextInputType.number,
                                        maxLength: 4,
                                        obscureText: true,
                                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            CustomBotton(
              text: 'Add Card',
              background: kColor,
              colorText: Colors.white,
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              onTap: () {
                if (formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Payment successful!")),
                  );
                }
              },
            ),
          ],
        ),
      );
  }



}

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String digitsOnly = newValue.text.replaceAll(RegExp(r'\D'), '');
    String formatted = '';
    for (int i = 0; i < digitsOnly.length; i++) {
      if (i % 4 == 0 && i != 0) formatted += ' ';
      formatted += digitsOnly[i];
    }
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }

}

class ExpiryDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String digitsOnly = newValue.text.replaceAll(RegExp(r'\D'), '');
    String formatted = '';
    for (int i = 0; i < digitsOnly.length; i++) {
      if (i == 2) formatted += '/';
      formatted += digitsOnly[i];
    }
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}