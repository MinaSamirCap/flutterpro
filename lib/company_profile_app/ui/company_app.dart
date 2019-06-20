import 'package:flutter/material.dart';

import 'company_details_animator.dart';
import 'company_details_page.dart';

class CompanyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CompanyDetailsAnimator(),
    );
  }
}
