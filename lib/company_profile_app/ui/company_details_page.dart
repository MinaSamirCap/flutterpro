import 'dart:ui' as ui;

import 'package:first_flutter_app/company_profile_app/model/company_model.dart';
import 'package:flutter/material.dart';

import 'company_details_intro_animation.dart';
import 'course_card.dart';

class CompanyDetailsPage extends StatelessWidget {
  /// because we have a final variables that in need to be initialized so
  /// we must use the constructor by that way ...
  CompanyDetailsPage(
      {@required this.company, @required AnimationController controller})
      : animation = CompanyDetailsIntroAnimation(controller);

  final CompanyModel company;
  final CompanyDetailsIntroAnimation animation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: animation.controller,
        builder: _createAnimation,
      ),
    );
  }

  Widget _createAnimation(BuildContext context, Widget child) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Opacity(
          opacity: animation.bgdropOpacity.value,
          child: Image.asset(
            company.backdropPhoto,
            fit: BoxFit.cover,
          ),
        ),
        BackdropFilter(
          filter: ui.ImageFilter.blur(
              sigmaX: animation.bgdropBlur.value,
              sigmaY: animation.bgdropBlur.value),
          child: Container(
            color: Colors.black.withOpacity(0.3),
            child: _createContent(),
          ),
        )
      ],
    );
  }

  Widget _createContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _createLogoAvatar(),
          _createAboutCompany(),
          _createCourseScroller()
        ],
      ),
    );
  }

  Widget _createLogoAvatar() {
    return Transform(
      transform: Matrix4.diagonal3Values(
          animation.avatarSize.value, animation.avatarSize.value, 1.0),
      child: Container(
        width: double.infinity,
        height: 110.0,
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset(
                company.logo,
                width: 100.0,
                height: 100.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Build apps with Koko",
                style: TextStyle(
                    fontSize: 19 * animation.avatarSize.value + 2.0,
                    color: Colors.white70),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _createAboutCompany() {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            company.name,
            style: TextStyle(
                color: Colors.white.withOpacity(animation.nameOpacity.value),
                fontSize: 30 * animation.avatarSize.value + 2.0,
                fontWeight: FontWeight.bold),
          ),
          Text(
            company.location,
            style: TextStyle(
                color:
                    Colors.white.withOpacity(animation.locationOpacity.value),
                fontWeight: FontWeight.w500),
          ),

          /// line or divider
          Container(
            margin: const EdgeInsets.symmetric(vertical: 14.0),
            color: Colors.white.withOpacity(0.79),
            width: animation.dividerWidth.value,
            height: 1.0,
          ),

          Text(
            company.about,
            style: TextStyle(
                color: Colors.white.withOpacity(animation.aboutOpacity.value),
                height: 1.4),
          )
        ],
      ),
    );
  }

  Widget _createCourseScroller() {
    return Padding(
      padding: const EdgeInsets.only(top: 14.0),
      child: Transform(
        transform: Matrix4.translationValues(
            animation.courseScrollerXTranslation.value, 0.0, 0.0),
        child: SizedBox.fromSize(
          size: Size.fromHeight(250.0),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 7.0),
              itemCount: company.courses.length,
              itemBuilder: (BuildContext context, int index) {
                var course = company.courses[index];
                return CourseCard(course: course);
              }),
        ),
      ),
    );
  }
}
