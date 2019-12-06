import 'package:flutter_redux/flutter_redux.dart';
import 'package:movies_news/ui/const.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter/material.dart';
import '../model/movie_detail.dart';
import '../store/state.dart';
import 'behavior.dart';
import 'cover.dart';


class DetailPage extends StatefulWidget {
  final int _id;
  DetailPage(this._id);
  @override
  _DetailPage createState() => _DetailPage(_id);
}

class _DetailPage extends State<DetailPage> {
  static final _imgPath = 'https://image.tmdb.org/t/p/w500';
  final int _id;

  _DetailPage(this._id);

  @override
  Widget build(BuildContext context) {
    return Cover(
        child: StoreConnector<AppState, MovieDetail>(
            converter: (store) => store.state.movieDetail,
            builder: (context, movieDetail){
              if(movieDetail.error!=null) return Center(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    movieDetail.error,
                    style: appTextStyle[4],
                  ),
                ));
              if(movieDetail.movie!=null && !movieDetail.isLoading) return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: appColor[2].withOpacity(0.4),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 200.0,
                            width: double.infinity,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(topRight: Radius.circular(25.0), topLeft: Radius.circular(25.0), bottomRight: Radius.circular(25.0)),
                              child: FadeInImage.memoryNetwork(
                                placeholder: kTransparentImage,
                                image: _imgPath + movieDetail.movie.backdropPath,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: appColor[3].withOpacity(0.4),
                                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25.0))
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 20.0),
                                    child: Icon(Icons.arrow_back_ios, color: Colors.white.withOpacity(0.5), size: 14.0),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10.0, right: 10, bottom: 5.0),
                                  child: Text(
                                    movieDetail.movie.title ?? '',
                                    style: appTextStyle[3],
                                    maxLines: 1,
                                    softWrap: false,
                                    overflow: TextOverflow.fade,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ScrollConfiguration(
                      behavior: Behavior(),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.only(left: 16.0, right: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              RichText(
                                text: TextSpan(
                                  text: 'Рейтинг: ',
                                  style: appTextStyle[2],
                                  children: <TextSpan>[
                                    TextSpan(text: movieDetail.movie.voteAverage.toString()+' (${movieDetail.movie.voteCount.toString()})', style: appTextStyle[4]),
                                  ],
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: 'Бюджет: ',
                                  style: appTextStyle[2],
                                  children: <TextSpan>[
                                    TextSpan(text: movieDetail.movie.budget.toString()+' \$', style: appTextStyle[4]),
                                  ],
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: 'Сборы: ',
                                  style: appTextStyle[2],
                                  children: <TextSpan>[
                                    TextSpan(text: movieDetail.movie.revenue.toString()+' \$', style: appTextStyle[4]),
                                  ],
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: 'Релиз: ',
                                  style: appTextStyle[2],
                                  children: <TextSpan>[
                                    TextSpan(text: movieDetail.movie.releaseDate ?? '-', style: appTextStyle[4]),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                movieDetail.movie.overview ?? '',
                                style: appTextStyle[4],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              );
              return Center(
                  child: CircularProgressIndicator()
              );
            }
        )
    );
  }
}