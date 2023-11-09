import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:prova/app/shared/services/shared_preference_service/shared_preference_service.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  HomeStoreBase(this._sharedPreference);

  //***************************** Final variables *****************************//

  final SharedPreferenceService _sharedPreference;

  final TextEditingController noteController = TextEditingController();

  //******************************* Observables *******************************//

  @observable
  ObservableList<String> noteList = ObservableList<String>();

  //***************************** Common variables *****************************//

  @observable
  String? noteError;

  //********************************* Getters *********************************//

  //*************************** Computed properties ***************************//

  //********************************* Actions *********************************//

  @action
  Future<void> addNote(String note) async {
    await _sharedPreference.add(note).then((_) => getNotes());
  }

  @action
  Future<void> deleteNote(int index) async {
    await _sharedPreference.delete(index).then((_) => getNotes());
  }

  @action
  Future<void> editNote(String newNote, int index) async {
    await _sharedPreference.edit(newNote, index).then((_) => getNotes());
  }

  //******************************** Functions ********************************//

  Future<void> getNotes() async {
    await _sharedPreference.getAll().then((value) => noteList = value.asObservable());
  }

  String? validateField(String? value) {
    noteError = null;
    if (value == null || value.isEmpty) {
      return noteError = 'Campo vazio';
    }
    return null;
  }
}
