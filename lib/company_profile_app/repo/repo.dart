import 'package:first_flutter_app/company_profile_app/model/company_model.dart';

class RepoData {
  static final CompanyModel bawp = new CompanyModel(
    name: 'Build Apps With Paulo',
    about:
        'Our goal is to teach you the skills and equip you with the tools to become the best mobile developer and programmer you can be. '
        ' We want to make you a well-rounded developer.  That’s the mission.',
    backdropPhoto: 'assets/company.jpg',
    courses: <CourseModel>[
      new CourseModel(
          title: 'The Complete Android & Java Bootcamp',
          thumbnail: 'assets/android.jpg',
          url:
              'https://www.udemy.com/'),
      new CourseModel(
          title: 'Kotlin Android Development Masterclass',
          thumbnail: 'assets/kotlin.png',
          url:
              'https://www.udemy.com/'),
      new CourseModel(
          title: 'Java Design Patterns',
          thumbnail: 'assets/java.jpg',
          url:
              'https://www.udemy.com/java-design-patterns-the-complete-masterclass/?couponCode=BAWP-SITE-COURSES-15'),
      new CourseModel(
          title: 'The Java 9 Master Course',
          thumbnail: 'assets/flutter.jpg',
          url:
              'https://www.udemy.com/the-complete-java-9-masterclass-beginner-to-expert/?couponCode=BAWP-SITE-COURSES-15'),
      new CourseModel(
          title: 'Android Developer Portfolio',
          thumbnail: 'assets/angular.jpg',
          url:
              'https://www.udemy.com/android-developers-portfolio-masterclass-build-7-apps/?couponCode=BAWP-SITE-COURSES-15')
    ],
    location: 'Spokane, WA',
    logo: 'assets/logo.jpg',
  );
}
