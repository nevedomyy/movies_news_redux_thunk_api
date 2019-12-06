import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux/redux.dart';
import '../store/state.dart';
import '../model/movie_list.dart';
import '../model/movie_detail.dart';
import '../actions/actions.dart';
import 'api_provider_detail.dart';
import 'api_provider_list.dart';


ThunkAction<AppState> getListUpcoming() {
  ApiProviderList provider = ApiProviderList();
  return (Store<AppState> store) async {
    store.dispatch(ListLoading());
    MovieList movieList = await provider.getListUpcoming();
    store.dispatch(GetListUpcoming(movieList));
  };
}

ThunkAction<AppState> getListPlaying() {
  ApiProviderList provider = ApiProviderList();
  return (Store<AppState> store) async {
    store.dispatch(ListLoading());
    MovieList movieList = await provider.getListPlaying();
    store.dispatch(GetListPlaying(movieList));
  };
}

ThunkAction<AppState> getMovieDetail(int movieID) {
  ApiProviderDetail provider = ApiProviderDetail(movieID);
  return (Store<AppState> store) async {
    store.dispatch(MovieDetailLoading());
    MovieDetail movieDetail = await provider.getMovieDetail();
    store.dispatch(GetMovieDetail(movieDetail));
  };
}