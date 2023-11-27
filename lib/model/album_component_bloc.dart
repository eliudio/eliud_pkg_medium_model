/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 album_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_medium_model/model/album_component_event.dart';
import 'package:eliud_pkg_medium_model/model/album_component_state.dart';
import 'package:eliud_pkg_medium_model/model/album_repository.dart';

class AlbumComponentBloc
    extends Bloc<AlbumComponentEvent, AlbumComponentState> {
  final AlbumRepository? albumRepository;
  StreamSubscription? _albumSubscription;

  void _mapLoadAlbumComponentUpdateToState(String documentId) {
    _albumSubscription?.cancel();
    _albumSubscription = albumRepository!.listenTo(documentId, (value) {
      if (value != null) {
        add(AlbumComponentUpdated(value: value));
      }
    });
  }

  /*
   * Construct AlbumComponentBloc
   */
  AlbumComponentBloc({this.albumRepository})
      : super(AlbumComponentUninitialized()) {
    on<FetchAlbumComponent>((event, emit) {
      _mapLoadAlbumComponentUpdateToState(event.id!);
    });
    on<AlbumComponentUpdated>((event, emit) {
      emit(AlbumComponentLoaded(value: event.value));
    });
  }

  /*
   * Close the AlbumComponentBloc
   */
  @override
  Future<void> close() {
    _albumSubscription?.cancel();
    return super.close();
  }
}
