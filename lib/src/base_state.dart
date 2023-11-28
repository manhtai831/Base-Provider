import 'package:base_provider/src/enum/lifecycle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'base_function.dart';
import 'base_provider.dart';
import 'enum/status.dart';

abstract class BaseState<T extends StatefulWidget, VM extends BaseProvider> extends State<T> {
  VM? _viewModel;

  VM get viewModel => _viewModel!;

  VM get init => context.read<VM>();

  TickerProvider? get vsync => null;

  @override
  void initState() {
    _viewModel = init;

    _viewModel?.setMounted(false);

    _viewModel?.setFlagLifecycle(Lifecycle.initState);

    _viewModel?.setTickerProvider(vsync);

    _viewModel?.setStatus(Status.loading);

    _viewModel?.setBuildContext(context);

    _viewModel?.setMounted(mounted);

    _viewModel?.setRouteSetting2();

    _viewModel?.init();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      showLogState('$VM was installed ${DateTime.now()}');

      _viewModel?.setFlagLifecycle(Lifecycle.addPostFrameCallback);

      _viewModel?.setMounted(mounted);

      await _viewModel?.onViewCreated();

      _viewModel?.setFlagLifecycle(Lifecycle.build);
    });

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _viewModel?.setFlagLifecycle(Lifecycle.didChangeDependencies);
  }

  @override
  void deactivate() {
    _viewModel?.setFlagLifecycle(Lifecycle.deactivate);
    _viewModel?.onDeActive();
    super.deactivate();
  }

  @override
  void dispose() {
    _viewModel?.setMounted(mounted);
    _viewModel?.setFlagLifecycle(Lifecycle.dispose);
    _viewModel?.onDispose();
    _viewModel = null;

    showLogState('$VM - ${widget.runtimeType} was closed');
    super.dispose();
  }
}
