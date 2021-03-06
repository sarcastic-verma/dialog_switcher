# DialogSwitcher For Flutter
[![pub package](https://img.shields.io/pub/v/dialog_switcher.svg)](https://pub.dev/packages/dialog_switcher)
[![likes](https://badges.bar/dialog_switcher/likes)](https://pub.dev/packages/dialog_switcher/score)
[![popularity](https://badges.bar/dialog_switcher/popularity)](https://pub.dev/packages/dialog_switcher/score)
[![pub points](https://badges.bar/dialog_switcher/pub%20points)](https://pub.dev/packages/dialog_switcher/score)

*Allows user to switch widgets gracefully within a dialog with Animation.*

## Sample

<img src="https://user-images.githubusercontent.com/50954641/116223856-98194980-a76d-11eb-9929-57b9d1258248.gif" width="320" />

## Usage

To use this plugin, add [`dialog_switcher`](https://pub.dev/packages/dialog_switcher) as a dependency in your pubspec.yaml file.

```yaml
  dependencies:
    flutter:
      sdk: flutter
    dialog_switcher:
```

Sample Usage
```dart
import 'package:flutter/material.dart';
import 'package:transition_switcher/dialog_switcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DialogSwitcher',
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sample Usage",
                  style: TextStyle(fontSize: 20),
                ),
                DialogSwitcher(
                  dialogBackgroundColor: Colors.transparent,
                  dialogElevation: 0,
                  frontChild: Container(
                    width: 300,
                    height: 300,
                    color: Colors.amber,
                  ),
                  backChild: Container(
                    width: 300,
                    height: 300,
                    color: Colors.pinkAccent,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```

And a lot more.... 
There is a lot of customization available which is self explantory.
If you ever face a problem, feel free to create an issue.

See the [`example`](https://github.com/sarcastic-verma/dialog_switcher/blob/master/example) directory for a complete sample app.

### Created & Maintained By `Shivam Verma`

* GitHub: [@sarcastic-verma](https://github.com/sarcastic-verma)

