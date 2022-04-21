import 'dart:convert';
import 'dart:developer';
import 'package:convert/convert.dart';
// import 'package:dart_des/dart_des.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop_sample/widget/PaginatedDataTableView.dart';
import 'package:fluttercrypto/des/des.dart';

void main() {
  runApp(const MyApp());
  initData();
}

void initData() {
  String key = "000001504700056610017282";

  // if (kDebugMode) {
  //   print('Triple DES mode: ${key.codeUnits.toString()}');
  // }
  // DES3 desECB = DES3(
  //     // key: utf8.encode(key),
  //     key: key.codeUnits,
  //     // key: key,
  //     mode: DESMode.ECB,
  //     iv: DES.IV_ZEROS,
  //     paddingType: DESPaddingType.PKCS7);

  const data = "r,15888888888,1514773413174788099,second";
  // const data2 =
  //     "qOWRU4Gq/Qep2ARkkADJqYTLYwGyZg1tSvM3UR73EsQuT0pRRsLgkZhBFBi1Fq5R";

  List<int> bytes = utf8.encode(data);
  // bytes = [bytes[0], 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0];

// List<int> encrypted = desECB.encrypt(data.codeUnits);
  // List<int> encrypted = desECB.encrypt(data.codeUnits);
  // List<int> encrypted = desECB.encrypt(bytes);
  // List<int> res = desECB.decrypt(bytes);

// Uint8List data=convert.

  // var decryptBase64 = await FlutterDes.decryptFromBase64(data, key);

  List<int> desECB = DES().encrypWithEcb(data.codeUnits, key.codeUnits);

  if (kDebugMode) {
    // print('Triple DES mode: ${encrypted.toString()}');
    print('加密: ${base64Encode(desECB)}');
    // print('解密: ${utf8.decode(desECB)}');
    // print('解密: ${utf8.encode(desECB)}');
    // print('decrypted (utf8): ${utf8.decode(decrypted)}');
    print('---------------------------');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // 这个Widget是应用程序的开始。
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // 这是您的应用程序的主题。
        //
        //  尝试使用“flutter run”运行您的应用程序。 你会看到
        //  应用程序有一个蓝色的工具栏。 然后，在不退出应用程序的情况下，尝试
        //  将下面的 primarySwatch 更改为 Colors.green 然后调用
        //  “hot reload”（在运行“flutter run”的控制台中按“r”，
        //  或者只是将您的更改保存到 Flutter IDE 中的“热重载”）。
        //  请注意，计数器没有重置为零； 应用程序
        //  没有重新启动。
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Flutter Demo1 Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // 这个 widget 是应用程序的主页. 它是有状态的, 这意味着它有一个 State 对象（定义如下），其中包含影响其外观的字段。

  // 此类是状态的配置。 它保存由父级（在本例中为 App 小部件）提供并由 State 的 build 方法使用的值（在本例中为标题）。 Widget 子类中的字段始终标记为“final”。

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // 这个 setState 调用告诉 Flutter 框架这个 State 发生了一些变化，这导致它重新运行下面的 build 方法，以便显示可以反映更新的值。
      // 如果我们在不调用 setState() 的情况下更改了 _counter，那么 build 方法将不会再次被调用，因此似乎什么也不会发生。
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 每次调用 setState 时都会重新运行此方法，例如上面的 _incrementCounter 方法。
    //
    // Flutter 框架已经过优化，可以快速重新运行构建方法，这样您就可以重建任何需要更新的东西，而不必单独更改小部件的实例。
    return Scaffold(
      appBar: AppBar(
        // 在这里，我们从 App.build 方法创建的 MyHomePage 对象中获取值，并使用它来设置我们的应用栏标题。
        title: Text(widget.title),
      ),
      body: Center(
        // Center 是一个布局小部件。 它需要一个child并将其放置在父母的中间。
        child: Column(
          // Column 也是一个布局小部件。 它需要一个子列表并将它们垂直排列。 默认情况下，它会调整自己的大小以使其水平适合其子级，并尝试与其父级一样高。
          //
          // 调用“调试绘画”（在控制台中按“p”，选择Android Studio 中 Flutter Inspector 中的“Toggle Debug Paint”操作，
          // 或 Visual Studio Code 中的“Toggle Debug Paint”命令）查看每个小部件的线框。
          //
          // Column 具有各种属性来控制它如何调整自身大小以及如何定位其子项。
          //这里我们使用 mainAxisAlignment 使children垂直居中；
          // 这里的主轴是垂直轴，因为列是垂直的（横轴是水平的）。
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            PaginatedDataTableD(),
            // const Text(
            //   'You have pushed the button this many times:',
            // ),
            // Text(
            //   '$_counter',
            //   style: Theme.of(context).textTheme.headline4,
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // 这个尾随逗号使构建方法的自动格式化更好。
    );
  }
}
