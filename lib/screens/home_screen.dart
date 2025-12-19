import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:vijay_test1/const/app_string.dart';
import 'package:vijay_test1/const/text_style.dart';
import 'package:vijay_test1/controllers/home_controller.dart';
import 'package:vijay_test1/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('home init');
    controller.getGridData(context);
  }
  @override

    Widget build(BuildContext context) {
      return Container(
        // color: Color(0xffFFFFFF),
        // bottomNavigationBar: _bottomNav(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Color(0xffFFFFFF),
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Row(
                        children: [
                          GestureDetector(
                            onTap : ()
                            {
                              Get.to(ProfileScreen());
                            },
                            child: Container(
                                height: 38,
                                width: 38,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.blue,
                                ),
                                child: ClipOval(
                                  child: Image.network(
                                      'https://i.pravatar.cc/150?img=3'),
                                )
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(AppString.good_morning,style: AppTextStyle.regular.copyWith(
                                  fontSize: 14, color: Color(0xff7D7D7D),
                                )),
                                SizedBox(height: 4),
                                Text(AppString.gigs_today,
                                  style: AppTextStyle.medium.copyWith(
                                      fontSize: 14,
                                      color: Color(0xff2B2B2B)
                                  ),),
                              ],
                            ),
                          ),
                          SvgPicture.asset('assets/images/noyification_icon.svg')
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          _statCard("52", AppString.past_games, Color(0xffFFF0F8)),
                          const SizedBox(width: 12),
                          _statCard("24", AppString.upcoming_games, Color(0xffF5F3FF)),
                        ],
                      ),
                      const SizedBox(height: 12),

                      Row(
                        children: [
                          Expanded(
                            child: Text(AppString.upcoming_games, style: AppTextStyle.medium.copyWith(
                                fontSize: 14,
                                color: Color(0xff2B2B2B)
                            ),
                                textAlign: TextAlign.start),
                          ),
                          Expanded(
                            child: Text(AppString.see_all, style: AppTextStyle.regular.copyWith(
                              fontSize: 14,
                              color: Color(0xff7D7D7D),
                              decoration: TextDecoration.underline,
                              decorationThickness: 1.5,
                            ),
                                textAlign: TextAlign.end),
                          ),

                          const SizedBox(height: 12),


                          // SvgPicture.asset('assets/images/noyification_icon.svg')
                        ],
                      ),
                      const SizedBox(height: 12),


                      Stack(
                        children: [
                          Container(
                            height: 160,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xff474747),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Stack(
                                children: [

                                  // Top-right image (above background)
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: Stack(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/images/image1.svg',
                                          width: 80,
                                          height: 80,
                                          fit: BoxFit.contain,
                                        ),
                                        Positioned(
                                          top: 14,
                                          right: 15,
                                          child: Text(AppString.current, style: AppTextStyle.regular.copyWith(
                                              fontSize: 14,
                                              color: Color(0xffFFFFFF)
                                          )),
                                        )
                                      ],
                                    ),
                                  ),

                                  // Background image (respect radius)
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: SvgPicture.asset(
                                      'assets/images/image2.svg',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 160,
                            child: Padding(
                              padding: EdgeInsets.only(top: 12, left: 12, bottom: 9),
                              child: Column(
                                mainAxisAlignment: .start,
                                crossAxisAlignment: .start,
                                children: [
                                  Text(AppString.lacrosse, style: AppTextStyle.bold.copyWith(
                                      fontSize: 14,
                                      color: Color(0xffFFFFFF)
                                  ),),
                                  SizedBox(height: 12),
                                  Row(
                                    children: [
                                      SvgPicture.asset('assets/images/location_icon.svg'),
                                      SizedBox(width: 2.5,),
                                      Expanded(
                                        child: Text(AppString.location, style: AppTextStyle.regular.copyWith(
                                            fontSize: 14,
                                            color: Color(0xffFFFFFF)
                                        ),
                                            maxLines: 1, overflow: TextOverflow.ellipsis),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 4),
                                  Row(
                                    children: [
                                      SvgPicture.asset('assets/images/photo_icon.svg'),
                                      SizedBox(width: 2.5,),
                                      Expanded(
                                        child: Text(AppString.photographer, style: AppTextStyle.regular.copyWith(
                                            fontSize: 14,
                                            color: Color(0xffFFFFFF)
                                        ),
                                            maxLines: 1, overflow: TextOverflow.ellipsis),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 33),
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xffFFFFFF),
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(5),
                                          child: Text(AppString.date),
                                        ),
                                      ),
                                      SizedBox(width: 6),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xffFFFFFF),
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(5),
                                          child: Text(AppString.time),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12,),
              Container(
                // height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                    color: Color(0xfff9f9f9)
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Row(
                        children: [
                          Expanded(
                              child: Column(
                                mainAxisAlignment: .start,
                                crossAxisAlignment: .start,
                                children: [
                                  Text(AppString.explore_talent, style: AppTextStyle.medium.copyWith(
                                      fontSize: 14,
                                      color: Color(0xff2C2C2C)
                                  )),
                                  SizedBox(height: 4),
                                  Text(AppString.videographers_list, style: AppTextStyle.regular.copyWith(
                                      fontSize: 14,
                                      color: Color(0xff7D7D7D)
                                  ))
                                ],
                              )),
                          Text(AppString.see_all, style: AppTextStyle.regular.copyWith(
                            fontSize: 14,
                            color: Color(0xff7D7D7D),
                            decoration: TextDecoration.underline,
                            decorationThickness: 1.5,
                          ),
                              textAlign: TextAlign.end),
                        ],
                      ),
                    ),

                    SizedBox(height: 12),
                    Obx(() => controller.isLoading == true ? Container(
                        height: 500,
                        child: Center(child: CircularProgressIndicator())):
                    MasonryGridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: getCrossAxisCount(context),
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      itemCount: controller.gridData.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
                          decoration: BoxDecoration(
                            color: const Color(0xffFFFFFF),
                            borderRadius: BorderRadius.circular(15),
                            // border: Border.all(),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // aapka Row + Text yahin rahega

                              Padding(
                                padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
                                child: Row(
                                  mainAxisAlignment: .start,
                                  crossAxisAlignment: .start,
                                  children: [
                                    Container(
                                      height: 45,
                                      width: 45,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.grey,
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.network(
                                          fit: BoxFit.fill,
                                            controller.gridData[index].downloadUrl!),
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color: Color(0xffF9F9F9)
                                      ),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset('assets/images/star_icon.svg'),
                                          Text('0.5', style: AppTextStyle.regular.copyWith(
                                              fontSize: 14
                                          ),)
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),

                              SizedBox(height: 6),

                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                child: Column(
                                  children: [
                                    Text('${controller.gridData[index].author ?? 'Na'}', style: AppTextStyle.medium.copyWith(
                                        fontSize: 14,
                                        color: Color(0xff2C2C2C)
                                    ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(height: 6),

                              /// Experience pill
                              Center(
                                  child: Container(
                                      padding: EdgeInsets.only(top: 5, bottom: 5, left: 13, right: 13),
                                      decoration: BoxDecoration(
                                        color: const Color(0xffFFF8EE),
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                                      ),
                                      child: Text(
                                        "Id: ${controller.gridData[index].id ?? 'NA'}",
                                        style: AppTextStyle.regular.copyWith(
                                            fontSize: 14,
                                            color: Color(0xff7D7D7D)
                                        ),)))
                            ],
                          ),
                        );
                      },
                    ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }


    Widget _statCard(String value, String label, Color color) {
      return Expanded(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Text(value,
                  style: AppTextStyle.semiBold.copyWith(
                      fontSize: 14,
                      color: Color(0xff2B2B2B)
                  )),
              const SizedBox(height: 2),
              Text(label,
                  style: AppTextStyle.regular.copyWith(
                      fontSize: 14,
                      color: Color(0xff7D7D7D)
                  ),
                  maxLines: 1, overflow: TextOverflow.ellipsis),
            ],
          ),
        ),
      );
    }


    int getCrossAxisCount(BuildContext context) {
      double width = MediaQuery.of(context).size.width;

      if (width < 360) {
        return 2; // very small phones
      } else if (width < 600) {
        return 2; // normal phones
      } else if (width < 900) {
        return 3; // large phones
      } else {
        return 4; // tablets
      }
    }
}