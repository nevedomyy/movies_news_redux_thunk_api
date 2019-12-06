import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../store/state.dart';
import '../store/store.dart';
import 'menu_page.dart';
import 'const.dart';


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        theme: ThemeData(
          accentColor: appColor[4],
        ),
        home: MenuPage(),
      ),
    );
  }
}
