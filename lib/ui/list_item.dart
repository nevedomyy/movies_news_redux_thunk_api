import 'package:flutter/cupertino.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter/material.dart';
import '../middleware/thunk_actions.dart';
import '../store/store.dart';
import '../model/movies.dart';
import 'detail_page.dart';
import 'const.dart';


class ListItem extends StatelessWidget{
  static final _imgPath = 'https://image.tmdb.org/t/p/w500';
  final Movies _movies;

  ListItem(this._movies);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: appColor[2].withOpacity(0.4),
          borderRadius: BorderRadius.circular(25.0),
        ),
        width: double.infinity,
        height: 200.0,
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 140.0,
              child: ClipRRect(
                borderRadius: BorderRadius.only(topRight: Radius.circular(25.0), topLeft: Radius.circular(25.0), bottomLeft: Radius.circular(25.0)),
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: _imgPath + _movies.posterPath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, left: 6.0, right: 10.0),
                    child: Text(
                      _movies.title ?? '',
                      style: appTextStyle[2],
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        _movies.overview ?? '',
                        style: appTextStyle[4],
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Center(
                          child: Text(
                            _movies.voteAverage.toString() ?? '',
                            style: appTextStyle[3],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          store.dispatch(getMovieDetail(_movies.id));
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => DetailPage(_movies.id)
                          ));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: appColor[3].withOpacity(0.4),
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(25.0), bottomRight: Radius.circular(25.0))
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 20.0),
                            child: Icon(Icons.arrow_forward_ios, color: Colors.white.withOpacity(0.5), size: 14.0),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}