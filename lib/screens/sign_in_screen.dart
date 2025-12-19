import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vijay_test1/const/app_string.dart';
import 'package:vijay_test1/const/error_snack.dart';
import 'package:vijay_test1/const/text_style.dart';

import '../const/colors.dart';
import '../controllers/sign_in_controller.dart';

class SignInScreen extends GetView<SignInController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Obx(() => Stack(
          children: [
            Opacity(
              opacity: controller.isLoading.value ? 0.4 : 1.0,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 156 + MediaQuery.of(context).padding.top,
                      decoration: BoxDecoration(
                        // color: Colors.red,
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColor.gradientContainerTop,
                            AppColor.gradientContainerBottom,
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top + 16,
                          bottom: 16,
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            "assets/images/circular_icon.svg",
                          ),
                        ),
                      ),
                    ),
                    Container(
                      // height: 67,
                      child: Column(
                        children: [
                          Text(AppString.string_get_started_with_ezgi, style: AppTextStyle.semiBold.copyWith(
                            fontSize: 16,
                            color: Color(0xff2C2C2C),
                          ),
                              textAlign: TextAlign.center
                          ),
                          SizedBox(height: 4,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 50),
                            child: Text(AppString.connecting_you_to_real_opportunities_anytime_anywhere, style: AppTextStyle.regular.copyWith(
                                fontSize: 14,
                                color: Color(0xff7D7D7D)
                            ),
                                textAlign: TextAlign.center
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: .center,
                            crossAxisAlignment: .center,
                            children: [
                              SvgPicture.asset(
                                height: 50,
                                width: 50,
                                "assets/images/google_icon.svg",
                              ),
                              SizedBox(width: 10),
                              SvgPicture.asset(
                                height: 50,
                                width: 50,
                                "assets/images/apple_icon.svg",
                              ),
                            ],
                          ),
                          SizedBox(height: 12),
                          Row(
                            children: [
                              // Divider(),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 47, right: 2),
                                  child: Container(
                                    height: 0.5,
                                    width: double.infinity,
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          Color(0xffFFFFFF),
                                          Color(0xff000000),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Text(AppString.or, style: AppTextStyle.regular.copyWith(
                                  fontWeight: FontWeight.w300
                              )),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 47, left: 2),
                                  child: Container(
                                    height: 0.5,
                                    width: double.infinity,
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.centerRight,
                                        end: Alignment.centerLeft,    // opposite
                                        colors: [
                                          Color(0xffFFFFFF),
                                          Color(0xff000000),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              // Divider(),
                            ],
                          ),
                          SizedBox(height: 12),
                          controller.emailorPhone.value.toString().toLowerCase()==AppString.phone
                          ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Row(
                              children: [
                                Container(
                                  height: 55,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffF9F9F9),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
                                    child: Center(
                                      child: Row(
                                        children: [
                                          const Text(
                                            "🇮🇳  +91",
                                            style: TextStyle(fontSize: 14, color: Colors.black),
                                          ),
                                          Icon(Icons.arrow_drop_down_rounded, color: Colors.black)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Expanded(
                                  child: Container(
                                    height: 55,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffF9F9F9),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: TextField(
                                      controller: controller.mobile,
                                      keyboardType: TextInputType.phone,
                                      decoration: const InputDecoration(
                                          hintText: "Phone",
                                          hintStyle: TextStyle(color: Colors.black),
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.only(left: 16, top: 8)
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                          : Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Row(
                              children: [
                                // Email TextField (LEFT - Expanded)
                                Expanded(
                                  child: Container(
                                    height: 55,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffF9F9F9),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: TextField(
                                      controller: controller.email,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: const InputDecoration(
                                        hintText: "Email",
                                        hintStyle: TextStyle(color: Colors.black),
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.only(left: 16, top: 8),
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(width: 6),

                                // Small Container (RIGHT)
                                Container(
                                  height: 55,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffF9F9F9),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
                                    child: Center(
                                      child: Row(
                                        children: const [
                                          Icon(Icons.email_outlined, color: Colors.black),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 12,),

                          GestureDetector(
                            onTap: () {
                              controller.changeValue();
                            },
                            child: Container(
                              // height: 30,
                                decoration: BoxDecoration(
                                  color: const Color(0xffF9F9F9),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                                  child: Text(controller.emailorPhone.value.toString().toLowerCase()==AppString.phone ? AppString.use_email_iD : AppString.use_email_iD, style: AppTextStyle.regular.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.underline,
                                    decorationThickness: 1.5,
                                  ),),
                                )
                            ),
                          ),

                          SizedBox(height: 78),


                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 42),
                            child: GestureDetector(
                              onTap: () {
                                if(controller.emailorPhone.toString().toLowerCase() == AppString.phone.toLowerCase())
                                  {
                                    print('if');
                                    ErrorSnack.errorSnackBar(context, 'This Functional');
                                  }
                                else
                                  {
                                    print('else');
                                    controller.login(context);
                                  }
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 14),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Color(0xff474747),
                                ),
                                child: Center(
                                  child: Text(AppString.verify, style: AppTextStyle.semiBold.copyWith(
                                    fontSize: 14,
                                    color: Color(0xffFFFFFF)
                                  ),),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 20,),



                         Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Color(0xffF9F9F9),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                child: Row(
                                  mainAxisAlignment: .center,
                                  mainAxisSize: .min,
                                  children: [
                                    Text(AppString.dont_havea_ccount, style: AppTextStyle.regular.copyWith(
                                      fontSize: 14
                                    ),),
                                    SizedBox(width: 5,),
                                    Text('Sign up', style: AppTextStyle.medium.copyWith(
                                        fontSize: 14,
                                      decoration: TextDecoration.underline,
                                      decorationThickness: 1.5,
                                    ),)
                                  ],
                                ),
                              ),
                            ),
                          // SizedBox(height: 40,)

                          // Spacer(),
                          Container(height: 170,),
                          Container(
                              padding: EdgeInsets.only(left: 28, right: 28, bottom: 40),
                              child: Text(AppString.appString_ontrary_to_popular_belief_Lorem_ipsum_is_not_simply_random_text_It_has_roots_in_a_piece_of_classical_Latin_literature_from_45_BC, style: AppTextStyle.medium.copyWith(
                                fontSize: 10,
                                fontWeight: FontWeight.w300,
                                color: Color(0xff7D7D7D),
                              ),
                                textAlign: TextAlign.center,
                              ))

                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            controller.isLoading.value == true ? Center(child: CircularProgressIndicator()) : SizedBox()
          ],
        )),
      )
    );
  }
}
