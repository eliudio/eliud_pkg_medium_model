/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 album_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:collection/collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core_helpers/base/model_base.dart';

import 'package:eliud_core_main/model/model_export.dart';
import 'package:eliud_pkg_medium_model/model/model_export.dart';
import 'package:eliud_pkg_medium_model/model/entity_export.dart';

import 'package:eliud_pkg_medium_model/model/album_entity.dart';

class AlbumModel implements ModelBase, WithAppId {
  static const String packageName = 'eliud_pkg_medium_model';
  static const String id = 'albums';

  @override
  String documentID;

  // This is the identifier of the app to which this feed belongs
  @override
  String appId;
  List<AlbumEntryModel>? albumEntries;
  String? description;
  BackgroundModel? backgroundImage;
  StorageConditionsModel? conditions;

  AlbumModel({
    required this.documentID,
    required this.appId,
    this.albumEntries,
    this.description,
    this.backgroundImage,
    this.conditions,
  });

  @override
  AlbumModel copyWith({
    String? documentID,
    String? appId,
    List<AlbumEntryModel>? albumEntries,
    String? description,
    BackgroundModel? backgroundImage,
    StorageConditionsModel? conditions,
  }) {
    return AlbumModel(
      documentID: documentID ?? this.documentID,
      appId: appId ?? this.appId,
      albumEntries: albumEntries ?? this.albumEntries,
      description: description ?? this.description,
      backgroundImage: backgroundImage ?? this.backgroundImage,
      conditions: conditions ?? this.conditions,
    );
  }

  @override
  int get hashCode =>
      documentID.hashCode ^
      appId.hashCode ^
      albumEntries.hashCode ^
      description.hashCode ^
      backgroundImage.hashCode ^
      conditions.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlbumModel &&
          runtimeType == other.runtimeType &&
          documentID == other.documentID &&
          appId == other.appId &&
          ListEquality().equals(albumEntries, other.albumEntries) &&
          description == other.description &&
          backgroundImage == other.backgroundImage &&
          conditions == other.conditions;

  @override
  String toString() {
    String albumEntriesCsv =
        (albumEntries == null) ? '' : albumEntries!.join(', ');

    return 'AlbumModel{documentID: $documentID, appId: $appId, albumEntries: AlbumEntry[] { $albumEntriesCsv }, description: $description, backgroundImage: $backgroundImage, conditions: $conditions}';
  }

  @override
  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    if (albumEntries != null) {
      for (var item in albumEntries!) {
        referencesCollector.addAll(await item.collectReferences(appId: appId));
      }
    }
    if (backgroundImage != null) {
      referencesCollector
          .addAll(await backgroundImage!.collectReferences(appId: appId));
    }
    if (conditions != null) {
      referencesCollector
          .addAll(await conditions!.collectReferences(appId: appId));
    }
    return referencesCollector;
  }

  @override
  AlbumEntity toEntity({String? appId}) {
    return AlbumEntity(
      appId: appId,
      albumEntries: (albumEntries != null)
          ? albumEntries!.map((item) => item.toEntity(appId: appId)).toList()
          : null,
      description: (description != null) ? description : null,
      backgroundImage: (backgroundImage != null)
          ? backgroundImage!.toEntity(appId: appId)
          : null,
      conditions:
          (conditions != null) ? conditions!.toEntity(appId: appId) : null,
    );
  }

  static Future<AlbumModel?> fromEntity(
      String documentID, AlbumEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return AlbumModel(
      documentID: documentID,
      appId: entity.appId ?? '',
      albumEntries: entity.albumEntries == null
          ? null
          : List<AlbumEntryModel>.from(
              await Future.wait(entity.albumEntries!.map((item) {
              counter++;
              return AlbumEntryModel.fromEntity(counter.toString(), item);
            }).toList())),
      description: entity.description,
      backgroundImage: await BackgroundModel.fromEntity(entity.backgroundImage),
      conditions: await StorageConditionsModel.fromEntity(entity.conditions),
    );
  }

  static Future<AlbumModel?> fromEntityPlus(
      String documentID, AlbumEntity? entity,
      {String? appId}) async {
    if (entity == null) return null;

    var counter = 0;
    return AlbumModel(
      documentID: documentID,
      appId: entity.appId ?? '',
      albumEntries: entity.albumEntries == null
          ? null
          : List<AlbumEntryModel>.from(
              await Future.wait(entity.albumEntries!.map((item) {
              counter++;
              return AlbumEntryModel.fromEntityPlus(counter.toString(), item,
                  appId: appId);
            }).toList())),
      description: entity.description,
      backgroundImage: await BackgroundModel.fromEntityPlus(
          entity.backgroundImage,
          appId: appId),
      conditions: await StorageConditionsModel.fromEntityPlus(entity.conditions,
          appId: appId),
    );
  }
}
