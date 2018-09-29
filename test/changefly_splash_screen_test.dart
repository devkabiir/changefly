import 'package:changefly/changefly_splash_screen.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('fades in the changefly-name image', (WidgetTester tester) async {
    // Verify there are no widgets
    expect(find.byType(Widget), findsNothing);

    // Create a `MaterialApp` with our splash screen and trigger a frame
    await tester.pumpWidget(
      Container(
        color: Colors.white,
        child: ChangeflyName(),
      ),
    );

    expect(find.byType(ChangeflyName), findsOneWidget);
    expect(tester.widget<Opacity>(find.byType(Opacity)).opacity, 0.0);

    // Verify ticker providers are running
    expect(tester.hasRunningAnimations, true);

    // The animation lasts for 2 seconds so
    // wait for the animations to reach halfway
    await tester.pump(Duration(seconds: 1));

    // Verify that`Changefly` is displayed at atleast half opacity
    // The opacity at this stage can be anything from 0.0 to <1.0,
    // since flutter is tying to fake as many things as possible
    // including `Duration` and `Ticker`.
    double opacity = tester.widget<Opacity>(find.byKey(const Key('changefly-name'))).opacity;
    expect(opacity >= 0.5 && opacity < 1.0, true);

    // wait for the animations to finish
    await tester.pump(Duration(seconds: 1));

    // Verify that`Changefly` is displayed at full opacity
    expect(tester.widget<Opacity>(find.byKey(const Key('changefly-name'))).opacity, 1.0);

    // wait for any remaining frames.
    await tester.pumpAndSettle();
    // Verify there are no animations remaining
    expect(tester.hasRunningAnimations, false);
  });
}
