import 'package:changefly/changefly_splash_screen.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('animates chagefly-cube image in parts', (WidgetTester tester) async {
    const List<Key> opacityWidgetKeys = const <Key>[
      const Key('changefly-cube-top'),
      const Key('changefly-cube-left'),
      const Key('changefly-cube-right'),
    ];

    const List<Key> imageWidgetKeys = const <Key>[
      const Key('changefly-cube-top-image'),
      const Key('changefly-cube-left-image'),
      const Key('changefly-cube-right-image'),
    ];

    const Duration intermediateDuration = const Duration(milliseconds: 200);

    // Verify there are no widgets
    expect(find.byType(Widget), findsNothing);
    // Create a `MaterialApp` with our splash screen and trigger a frame
    await tester.pumpWidget(
      Container(
        color: Colors.white,
        child: ChangeflyCube(),
      ),
    );

    Opacity top() => tester.widget<Opacity>(find.byKey(opacityWidgetKeys[0]));
    Opacity left() => tester.widget<Opacity>(find.byKey(opacityWidgetKeys[1]));
    Opacity right() => tester.widget<Opacity>(find.byKey(opacityWidgetKeys[2]));

    Image topImage() => tester.widget<Image>(find.byKey(imageWidgetKeys[0]));
    Image leftImage() => tester.widget<Image>(find.byKey(imageWidgetKeys[1]));
    Image rightImage() => tester.widget<Image>(find.byKey(imageWidgetKeys[2]));

    expect(find.byType(ChangeflyCube), findsOneWidget);

    // Verify ticker providers are running
    expect(tester.hasRunningAnimations, true);

    // At the begining nothing should be visible
    expect(top().opacity, 0.0);
    expect(left().opacity, 0.0);
    expect(right().opacity, 0.0);

    // and all images should have width/height 0
    expect(topImage().width, 0.0);
    expect(topImage().height, 0.0);
    expect(leftImage().width, 0.0);
    expect(leftImage().height, 0.0);
    expect(rightImage().width, 0.0);
    expect(rightImage().height, 0.0);

    // After first 200ms changefly-cube-top should have full oppacity and full size
    await tester.pump(intermediateDuration);

    expect(top().opacity, 1.0);
    expect(left().opacity, 0.0);
    expect(right().opacity, 0.0);

    expect(topImage().width, 200.0);
    expect(topImage().height, 200.0);
    expect(leftImage().width, 0.0);
    expect(leftImage().height, 0.0);
    expect(rightImage().width, 0.0);
    expect(rightImage().height, 0.0);

    // After more 200ms changefly-cube-top and changefly-cube-left should have full oppacity and full size
    await tester.pump(intermediateDuration);
    await tester.pump(intermediateDuration);

    expect(top().opacity, 1.0);
    expect(left().opacity, 1.0);
    expect(right().opacity, 0.0);

    expect(topImage().width, 200.0);
    expect(topImage().height, 200.0);
    expect(leftImage().width, 200.0);
    expect(leftImage().height, 200.0);
    expect(rightImage().width, 0.0);
    expect(rightImage().height, 0.0);

    // After more 200ms changefly-cube-top, changefly-cube-left, changefly-cube-right
    // should have full oppacity and full size
    await tester.pump(intermediateDuration);
    await tester.pump(intermediateDuration);

    expect(top().opacity, 1.0);
    expect(left().opacity, 1.0);
    expect(right().opacity, 1.0);

    expect(topImage().width, 200.0);
    expect(topImage().height, 200.0);
    expect(leftImage().width, 200.0);
    expect(leftImage().height, 200.0);
    expect(rightImage().width, 200.0);
    expect(rightImage().height, 200.0);

    // wait for any remaining frames.
    await tester.pumpAndSettle();
    // Verify there are no animations remaining
    expect(tester.hasRunningAnimations, false);
  });

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
    await tester.pump(Duration(milliseconds: 500));

    // Verify that`Changefly` is displayed at atleast half opacity
    // The opacity at this stage can be anything from 0.0 to <1.0,
    // since flutter is tying to fake as many things as possible
    // including `Duration` and `Ticker`.
    double opacity = tester.widget<Opacity>(find.byKey(const Key('changefly-name'))).opacity;
    expect(opacity >= 0.5 && opacity < 1.0, true);

    // wait for the animations to finish
    await tester.pump(Duration(milliseconds: 500));

    // Verify that`Changefly` is displayed at full opacity
    expect(tester.widget<Opacity>(find.byKey(const Key('changefly-name'))).opacity, 1.0);

    // wait for any remaining frames.
    await tester.pumpAndSettle();
    // Verify there are no animations remaining
    expect(tester.hasRunningAnimations, false);
  });
}
