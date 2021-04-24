# DialogSwitcher For Flutter
[![pub package](https://img.shields.io/pub/v/dialog_switcher.svg)](https://pub.dev/packages/dialog_switcher)
[![likes](https://badges.bar/dialog_switcher/likes)](https://pub.dev/packages/dialog_switcher/score)
[![popularity](https://badges.bar/dialog_switcher/popularity)](https://pub.dev/packages/dialog_switcher/score)
[![pub points](https://badges.bar/dialog_switcher/pub%20points)](https://pub.dev/packages/dialog_switcher/score)

*Allows user to switch widgets gracefully within a dialog with Animation.*

### Screenshots
<img src="https://user-images.githubusercontent.com/56810766/115352432-fc1f9900-a1d4-11eb-8c3a-79b2baa46104.png" height=600/>&nbsp;&nbsp;<img src="https://user-images.githubusercontent.com/56810766/114513858-46929a00-9c58-11eb-9e17-99b3df0a5e92.png" height=600/>&nbsp;&nbsp;<img src="https://user-images.githubusercontent.com/56810766/114513863-46929a00-9c58-11eb-9870-f75a3c6963b1.png" height=600/>

## Usage

To use this plugin, add [`dialog_switcher`](https://pub.dev/packages/dialog_switcher) as a dependency in your pubspec.yaml file.

```yaml
  dependencies:
    flutter:
      sdk: flutter
    dialog_switcher:
```

First and foremost, import the widget.
```dart
import 'package:dialog_switcher/dialog_switcher.dart';
```

You can now add an [`DialogSwitcher`](https://github.com/rithik-dev/dialog_switcher/blob/master/lib/dialog_switcher.dart) widget to your widget tree and pass the child as the only required parameter to get started.
This widget will create a route between the source and the destination LatLng's provided.
```dart
DialogSwitcher(
    child: Text("Hello World"),
),
```

If an onTap, onLongPress etc. parameters are provided, it can be used as a button.
```dart
DialogSwitcher(
    child: Text("Hello World"),
    onTap: () => print("Hello World"),
),
```

Want to add some `padding`/`margin`/`borderRadius`?

Padding from all sides can be added by passing `padding` as a double.
If you want to customize padding, then use `customPadding` which expects `EdgeInsets` allowing for customization.

If `customPadding` is passed, `padding` is ignored.

Same applies for margin and borderRadius.
```dart
DialogSwitcher(
    child: Text("Hello World"),
    onTap: () => print("Hello World"),
    
    /// Shorthand for EdgeInsets.all(20)
    padding: 20,

    /// if customPadding passed, padding is ignored.
    /// Hence padding applied to container is 10 from all sides.

    customPadding: EdgeInsets.all(10),
),
```

The default `alignment` is center.
So the container tries to take as much space as possible.
To deny the same, you can set the `alignment` to null or specify height/width.
```dart
DialogSwitcher(
    child: Text("Hello World"),
    onTap: () => print("Hello World"),

    /// child not longer takes all the available space
    alignment: null,
),
```

To enable a border, `showBorder` must be true. Defaults to false.

If `showBorder` is true, parameters like borderColor, borderWidth, borderStyle come into play.
```dart
DialogSwitcher(
    child: Text("Hello World"),
    onTap: () => print("Hello World"),
    showBorder: true,
    borderWidth: 5,
    borderColor: Colors.red,
),
```

Sample Usage
```dart
import 'package:dialog_switcher/dialog_switcher.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: DialogSwitcher(
              height: 150,
              child: Text(
                "Hello World ...",
                style: TextStyle(fontSize: 25),
              ),
              padding: 20,
              elevation: 10,
              onTap: () => print("Container Tapped"),
              margin: 20,
              borderRadius: 20,
              color: Colors.orange,
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
You can the read the full documentation [`here`](https://github.com/rithik-dev/dialog_switcher/blob/master/lib/dialog_switcher.dart).

See the [`example`](https://github.com/rithik-dev/dialog_switcher/blob/master/example) directory for a complete sample app.

### Created & Maintained By `Rithik Bhandari`

* GitHub: [@rithik-dev](https://github.com/rithik-dev)
* LinkedIn: [@rithik-bhandari](https://www.linkedin.com/in/rithik-bhandari/)

