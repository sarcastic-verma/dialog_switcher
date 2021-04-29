library dialog_switcher;

import 'package:flutter/material.dart';

class DialogSwitcher extends StatefulWidget {
  // external parameters

  /// [frontChild] The child that is shown when widget is rendered
  final Widget frontChild;

  /// [backChild] The child that is shown when widget is switched
  final Widget backChild;

  /// [frontChildOnTap] The callback to do something when [frontChild] is clicked apart from default toggle
  final VoidCallback? frontChildOnTap;

  /// [backChildOnTap] The callback to do something when [backChild] is clicked apart from default toggle
  final VoidCallback? backChildOnTap;

  /// [dialogBackgroundColor]  The BackgroundColor of the parent dialog
  final Color? dialogBackgroundColor;

  /// [dialogBorderRadius] The BorderRadius of the parent dialog
  final double? dialogBorderRadius;

  /// [dialogElevation] The elevation of the parent dialog
  final double? dialogElevation;

  /// [duration] Defaults to Duration(milliseconds: 500)
  /// The duration of the transition from the [frontChild] value to the [backChild].
  ///
  /// This duration is applied to the given [frontChild] when that property is set to
  /// a new child. The same duration is used when fading out, unless
  /// [reverseDuration] is set. Changing [duration] will not affect the
  /// durations of transitions already in progress.
  final Duration? duration;

  /// [reverseDuration] Defaults to Duration(milliseconds: 500)
  /// The duration of the transition from the new [backChild] value to the [frontChild].
  ///
  /// This duration is applied to the given [backChild] when that property is set to
  /// a new child. Changing [reverseDuration] will not affect the durations of
  /// transitions already in progress.
  ///
  /// If not set, then the value of [duration] is used by default.
  final Duration? reverseDuration;

  /// [switchInCurve] Defaults to Curves.linear
  /// The animation curve to use when transitioning [frontChild].
  ///
  /// This curve is applied to the given [frontChild] when that property is set to a
  /// [backChild]. Changing [switchInCurve] will not affect the curve of a
  /// transition already in progress.
  ///
  /// The [switchOutCurve] is used when fading out, except that if [backChild] is
  /// changed while the current child is in the middle of fading in,
  /// [switchInCurve] will be run in reverse from that point instead of jumping
  /// to the corresponding point on [switchOutCurve].
  final Curve? switchInCurve;

  /// [switchOutCurve] Defaults to Curves.linear
  // The animation curve to use when transitioning a previous [child] out.
  ///
  /// This curve is applied to the [backChild] when the child is faded in (or when
  /// the widget is created, for the first child). Changing [switchOutCurve]
  /// will not affect the curves of already-visible widgets, it only affects the
  /// curves of future children.
  ///
  /// If [frontChild] is changed while the current child is in the middle of fading
  /// in, [switchInCurve] will be run in reverse from that point instead of
  /// jumping to the corresponding point on [switchOutCurve].
  final Curve? switchOutCurve;

  /// [childAlignment] Defaults to Alignment.center
  /// The alignment of the origin of the coordinate system in which the scale
  /// takes place, relative to the size of the box.
  ///
  /// For example, to set the origin of the scale to bottom middle, you can use
  /// an alignment of (0.0, 1.0).
  final Alignment? childAlignment;

  DialogSwitcher({
    Key? key,
    required this.frontChild,
    required this.backChild,
    this.frontChildOnTap,
    this.childAlignment,
    this.dialogBorderRadius,
    this.dialogElevation,
    this.dialogBackgroundColor,
    this.backChildOnTap,
    this.switchInCurve,
    this.switchOutCurve,
    this.reverseDuration,
    this.duration,
  }) : super(key: key);

  @override
  _DialogSwitcherState createState() => _DialogSwitcherState();
}

class _DialogSwitcherState extends State<DialogSwitcher> {
  bool isFront = true;

  /// [_useUniqueKey] A boolean to determine if UniqueKey is needed or not
  late bool _useUniqueKey;

  /// [_uniqueKeys] An array that contains the Unique Keys
  late List<UniqueKey> _uniqueKeys;

  @override
  void initState() {
    // to check if a widget will require a unique key or not
    if (widget.frontChild.runtimeType == widget.backChild.runtimeType) {
      _useUniqueKey = true;
      _uniqueKeys = [UniqueKey(), UniqueKey()];
    } else {
      _useUniqueKey = false;
      _uniqueKeys = [];
    }
    super.initState();
  }

  void toggleDialog() {
    setState(() {
      isFront = !isFront;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor:
          widget.dialogBackgroundColor ?? Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(widget.dialogBorderRadius ?? 8.0),
      ),
      elevation: widget.dialogElevation ?? 24.0,
      child: AnimatedSwitcher(
        duration: widget.duration ?? Duration(milliseconds: 500),
        reverseDuration: widget.reverseDuration ??
            widget.duration ??
            Duration(milliseconds: 500),
        switchInCurve: widget.switchInCurve ?? Curves.linear,
        switchOutCurve: widget.switchOutCurve ?? Curves.linear,
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(
            alignment: widget.childAlignment ?? Alignment.center,
            scale: animation,
            child: child,
          );
        },
        child: isFront
            ? GestureDetector(
                child: widget.frontChild,
                onTap: () {
                  toggleDialog();
                  widget.frontChildOnTap?.call();
                },
                key: _useUniqueKey ? _uniqueKeys[0] : null,
              )
            : GestureDetector(
                child: widget.backChild,
                onTap: () {
                  toggleDialog();
                  widget.backChildOnTap?.call();
                },
                key: _useUniqueKey ? _uniqueKeys[1] : null,
              ),
      ),
    );
  }
}
