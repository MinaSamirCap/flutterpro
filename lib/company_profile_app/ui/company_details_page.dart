import 'package:first_flutter_app/company_profile_app/model/company_model.dart';
import 'package:flutter/material.dart';

import 'company_details_intro_animation.dart';

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
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Opacity(
          opacity: animation.bgdropOpacity.value,
          child: Image.asset(
            company.backdropPhoto,
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }
}
