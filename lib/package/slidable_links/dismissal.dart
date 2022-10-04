import 'dart:math' as math;
import 'package:flutter/widgets.dart';
import 'controller.dart';

// INTERNAL USE
// ignore_for_file: public_member_api_docs

class SlidableDismissal extends StatefulWidget {
  const SlidableDismissal({
    Key? key,
    required this.controller,
    required this.child,
  }) : super(key: key);

  final Widget child;
  final SlidableController controller;

  @override
  _SlidableDismissalState createState() => _SlidableDismissalState();
}

class _SlidableDismissalState extends State<SlidableDismissal>
    with SingleTickerProviderStateMixin {
  bool resized = false;
  late AnimationController animationController;
  late Animation<double> resizeAnimation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(vsync: this);
    resizeAnimation = animationController.drive(Tween(begin: 1, end: 0));
    widget.controller.resizeRequest.addListener(handleResizeRequestChanged);
  }

  @override
  void didUpdateWidget(covariant SlidableDismissal oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      oldWidget.controller.resizeRequest
          .removeListener(handleResizeRequestChanged);
      widget.controller.resizeRequest.addListener(handleResizeRequestChanged);
    }
  }

  @override
  void dispose() {
    widget.controller.resizeRequest.removeListener(handleResizeRequestChanged);
    animationController.dispose();
    super.dispose();
  }

  void handleResizeRequestChanged() {
    final resizeRequest = widget.controller.resizeRequest.value;

    if (widget.controller.animation.status == AnimationStatus.completed) {
      animationController.duration = resizeRequest!.duration;
      animationController.forward(from: 0).then((_) {
        resizeRequest.onDismissed.call();
      });
      setState(() {
        resized = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (resized) {
      assert(() {
        if (resizeAnimation.status != AnimationStatus.forward) {
          assert(resizeAnimation.status == AnimationStatus.completed);
          throw FlutterError.fromParts(
            <DiagnosticsNode>[
              ErrorSummary(
                'A dismissed Slidable widget is still part of the tree.',
              ),
              ErrorHint(
                'Make sure to implement the onDismissed handle of the '
                'ActionPane and to immediately remove the Slidable widget from '
                'the application once that handler has fired.',
              )
            ],
          );
        }
        return true;
      }());
    }

    return _SizeTransition(
      sizeFactor: resizeAnimation,
      child: widget.child,
    );
  }
}

/// We use a custom SizeTransition to not clip when the sizeFactor is 1.
class _SizeTransition extends AnimatedWidget {
  /// Creates a size transition.
  ///
  ///[sizeFactor], and [axisAlignment] arguments must not be null.

  const _SizeTransition({
    Key? key,
    required Animation<double> sizeFactor,
    this.child,
  }) : super(key: key, listenable: sizeFactor);

  /// The animation that controls the (clipped) size of the child.
  ///
  /// If the value of [sizeFactor] is less than one, the child will be clipped
  /// in the appropriate axis.
  Animation<double> get sizeFactor => listenable as Animation<double>;

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.ProxyWidget.child}
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final value = math.max<double>(sizeFactor.value, 0);
    final AlignmentDirectional alignment;

    alignment = const AlignmentDirectional(0, -1);

    return ClipRect(
      clipBehavior: value == 1 ? Clip.none : Clip.hardEdge,
      child: Align(
        alignment: alignment,
        heightFactor: null,
        widthFactor: value,
        child: child,
      ),
    );
  }
}
