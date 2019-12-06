import '../store/state.dart';
import '../actions/actions.dart';


AppState reducer(AppState currentState, dynamic action){
  if(action is GetListUpcoming) return AppState(action.movieList, currentState.movieDetail, false);
  if(action is GetListPlaying) return AppState(action.movieList, currentState.movieDetail, true);
  if(action is GetMovieDetail) return AppState(currentState.movieList, action.movieDetail, currentState.firstBtn);
  return currentState;
}