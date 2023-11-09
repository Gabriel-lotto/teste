// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  late final _$noteListAtom =
      Atom(name: 'HomeStoreBase.noteList', context: context);

  @override
  ObservableList<String> get noteList {
    _$noteListAtom.reportRead();
    return super.noteList;
  }

  @override
  set noteList(ObservableList<String> value) {
    _$noteListAtom.reportWrite(value, super.noteList, () {
      super.noteList = value;
    });
  }

  late final _$noteErrorAtom =
      Atom(name: 'HomeStoreBase.noteError', context: context);

  @override
  String? get noteError {
    _$noteErrorAtom.reportRead();
    return super.noteError;
  }

  @override
  set noteError(String? value) {
    _$noteErrorAtom.reportWrite(value, super.noteError, () {
      super.noteError = value;
    });
  }

  late final _$addNoteAsyncAction =
      AsyncAction('HomeStoreBase.addNote', context: context);

  @override
  Future<void> addNote(String note) {
    return _$addNoteAsyncAction.run(() => super.addNote(note));
  }

  late final _$deleteNoteAsyncAction =
      AsyncAction('HomeStoreBase.deleteNote', context: context);

  @override
  Future<void> deleteNote(int index) {
    return _$deleteNoteAsyncAction.run(() => super.deleteNote(index));
  }

  late final _$editNoteAsyncAction =
      AsyncAction('HomeStoreBase.editNote', context: context);

  @override
  Future<void> editNote(String newNote, int index) {
    return _$editNoteAsyncAction.run(() => super.editNote(newNote, index));
  }

  @override
  String toString() {
    return '''
noteList: ${noteList},
noteError: ${noteError}
    ''';
  }
}
