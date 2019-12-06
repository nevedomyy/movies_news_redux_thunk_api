import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../model/movie_list.dart';
import '../middleware/thunk_actions.dart';
import '../store/state.dart';
import '../store/store.dart';
import 'list_item.dart';
import 'cover.dart';
import 'const.dart';
import 'button.dart';
import 'behavior.dart';


class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  initState() {
    super.initState();
    store.dispatch(getListPlaying());
  }

  @override
  Widget build(BuildContext context) {
    return Cover(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Новинки Кино',
              style: appTextStyle[0]
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: StoreConnector<AppState, bool>(
              converter: (store) => store.state.firstBtn,
              builder: (context, firstBtn){
                return Row(
                  children: <Widget>[
                    StoreConnector<AppState, Function()>(
                      converter: (store) => () => store.dispatch(getListPlaying()),
                      builder: (context, playing){
                        return Btn(
                          onTap: () => playing(),
                          caption: 'В КИНО',
                          firstBtn: firstBtn,
                        );
                      },
                    ),
                    SizedBox(width: 16),
                    StoreConnector<AppState, Function()>(
                      converter: (store) => () => store.dispatch(getListUpcoming()),
                      builder: (context, upcoming){
                        return Btn(
                          onTap: () => upcoming(),
                          caption: 'ОЖИДАЕМЫЕ',
                          firstBtn: !firstBtn,
                        );
                      },
                    ),
                  ],
                );
              }
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: StoreConnector<AppState, MovieList>(
              converter: (store) => store.state.movieList,
              builder: (context, movieList){
                if(movieList.error!=null) return Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      movieList.error,
                      style: appTextStyle[4],
                    ),
                ));
                if(movieList.list!=null && !movieList.isLoading) return ScrollConfiguration(
                  behavior: Behavior(),
                  child: ListView.builder(
                    itemCount: movieList.list.length,
                    itemBuilder: (context, index){
                      return ListItem(movieList.list[index]);
                    },
                  ),
                );
                return Center(
                    child: CircularProgressIndicator()
                );
              },
            )
          )
        ],
      )
    );
  }
}