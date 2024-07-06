import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FilesRecord extends FirestoreRecord {
  FilesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "owner_ref" field.
  DocumentReference? _ownerRef;
  DocumentReference? get ownerRef => _ownerRef;
  bool hasOwnerRef() => _ownerRef != null;

  // "read_access" field.
  List<DocumentReference>? _readAccess;
  List<DocumentReference> get readAccess => _readAccess ?? const [];
  bool hasReadAccess() => _readAccess != null;

  // "write_access" field.
  List<DocumentReference>? _writeAccess;
  List<DocumentReference> get writeAccess => _writeAccess ?? const [];
  bool hasWriteAccess() => _writeAccess != null;

  // "file_url" field.
  String? _fileUrl;
  String get fileUrl => _fileUrl ?? '';
  bool hasFileUrl() => _fileUrl != null;

  // "is_deleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  bool hasIsDeleted() => _isDeleted != null;

  void _initializeFields() {
    _ownerRef = snapshotData['owner_ref'] as DocumentReference?;
    _readAccess = getDataList(snapshotData['read_access']);
    _writeAccess = getDataList(snapshotData['write_access']);
    _fileUrl = snapshotData['file_url'] as String?;
    _isDeleted = snapshotData['is_deleted'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('files');

  static Stream<FilesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FilesRecord.fromSnapshot(s));

  static Future<FilesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FilesRecord.fromSnapshot(s));

  static FilesRecord fromSnapshot(DocumentSnapshot snapshot) => FilesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FilesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FilesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FilesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FilesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFilesRecordData({
  DocumentReference? ownerRef,
  String? fileUrl,
  bool? isDeleted,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'owner_ref': ownerRef,
      'file_url': fileUrl,
      'is_deleted': isDeleted,
    }.withoutNulls,
  );

  return firestoreData;
}

class FilesRecordDocumentEquality implements Equality<FilesRecord> {
  const FilesRecordDocumentEquality();

  @override
  bool equals(FilesRecord? e1, FilesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.ownerRef == e2?.ownerRef &&
        listEquality.equals(e1?.readAccess, e2?.readAccess) &&
        listEquality.equals(e1?.writeAccess, e2?.writeAccess) &&
        e1?.fileUrl == e2?.fileUrl &&
        e1?.isDeleted == e2?.isDeleted;
  }

  @override
  int hash(FilesRecord? e) => const ListEquality().hash(
      [e?.ownerRef, e?.readAccess, e?.writeAccess, e?.fileUrl, e?.isDeleted]);

  @override
  bool isValidKey(Object? o) => o is FilesRecord;
}
