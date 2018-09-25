import 'package:changefly/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('splash screen shows "Changefly" text', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(new ChangeflyApp());

    // Verify that`Changefly` is displayed.
    expect(find.text('Changefly'), findsOneWidget);
  });
}
