import 'dart:io';
import 'package:design/src/domain/model/disciplina.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class DialogAdicionarConteudo extends StatefulWidget {
  final List<Disciplina> disciplinas;

  const DialogAdicionarConteudo({Key key, this.disciplinas}) : super(key: key);

  @override
  _DialogAdicionarConteudoState createState() =>
      _DialogAdicionarConteudoState();
}

class _DialogAdicionarConteudoState extends State<DialogAdicionarConteudo> {
  Disciplina _novoValor;
  final _conteudo = TextEditingController();
  final _keyForm = GlobalKey<FormState>();

  File _image;
  String _path;
  String _fileName;
  bool _autoValidade = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildTextFormFieldConteudo(),
        _buildInserirImagem(),
        _buildInserirPDF(),
        _buildDropdownDisciplinas(),
      ],
    );
  }

  /// Responsável por informar se um pdf foi inserido ou não.
  /// Responsável também, por abrir a storage para selecionar um pdf.

  Widget _buildInserirPDF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 16.0),
        Text(
          "Insira um PDF",
          style: Theme.of(context).textTheme.title,
        ),
        IconButton(
          icon: Icon(
            Icons.picture_as_pdf,
            color: _path == null ? Colors.red : Colors.lightBlue,
          ),
          onPressed: () {
            _openFileExplorer();
          },
        ),
        Text(
          _path == null ? 'Nenhum PDF selecionado' : _path,
          maxLines: 1,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.body2,
        ),
      ],
    );
  }

  /// Responsável por informar se uma imagem foi inserida ou não.
  /// Responsável também, por abrir a storage para selecionar uma imagem.
  Widget _buildInserirImagem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 16.0),
        Text(
          "Insira uma imagem",
          style: Theme.of(context).textTheme.title,
        ),
        IconButton(
          icon: Icon(
            Icons.image,
            color: _image == null ? Colors.red : Colors.lightBlue,
          ),
          onPressed: () {
            _pickImage(ImageSource.gallery);
          },
        ),
        _image == null
            ? Text(
                "Nenhuma imagem selecionada",
                style: Theme.of(context).textTheme.body2,
              )
            : Image.file(_image)
      ],
    );
  }

  /// Responsável por criar o dropdown de disciplinas
  Widget _buildDropdownDisciplinas() {
    return DropdownButton(
      value: _novoValor,
      hint: const Text(
        "Selecione uma Disciplina",
      ),
      onChanged: (Disciplina disciplina) {
        setState(() {
          _novoValor = disciplina;
        });
      },
      items: widget.disciplinas
          .map((value) => DropdownMenuItem(
                child: Text(
                  "${value.nome}",
                  style: TextStyle(fontSize: 14.0),
                ),
                value: value,
              ))
          .toList(),
      isExpanded: false,
    );
  }

  /// Responsável por criar o titulo "Selecione uma disciplina"
  Widget _buildTitleSelecionarDisciplina() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const Text(
            "Selecione uma disciplina",
            style: const TextStyle(color: Colors.black, fontSize: 14.0),
          )
        ],
      ),
    );
  }

  /// Responsável por criar o textFormField "Conteudo"
  Widget _buildTextFormFieldConteudo() {
    return TextFormField(
      controller: _conteudo,
      validator: _validarConteudo,
      decoration: InputDecoration(
        labelText: 'Escreva o Conteúdo',
        labelStyle: TextStyle(
          color: Colors.grey.shade500,
        ),
      ),
      maxLines: 1,
    );
  }

  /// Reponsável por validar o campo "conteudo"
  String _validarConteudo(String conteudo) {
    if (conteudo.isEmpty) {
      return 'Informe um Conteúdo';
    }
    return null;
  }

  /// faz a validação do form de cadastro de conteudo de aula
  /// se for válido, ele deixa passar, se não informa um erro
  void _enviarForm() {
    if (_keyForm.currentState.validate() &&
        _novoValor != null &&
        _image != null &&
        _fileName != null) {
      _keyForm.currentState.save();

      Navigator.pop(context);
      _displayDialogConfirmar(context);
    } else {
      setState(() {
        _autoValidade = true;
      });
    }
  }

  /// Responsável por montar o layout do dialog para informar ao usuário que
  /// o cadastro do conteudo foi realizado
  void _displayDialogConfirmar(BuildContext context) async {
    return showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                shape: const RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                ),
                title: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      const Text(
                        "Conteúdo adicionado",
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Ok"),
                  )
                ],
              ),
            ),
          );
        },
        transitionDuration: Duration(milliseconds: 400),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {});
  }

  /// Responsável por abrir o "file explorer" para o usuário ter acesso
  /// aos seus arquivos
  Future<void> _openFileExplorer() async {
    if (await checkAndRequestStoragePermissions()) {
      try {
        _path = await FilePicker.getFilePath(fileExtension: 'pdf');
      } catch (e) {
        print(e.toString());
      }
      setState(() {
        _fileName = _path != null ? _path.split('/').last : '...';
        print(_path);
      });
    }
  }

  /// Responsável por abrir a galeria do usuário
  Future<void> _pickImage(ImageSource source) async {
    if (await checkAndRequestStoragePermissions()) {
      File select = await ImagePicker.pickImage(
          source: source, maxHeight: 30, maxWidth: 60);

      setState(() {
        _image = select;
      });
    }
  }

  /// Responsável por checar e requisitar as permissoes para ter
  /// acesso a galeria / arquivos
  Future<bool> checkAndRequestStoragePermissions() async {
    PermissionStatus permission = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.storage);
    if (permission != PermissionStatus.granted) {
      Map<PermissionGroup, PermissionStatus> permissions =
          await PermissionHandler()
              .requestPermissions([PermissionGroup.storage]);
      return permissions[PermissionGroup.storage] == PermissionStatus.granted;
    } else {
      return true;
    }
  }
}
