import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:treeved_assignment/package/src/auto_close_behavior.dart';
import 'package:treeved_assignment/package/src/notifications_old.dart';

import 'action_pane_configuration.dart';
import 'controller.dart';
import 'dismissal.dart';
import 'gesture_detector.dart';
import 'scrolling_behavior.dart';

part 'action_pane.dart';

/// A widget which can be dragged to reveal contextual actions.
class Slidable extends StatefulWidget {
  /// Creates a [Slidable].
  ///
  /// The  [closeOnScroll], [dragStartBehavior],
  ///and [child] arguments must not be null.
  const Slidable({
    Key? key,
    this.groupTag,
    this.closeOnScroll = true,
    this.startActionPane,
    this.endActionPane,
    this.dragStartBehavior = DragStartBehavior.down,
    required this.child,
  }) : super(key: key);

  /// Whether this slidable is interactive.
  ///
  /// If false, the child will not slid to show actions.
  ///
  /// Defaults to true.

  /// Specifies to close this [Slidable] after the closest [Scrollable]'s
  /// position changed.
  ///
  /// Defaults to true.
  final bool closeOnScroll;

  /// {@template slidable.groupTag}
  /// The tag shared by all the [Slidable]s of the same group.
  ///
  /// This is used by [SlidableAutoCloseBehavior] to keep only one [Slidable]
  /// of the same group, open.
  /// {@endtemplate}
  final Object? groupTag;

  /// A widget which is shown when the user drags the [Slidable] to the right or
  final ActionPane? startActionPane;

  /// A widget which is shown when the user drags the [Slidable] to the left or
  final ActionPane? endActionPane;

  /// Determines the way that drag start behavior is handled.
  ///
  /// If set to [DragStartBehavior.start], the drag gesture used to dismiss a
  /// dismissible will begin upon the detection of a drag gesture. If set to
  /// [DragStartBehavior.down] it will begin when a down event is first detected.
  ///
  /// In general, setting this to [DragStartBehavior.start] will make drag
  /// animation smoother and setting it to [DragStartBehavior.down] will make
  /// drag behavior feel slightly more reactive.
  ///
  /// By default, the drag start behavior is [DragStartBehavior.start].
  ///
  /// See also:
  ///
  ///  * [DragGestureRecognizer.dragStartBehavior], which gives an example for the different behaviors.
  final DragStartBehavior dragStartBehavior;

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.ProxyWidget.child}
  final Widget child;

  @override
  _SlidableState createState() => _SlidableState();

  /// The closest instance of the [SlidableController] which controls this
  /// [Slidable] that encloses the given context.
  ///
  /// {@tool snippet}
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// SlidableController controller = Slidable.of(context);
  /// ```
  /// {@end-tool}
  static SlidableController? of(BuildContext context) {
    final scope = context
        .getElementForInheritedWidgetOfExactType<_SlidableControllerScope>()
        ?.widget as _SlidableControllerScope?;
    return scope?.controller;
  }
}

class _SlidableState extends State<Slidable>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late final SlidableController controller;
  late Animation<Offset> moveAnimation;
  late bool keepPanesOrder;

  @override
  bool get wantKeepAlive => !widget.closeOnScroll;

  @override
  void initState() {
    super.initState();
    controller = SlidableController(this)
      ..actionPaneType.addListener(handleActionPanelTypeChanged);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // updateIsLeftToRight();
    updateController();
    updateMoveAnimation();
  }

  @override
  void didUpdateWidget(covariant Slidable oldWidget) {
    super.didUpdateWidget(oldWidget);
    // updateIsLeftToRight();
    updateController();
  }

  @override
  void dispose() {
    controller.actionPaneType.removeListener(handleActionPanelTypeChanged);
    controller.dispose();
    super.dispose();
  }

  void updateController() {
    controller
      ..enableStartActionPane = startActionPane != null
      ..startActionPaneExtentRatio = startActionPane?.extentRatio ?? 0;

    controller
      ..enableEndActionPane = endActionPane != null
      ..endActionPaneExtentRatio = endActionPane?.extentRatio ?? 0;
  }

  void handleActionPanelTypeChanged() {
    setState(() {
      updateMoveAnimation();
    });
  }

  void handleDismissing() {
    if (controller.resizeRequest.value != null) {
      setState(() {});
    }
  }

  void updateMoveAnimation() {
    final double end = controller.direction.value.toDouble();
    moveAnimation = controller.animation.drive(
      Tween<Offset>(begin: Offset.zero, end: Offset(end, 0)),
    );
  }

  Widget? get actionPane {
    switch (controller.actionPaneType.value) {
      case ActionPaneType.start:
        return startActionPane;
      case ActionPaneType.end:
        return endActionPane;
      default:
        return null;
    }
  }

  ActionPane? get startActionPane => widget.startActionPane;
  ActionPane? get endActionPane => widget.endActionPane;

  Alignment get actionPaneAlignment {
    final sign = controller.direction.value.toDouble();
    return Alignment(-sign, 0);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // See AutomaticKeepAliveClientMixin.

    Widget content = SlideTransition(
      position: moveAnimation,
      child: SlidableAutoCloseBehaviorInteractor(
        groupTag: widget.groupTag,
        controller: controller,
        child: widget.child,
      ),
    );

    content = Stack(
      children: <Widget>[
        if (actionPane != null)
          Positioned.fill(
            child: ClipRect(
              clipper: _SlidableClipper(
                axis: Axis.horizontal,
                controller: controller,
              ),
              child: actionPane,
            ),
          ),
        content,
      ],
    );

    return SlidableGestureDetector(
      enabled: true,
      controller: controller,
      dragStartBehavior: widget.dragStartBehavior,
      child: SlidableNotificationSender(
        tag: widget.groupTag,
        controller: controller,
        child: SlidableScrollingBehavior(
          controller: controller,
          closeOnScroll: widget.closeOnScroll,
          child: SlidableDismissal(
            axis: flipAxis(Axis.horizontal),
            controller: controller,
            child: ActionPaneConfiguration(
              alignment: actionPaneAlignment,
              direction: Axis.horizontal,
              isStartActionPane:
                  controller.actionPaneType.value == ActionPaneType.start,
              child: _SlidableControllerScope(
                controller: controller,
                child: content,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SlidableControllerScope extends InheritedWidget {
  const _SlidableControllerScope({
    Key? key,
    required this.controller,
    required Widget child,
  }) : super(key: key, child: child);

  final SlidableController? controller;

  @override
  bool updateShouldNotify(_SlidableControllerScope old) {
    return controller != old.controller;
  }
}

class _SlidableClipper extends CustomClipper<Rect> {
  _SlidableClipper({
    required this.axis,
    required this.controller,
  }) : super(reclip: controller.animation);

  final Axis axis;
  final SlidableController controller;

  @override
  Rect getClip(Size size) {
    final double offset = controller.ratio * size.width;
    if (offset < 0) {
      return Rect.fromLTRB(size.width + offset, 0, size.width, size.height);
    }
    return Rect.fromLTRB(0, 0, offset, size.height);
  }

  @override
  Rect getApproximateClipRect(Size size) => getClip(size);

  @override
  bool shouldReclip(_SlidableClipper oldClipper) {
    return oldClipper.axis != axis;
  }
}
