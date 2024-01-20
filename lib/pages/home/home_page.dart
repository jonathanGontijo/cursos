import 'package:cursos/common/entities/user.dart';
import 'package:cursos/common/routes/names.dart';
import 'package:cursos/common/values/colors.dart';
import 'package:cursos/pages/home/bloc/home_page_blocs.dart';
import 'package:cursos/pages/home/bloc/home_page_state.dart';
import 'package:cursos/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:cursos/pages/home/widgets/home_page_widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //late HomeController _homeController;
  late UserItem userProfile;
  @override
  void initState() {
    super.initState();
    // _homeController = HomeController(context: context);
    // _homeController.init();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    userProfile = HomeController(context: context).userProfile!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(userProfile.avatar.toString()),
      body: BlocBuilder<HomePageBlocs, HomePageStates>(
        builder: (context, state) {
          if (state.courseItem.isEmpty) {
            HomeController(context: context).init();
            print('..... course is empty');
          } else {
            print('.......state.course is not empty');
          }
          return Container(
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25.w),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: homePageText(
                    "Olá",
                    color: AppColors.primaryThridElementText,
                  ),
                ),
                SliverToBoxAdapter(
                  child: homePageText(
                    userProfile.name!,
                    top: 5,
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.only(top: 20.h),
                ),
                SliverToBoxAdapter(
                  child: searchView(),
                ),
                SliverToBoxAdapter(
                  child: slidersView(context, state),
                ),
                SliverToBoxAdapter(
                  child: menuView(),
                ),
                SliverPadding(
                  padding:
                      EdgeInsets.symmetric(vertical: 18.h, horizontal: 0.w),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      childAspectRatio: 1.6,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      childCount: state.courseItem.length,
                      (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(AppRoutes.COURSE_DETAIL, arguments: {
                              "id": state.courseItem.elementAt(index).id
                            });
                          },
                          child: courseGrid(state.courseItem[index]),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
