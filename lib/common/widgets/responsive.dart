import 'package:flutter/material.dart';

/// Delegates provided a widget based on the size of the screen.
///
/// The `ResponsiveLayout` widget itself does not render any UI. Instead, it
/// delegates the rendering to the provided common based on the detected screen
/// size:
///   - [mobileBody] for mobile screens.
///   - [tabletBody] for tablet screens.
///   - [desktopBody] for desktop screens.
class ResponsiveLayout extends StatelessWidget {
  /// The widget to display on mobile screens.
  final Widget mobileBody;

  /// The widget to display on tablet screens.
  final Widget tabletBody;

  /// The widget to display on desktop screens.
  final Widget desktopBody;

  /// The constructor for the [ResponsiveLayout] widget.
  const ResponsiveLayout({
    super.key,
    required this.mobileBody,
    required this.tabletBody,
    required this.desktopBody,
  });

  /// The screen width breakpoint for mobile screens.
  ///
  /// Defaults to 600.0.
  static const double mobileBreakpoint = 600.0;

  /// The screen width breakpoint for tablet screens.
  ///
  /// Defaults to 1024.0.
  static const double tabletBreakpoint = 1024.0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      if (constraints.maxWidth < mobileBreakpoint) {
        return mobileBody;
      } else if (constraints.maxWidth < tabletBreakpoint) {
        return tabletBody;
      } else {
        return desktopBody;
      }
    });
  }
}
