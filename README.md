<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

This package depend on `provider`. Package provide base state managerment of one project. Providers such as controller of view, at here you can put all logic of page, navigation, control show/hide dialog.
## Features

✅ Provide Statemanagement

✅ Get argument before context mounted

✅ Simple extension navigation, check null

## Getting started

Run this command:

With Dart:
```bash
dart pub add ok
```

This will add a line like this to your package's pubspec.yaml (and run an implicit dart pub get):

```dart
dependencies:
  base_provider: ^0.0.1
```

Alternatively, your editor might support dart pub get. Check the docs for your editor to learn more.
Import it

Now in your Dart code, you can use:

```dart
import 'package:base_provider/base_provider.dart';
```

## Usage

In parent page

```dart
import 'package:base_provider/base_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HomeVM> {
  @override
  HomeVM get init => HomeVM();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: viewModel,
        child: SizeBox()
    );
  }
}
```
With provider
```dart
import 'package:base_provider/base_provider.dart';

class HomeArgs {

}

class HomeProvider extends BaseViewModel {
    HomeArgs? arguments;    
  @override
  Future<void> init() async {
    arguments = getArguments()
  }

  @override
  Future<void> initialData() async {
    context.pushNamed(RoutePath.detail, argument: HomeArgs())
  }

  @override
  Future<void> fetchData() async {
    if(arguments.hasEmpty){
        return;
    }
  }

}
```

## Additional information


