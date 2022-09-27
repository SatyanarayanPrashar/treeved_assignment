import 'package:flutter/widgets.dart';
import 'slidable.dart';

/// An [ActionPane] motion which reveals actions as if they were behind the
/// [Slidable].
///
class BehindMotion extends StatelessWidget {
  const BehindMotion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final paneData = ActionPane.of(context)!;
    return Flex(
      direction: paneData.direction,
      children: paneData.children,
    );
  }
}
