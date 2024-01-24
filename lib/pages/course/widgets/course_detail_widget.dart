import 'package:cursos/common/values/colors.dart';
import 'package:cursos/common/values/constant.dart';
import 'package:cursos/common/widgets/base_text_widget.dart';
import 'package:cursos/pages/course/course_detail/bloc/course_detail_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar() {
  return AppBar(
    title: reusableText("Detalhes do Cursos"),
    centerTitle: true,
  );
}

Widget thumbNail(CourseDetailStates states) {
  return Container(
    width: 325.w,
    height: 200.h,
    decoration: BoxDecoration(
      image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: NetworkImage(
              "${AppConstants.SERVER_UPLOADS}${states.courseItem?.thumbnail}")),
    ),
  );
}

Widget menuView() {
  return Container(
    width: 325.w,
    child: Row(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15.w,
              vertical: 5.h,
            ),
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.circular(7.w),
              border: Border.all(color: AppColors.primaryElement),
            ),
            child: reusableText(
              "Autor",
              color: AppColors.primaryFourthElementText,
              fontWeight: FontWeight.bold,
              fontSize: 10.sp,
            ),
          ),
        ),
        _iconAndNum(
          'assets/icons/people.png',
          0,
        ),
        _iconAndNum(
          'assets/icons/star.png',
          0,
        ),
      ],
    ),
  );
}

Widget _iconAndNum(String iconPath, int num) {
  return Container(
    margin: EdgeInsets.only(left: 30.w),
    child: Row(
      children: [
        Image(
          image: AssetImage(iconPath),
          width: 20.w,
          height: 20.h,
        ),
        reusableText(
          num.toString(),
          color: AppColors.primaryThridElementText,
          fontSize: 11.sp,
          fontWeight: FontWeight.normal,
        ),
      ],
    ),
  );
}

Widget descriptionText(CourseDetailStates states) {
  return reusableText(
    "${states.courseItem?.description}",
    color: AppColors.primaryThridElementText,
    fontWeight: FontWeight.normal,
    fontSize: 11.sp,
  );
}

Widget goBuyButton(String name) {
  return Container(
    padding: EdgeInsets.only(top: 13.h),
    width: 330.w,
    height: 50.h,
    decoration: BoxDecoration(
      color: AppColors.primaryElement,
      borderRadius: BorderRadius.circular(10.w),
      border: Border.all(
        color: AppColors.primaryElement,
      ),
    ),
    child: Text(
      name,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: AppColors.primaryElementText,
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}

Widget courseSummaryTitle() {
  return reusableText("O Curso Inclui.", fontSize: 16.sp);
}

//setting sections buttons
var imagesInfo = <String, String>{
  "36 Horas de video": "video_detail.png",
  "Total de aulas": "file_detail.png",
  "67 Download Resources": "download_detail.png",
};

Widget courseSummaryView(BuildContext context) {
  return Column(
    children: [
      ...List.generate(
        imagesInfo.length,
        (index) => GestureDetector(
          onTap: () => null,
          child: Container(
            margin: EdgeInsets.only(top: 15.h),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(7.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.w),
                    color: AppColors.primaryElement,
                  ),
                  child: Image.asset(
                    "assets/icons/${imagesInfo.values.elementAt(index)}",
                    width: 30.w,
                    height: 30.h,
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Text(
                  imagesInfo.keys.elementAt(index),
                  style: TextStyle(
                      color: AppColors.primarySecondaryElementText,
                      fontWeight: FontWeight.bold,
                      fontSize: 11.sp),
                ),
              ],
            ),
          ),
        ),
      )
    ],
  );
}

Widget courseLessonList() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
    width: 325.w,
    height: 80.h,
    decoration: BoxDecoration(
      color: Color.fromRGBO(255, 255, 255, 1),
      borderRadius: BorderRadius.circular(10.w),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 2,
          blurRadius: 3,
          offset: const Offset(0, 1),
        ),
      ],
    ),
    child: InkWell(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 60.w,
                height: 60.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.h),
                  image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/icons/image_1.png"),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _listContainer("UI Design"),
                  _listContainer("UI Design",
                      fontSize: 10,
                      color: AppColors.primaryThridElementText,
                      fontWeight: FontWeight.normal),
                ],
              )
            ],
          ),
          Container(
            width: 25.h,
            height: 25.h,
            child: Image(
              image: AssetImage("assets/icons/arrow_right.png"),
            ),
          )
        ],
      ),
    ),
  );
}

Widget _listContainer(
  String text, {
  double fontSize = 13,
  Color color = AppColors.primaryText,
  fontWeight = FontWeight.bold,
}) {
  return Container(
    width: 200.w,
    margin: EdgeInsets.only(left: 6.w),
    child: Text(
      text,
      overflow: TextOverflow.clip,
      maxLines: 1,
      style: TextStyle(
        color: color,
        fontSize: fontSize.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
