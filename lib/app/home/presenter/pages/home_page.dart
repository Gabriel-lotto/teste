import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prova/app/shared/utils/debug_log_improvement.dart';
import 'package:prova/app/shared/utils/modal_bottom_sheet.dart';
import 'package:prova/app/shared/utils/responsiveness.dart';
import 'package:prova/app/shared/widgets/body_widget.dart';
import 'package:prova/app/shared/widgets/text_field_widget.dart';

import '../stores/home_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _store = Modular.get<HomeStore>();
  final _focusNode = FocusNode();
  bool isEditingNote = false;
  int indexList = 0;

  @override
  void initState() {
    Future.microtask(() => _store.getNotes());
    super.initState();
  }

  void _onEditNote(int index) {
    isEditingNote = true;
    indexList = index;
    _store.noteController.text = _store.noteList[index];
    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    devLog(isEditingNote);
    return Observer(
      builder: (context) {
        return BodyWidget(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 350.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: _store.noteList.isNotEmpty
                      ? ListView.builder(
                          itemCount: _store.noteList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: _NoteWidget(
                                note: _store.noteList[index],
                                onEditTap: () => _onEditNote(index),
                                onDeleteTap: () {
                                  ModalBottomSheets.showGenericBottomSheet(
                                    title: "Deseja Excluir essa nota?",
                                    leftButtonText: "Cancelar",
                                    rightButtonText: "Sim",
                                    leftButtonTap: () => Navigator.of(context).pop(),
                                    rightButtonTap: () => _store.deleteNote(index).then((_) {
                                      isEditingNote = false;
                                      Navigator.of(context).pop();
                                      _store.noteController.clear();
                                    }),
                                  );
                                },
                              ),
                            );
                          },
                        )
                      : const Center(
                          child: Text(
                            "Nenhuma nota cadastrada",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                ),
                SizedBox(height: 30.h),
                CustomTextFieldWidget(
                  autofocus: true,
                  errorText: _store.noteError,
                  hintText: "Digite seu texto".padLeft(39),
                  controller: _store.noteController,
                  focusNode: _focusNode,
                  onFieldSubmitted: (value) {
                    _focusNode.requestFocus();
                    if (_store.validateField(value) == null) {
                      !isEditingNote
                          ? _store.addNote(value).then((_) => _store.noteController.clear())
                          : _store.editNote(value, indexList).then(
                              (_) {
                                isEditingNote = false;
                                _store.noteController.clear();
                              },
                            );
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _NoteWidget extends StatelessWidget {
  final String note;
  final void Function()? onEditTap;
  final void Function()? onDeleteTap;

  const _NoteWidget({
    required this.note,
    required this.onEditTap,
    required this.onDeleteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                note,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            IconButton(
              onPressed: onEditTap,
              icon: const Icon(
                Icons.edit,
                color: Colors.black,
              ),
            ),
            IconButton(
              onPressed: onDeleteTap,
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ],
        ),
        const Divider(height: 1, color: Colors.grey)
      ],
    );
  }
}
