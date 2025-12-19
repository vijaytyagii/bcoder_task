import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vijay_test1/const/app_string.dart';
import 'package:vijay_test1/const/error_snack.dart';
import 'package:vijay_test1/controllers/explore_controller.dart';
import 'package:vijay_test1/screens/profile_screen.dart';

import '../const/text_style.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreSreenState();
}

class _ExploreSreenState extends State<ExploreScreen> {

  final ExploreController controller = Get.put(ExploreController());
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    controller.listData.clear();
    controller.pageNo.value = 1;
    controller.isFirstLoading.value = true;
    controller.getListData(context);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 100) {

        if (!controller.isLoading.value) {
          // controller.isLoading.value = true;
          if(controller.pageNo < 10)
            {
              controller.getListData(context); // pagination call
          }
          else
            {
              ErrorSnack.errorSnackBar(context, 'Limit Full of Items');
            }
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Obx(() => Stack(
      children: [
        Container(
          color: Color(0xffFFFFFF),
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 12),
                  child: Row(
                    mainAxisAlignment: .start,
                    crossAxisAlignment: .start,
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
                            Text(AppString.explore_gamehub,
                              style: AppTextStyle.medium.copyWith(
                                  fontSize: 14,
                                  color: Color(0xff2B2B2B)
                              ),),
                            SizedBox(height: 4),
                            Text(AppString.explore_games_desc,style: AppTextStyle.regular.copyWith(
                              fontSize: 14, color: Color(0xff7D7D7D),
                            )),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Color(0xff474747)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 9,vertical: 6),
                          child: Text('+ Game',
                            style: AppTextStyle.regular.copyWith(
                                color: Color(0xffFFFFFF),
                                fontSize: 14
                            ),),
                        ),
                      ),
                      SvgPicture.asset('assets/images/search_icon.svg')
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  child:  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 12),
                        child: Stack(
                          children: [
                            Container(
                              height: 160,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xffF9F9F9),
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
                                            color: Color(0xffFFFFFF),
                                            width: 80,
                                            height: 80,
                                            fit: BoxFit.contain,
                                          ),
                                        ],
                                      ),
                                    ),

                                    // Background image (respect radius)
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: SvgPicture.asset(
                                        'assets/images/card_icon.svg',
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
                                    Row(
                                      children: [
                                        Expanded(
                                          flex:1,
                                          child: Container(
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              // borderRadius: BorderRadius.circular(15),
                                              shape: BoxShape.circle,
                                              // color: Colors.grey,
                                            ),
                                            child: ClipOval(
                                              // borderRadius: BorderRadius.circular(15),
                                              child: Image.network(
                                                  fit: BoxFit.fill,
                                                  controller.listData[index].thumbnail!),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Column( mainAxisAlignment: .start,
                                            crossAxisAlignment: .start,
                                            children: [
                                              Text('${controller.listData[index].title}', style: AppTextStyle.bold.copyWith(
                                                  fontSize: 14,
                                                  color: Colors.black
                                              ),),
                                              SizedBox(height: 12),
                                              Text('id: ${controller.listData[index].id}', style: AppTextStyle.regular.copyWith(
                                                  fontSize: 14,
                                                  color: Colors.black

                                              ),),
                                              SizedBox(height: 5,),
                                              Text('price: ${controller.listData[index].price}', style: AppTextStyle.regular.copyWith(
                                                  fontSize: 14,
                                                  color: Colors.black

                                              ),)
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 4),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    itemCount: controller.listData.length,
                  ),
                ),          ],
            ),
          ),
        ),
        controller.isFirstLoading.value == true && controller.isLoading.value == true ? Center(child: CircularProgressIndicator()) : SizedBox(),
    controller.isFirstLoading.value == false &&
    controller.isLoading.value == true
    ? Positioned(
    bottom: 80,
    left: 0,
    right: 0,
    child: const Center(
    child: CircularProgressIndicator(),
    ),
    )
        : const SizedBox()

    ],
    ));
  }
}