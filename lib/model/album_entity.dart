/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 album_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core_helpers/base/entity_base.dart';
import 'package:eliud_core_main/model/entity_export.dart';
import 'package:eliud_pkg_medium_model/model/entity_export.dart';

class AlbumEntity implements EntityBase {
  final String? appId;
  final List<AlbumEntryEntity>? albumEntries;
  final String? description;
  final BackgroundEntity? backgroundImage;
  final StorageConditionsEntity? conditions;

  AlbumEntity({
    required this.appId,
    this.albumEntries,
    this.description,
    this.backgroundImage,
    this.conditions,
  });

  AlbumEntity copyWith({
    String? documentID,
    String? appId,
    List<AlbumEntryEntity>? albumEntries,
    String? description,
    BackgroundEntity? backgroundImage,
    StorageConditionsEntity? conditions,
  }) {
    return AlbumEntity(
      appId: appId ?? this.appId,
      albumEntries: albumEntries ?? this.albumEntries,
      description: description ?? this.description,
      backgroundImage: backgroundImage ?? this.backgroundImage,
      conditions: conditions ?? this.conditions,
    );
  }

  List<Object?> get props => [
        appId,
        albumEntries,
        description,
        backgroundImage,
        conditions,
      ];

  @override
  String toString() {
    String albumEntriesCsv =
        (albumEntries == null) ? '' : albumEntries!.join(', ');

    return 'AlbumEntity{appId: $appId, albumEntries: AlbumEntry[] { $albumEntriesCsv }, description: $description, backgroundImage: $backgroundImage, conditions: $conditions}';
  }

  static AlbumEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var albumEntriesFromMap = map['albumEntries'];
    List<AlbumEntryEntity> albumEntriesList;
    if (albumEntriesFromMap != null) {
      albumEntriesList = (map['albumEntries'] as List<dynamic>)
          .map((dynamic item) => AlbumEntryEntity.fromMap(item as Map,
              newDocumentIds: newDocumentIds)!)
          .toList();
    } else {
      albumEntriesList = [];
    }
    var backgroundImageFromMap = map['backgroundImage'];
    if (backgroundImageFromMap != null) {
      backgroundImageFromMap = BackgroundEntity.fromMap(backgroundImageFromMap,
          newDocumentIds: newDocumentIds);
    }
    var conditionsFromMap = map['conditions'];
    if (conditionsFromMap != null) {
      conditionsFromMap = StorageConditionsEntity.fromMap(conditionsFromMap,
          newDocumentIds: newDocumentIds);
    }

    return AlbumEntity(
      appId: map['appId'],
      albumEntries: albumEntriesList,
      description: map['description'],
      backgroundImage: backgroundImageFromMap,
      conditions: conditionsFromMap,
    );
  }

  @override
  Map<String, Object?> toDocument() {
    final List<Map<String?, dynamic>>? albumEntriesListMap =
        albumEntries != null
            ? albumEntries!.map((item) => item.toDocument()).toList()
            : null;
    final Map<String, dynamic>? backgroundImageMap =
        backgroundImage != null ? backgroundImage!.toDocument() : null;
    final Map<String, dynamic>? conditionsMap =
        conditions != null ? conditions!.toDocument() : null;

    Map<String, Object?> theDocument = HashMap();
    if (appId != null) {
      theDocument["appId"] = appId;
    } else {
      theDocument["appId"] = null;
    }
    if (albumEntries != null) {
      theDocument["albumEntries"] = albumEntriesListMap;
    } else {
      theDocument["albumEntries"] = null;
    }
    if (description != null) {
      theDocument["description"] = description;
    } else {
      theDocument["description"] = null;
    }
    if (backgroundImage != null) {
      theDocument["backgroundImage"] = backgroundImageMap;
    } else {
      theDocument["backgroundImage"] = null;
    }
    if (conditions != null) {
      theDocument["conditions"] = conditionsMap;
    } else {
      theDocument["conditions"] = null;
    }
    return theDocument;
  }

  @override
  AlbumEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith(appId: newAppId);
    return newEntity;
  }

  static AlbumEntity? fromJsonString(String json,
      {Map<String, String>? newDocumentIds}) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap, newDocumentIds: newDocumentIds);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

  @override
  Future<Map<String, Object?>> enrichedDocument(
      Map<String, Object?> theDocument) async {
    return theDocument;
  }
}
