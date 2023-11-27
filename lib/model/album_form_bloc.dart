/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 album_form_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:eliud_core_helpers/etc/enums.dart';

import 'package:eliud_pkg_medium_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_medium_model/model/model_export.dart';

import 'package:eliud_pkg_medium_model/model/album_form_event.dart';
import 'package:eliud_pkg_medium_model/model/album_form_state.dart';

class AlbumFormBloc extends Bloc<AlbumFormEvent, AlbumFormState> {
  final FormAction? formAction;
  final String? appId;

  AlbumFormBloc(this.appId, {this.formAction})
      : super(AlbumFormUninitialized()) {
    on<InitialiseNewAlbumFormEvent>((event, emit) {
      AlbumFormLoaded loaded = AlbumFormLoaded(
          value: AlbumModel(
        documentID: "",
        appId: "",
        albumEntries: [],
        description: "",
      ));
      emit(loaded);
    });

    on<InitialiseAlbumFormEvent>((event, emit) async {
      // Need to re-retrieve the document from the repository so that I get all associated types
      AlbumFormLoaded loaded = AlbumFormLoaded(
          value: await albumRepository(appId: appId)!
              .get(event.value!.documentID));
      emit(loaded);
    });
    on<InitialiseAlbumFormNoLoadEvent>((event, emit) async {
      AlbumFormLoaded loaded = AlbumFormLoaded(value: event.value);
      emit(loaded);
    });
    AlbumModel? newValue;
    on<ChangedAlbumDocumentID>((event, emit) async {
      if (state is AlbumFormInitialized) {
        final currentState = state as AlbumFormInitialized;
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.addAction) {
          emit(await _isDocumentIDValid(event.value, newValue!));
        } else {
          emit(SubmittableAlbumForm(value: newValue));
        }
      }
    });
    on<ChangedAlbumAppId>((event, emit) async {
      if (state is AlbumFormInitialized) {
        final currentState = state as AlbumFormInitialized;
        newValue = currentState.value!.copyWith(appId: event.value);
        emit(SubmittableAlbumForm(value: newValue));
      }
    });
    on<ChangedAlbumAlbumEntries>((event, emit) async {
      if (state is AlbumFormInitialized) {
        final currentState = state as AlbumFormInitialized;
        newValue = currentState.value!.copyWith(albumEntries: event.value);
        emit(SubmittableAlbumForm(value: newValue));
      }
    });
    on<ChangedAlbumDescription>((event, emit) async {
      if (state is AlbumFormInitialized) {
        final currentState = state as AlbumFormInitialized;
        newValue = currentState.value!.copyWith(description: event.value);
        emit(SubmittableAlbumForm(value: newValue));
      }
    });
    on<ChangedAlbumBackgroundImage>((event, emit) async {
      if (state is AlbumFormInitialized) {
        final currentState = state as AlbumFormInitialized;
        newValue = currentState.value!.copyWith(backgroundImage: event.value);
        emit(SubmittableAlbumForm(value: newValue));
      }
    });
    on<ChangedAlbumConditions>((event, emit) async {
      if (state is AlbumFormInitialized) {
        final currentState = state as AlbumFormInitialized;
        newValue = currentState.value!.copyWith(conditions: event.value);
        emit(SubmittableAlbumForm(value: newValue));
      }
    });
  }

  DocumentIDAlbumFormError error(String message, AlbumModel newValue) =>
      DocumentIDAlbumFormError(message: message, value: newValue);

  Future<AlbumFormState> _isDocumentIDValid(
      String? value, AlbumModel newValue) async {
    if (value == null) {
      return Future.value(error("Provide value for documentID", newValue));
    }
    if (value.isEmpty) {
      return Future.value(error("Provide value for documentID", newValue));
    }
    Future<AlbumModel?> findDocument =
        albumRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableAlbumForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }
}
