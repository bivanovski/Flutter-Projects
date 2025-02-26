import 'package:flutter/cupertino.dart';

class LifeCycleManager extends StatefulWidget {

  final Widget child;

  const LifeCycleManager({Key? key, required this.child}) : super(key: key);

  @override
  State<LifeCycleManager> createState() => _LifeCycleManagerState();
}

class _LifeCycleManagerState extends State<LifeCycleManager> with WidgetsBindingObserver{

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    debugPrint('LifeCycleManager: initState');
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    debugPrint('LifeCycleManager: dispose');
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    debugPrint('AppLifecycleState: $state');
  }
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
