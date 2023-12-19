import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:module_app/presentation/pages/login/login.dart';
import 'package:module_app/presentation/routes/routes.dart';


void main() {
  group('LoginPage Widget Test', () {
    testWidgets('Should render LoginPage', (WidgetTester tester) async {
      await tester.pumpWidget(const GetMaterialApp(
        home: LoginPage(),
      ));

      expect(find.text('MebelApp'), findsOneWidget);
      expect(find.text('Sign Up'), findsOneWidget);
      expect(find.text('Sign In'), findsOneWidget);
    });

    testWidgets('Should navigate to newRegister page when Sign Up button is pressed',
        (WidgetTester tester) async {
      await tester.pumpWidget(const GetMaterialApp(
        home: LoginPage(),
      ));

      await tester.tap(find.text('Sign Up'));
      await tester.pumpAndSettle();

      expect(Get.currentRoute, AppPage.newRegister);
    });

    testWidgets('Should navigate to userLogin page when Sign In button is pressed',
        (WidgetTester tester) async {
      await tester.pumpWidget(const GetMaterialApp(
        home: LoginPage(),
      ));

      await tester.tap(find.text('Sign In'));
      await tester.pumpAndSettle();

      expect(Get.currentRoute, AppPage.userLogin);
    });
  });
}
