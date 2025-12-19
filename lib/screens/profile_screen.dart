import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vijay_test1/const/app_string.dart';
import 'package:vijay_test1/const/text_style.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: ListView(
          children: [
          Stack(
            children: [
              Stack(
                children: [
                  Container(
                    height: 242,
                    width: double.infinity,
                    child: Image.asset(
                        height: 232,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        'assets/images/profile_image.png'),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 120, // ⭐ gradient height control
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xffF0EBDF),
                            Colors.white,
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 242,
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisAlignment: .start,
                        children: [
                          // BackButton(),
                          InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(Icons.arrow_back)),
                          SizedBox(width: 4.83),
                          Text(
                            AppString.settings_profile,
                            style: AppTextStyle.semiBold.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w600
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        mainAxisAlignment: .start,
                        crossAxisAlignment: .start,
                        children: [
                          const SizedBox(height: 23),
                          Center(
                            child: Stack(
                              children: [
                                CircleAvatar(
                                  radius: 45.5,
                                  backgroundColor: Colors.orange.shade200,
                                  child: const Icon(Icons.person, size: 40, color: Colors.brown),
                                ),
                                Positioned(
                                  bottom: -15,
                                  right: 20,
                                  child: CircleAvatar(
                                    // radius: 12,
                                    backgroundColor: Colors.white,
                                    child: Text(AppString.edit, style: AppTextStyle.semiBold.copyWith(
                                        color: Color(0xff474747)
                                    ),),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          Center(
                            child: Text(AppString.user_name, style: AppTextStyle.semiBold.copyWith(
                                fontSize: 14
                            )),
                          ),
                          const SizedBox(height: 5),
                          Center(
                            child: Text(
                              AppString.user_email,
                              style: AppTextStyle.regular.copyWith(
                                  fontSize: 12
                              ),
                            ),
                          ),

                          const SizedBox(height: 16),


                          Text(AppString.settings, style: AppTextStyle.semiBold.copyWith(
                              fontSize: 14
                          ),
                            textAlign: TextAlign.start,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: .start,
              crossAxisAlignment: .start,
              children: [

                SizedBox(height: 12,),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration:  BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xffF9F9F9),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Center(
                                  child: Text(AppString.notifications, style: AppTextStyle.regular.copyWith(
                                      fontSize: 14
                                  ),
                                    maxLines: 1, overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                              ),
                              Expanded(
                                  flex:1,
                                  child: SvgPicture.asset('assets/images/toggle_icon.svg'))
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        decoration:  BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xffF9F9F9),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Center(
                                  child: Text(AppString.bookmark, style: AppTextStyle.regular.copyWith(
                                      fontSize: 14
                                  ),
                                    maxLines: 1, overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                              ),
                              Expanded(
                                  flex:1,
                                  child: Icon(Icons.arrow_right))
                            ],
                          ),
                        ),
                      ),
                    ),            ],
                ),

                SizedBox(height: 12),

                Text(AppString.support_help, style: AppTextStyle.semiBold.copyWith(
                    fontSize: 14
                ),
                  textAlign: TextAlign.start,),

                SizedBox(height: 12),

                _ListTileItem(
                  icon: Icons.support_agent,
                  title: AppString.contact_support,
                ),
                SizedBox(height: 12),
                _ListTileItem(
                  icon: Icons.report_problem_outlined,
                  title: AppString.report_problem,
                ),
                SizedBox(height: 12),
                _ListTileItem(
                  icon: Icons.star_border,
                  title: AppString.rate_us,
                ),

                SizedBox(height: 12),

                Text(AppString.account, style: AppTextStyle.semiBold.copyWith(
                    fontSize: 14
                ),
                  textAlign: TextAlign.start,),

                SizedBox(height: 12),
                _ListTileItem(
                  icon: Icons.delete_outline,
                  title: AppString.delete_account,
                ),

                SizedBox(height: 14,),
                Center(
                  child: Text(AppString.logout, style: AppTextStyle.medium.copyWith(
                      fontSize: 14,
                      color: Color(0xffFF3B30)
                  ),),
                )


              ],
            ),
          ),
          ],
        ),
      ),
    );
  }
}


class _ListTileItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget? trailing;

  const _ListTileItem({
    required this.icon,
    required this.title,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffF9F9F9),
        borderRadius: BorderRadius.circular(14),
      ),
      child: ListTile(
        // leading: Icon(icon),
        title: Text(title, style: const TextStyle(fontSize: 14, color: Colors.black,)),
        trailing: trailing ?? const Icon(Icons.chevron_right, color: Colors.black,),
        onTap: () {},
      ),
    );
  }
}