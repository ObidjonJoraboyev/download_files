import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dowload_files/bloc/file_manager_bloc.dart';
import 'package:dowload_files/data/models/file_data_model.dart';
import 'package:open_filex/open_filex.dart';

import 'data/repositories/file_repository.dart';

class FileManagerScreen extends StatefulWidget {
  const FileManagerScreen({super.key, required this.categoryFile});

  final CategoryFile categoryFile;

  @override
  State<FileManagerScreen> createState() => _FileManagerScreenState();
}

class _FileManagerScreenState extends State<FileManagerScreen> {
  FocusNode focus = FocusNode();

  String text = "";

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<FileDataModel> category = widget.categoryFile != CategoryFile.all
        ? context
            .read<FileRepository>()
            .files
            .where((element) => element.category == widget.categoryFile)
            .toList()
        : context.read<FileRepository>().files;
    List<FileDataModel> users = category
        .where((element) =>
            element.fileName.toLowerCase().contains(text.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("${widget.categoryFile.name} Books"),
      ),
      body: ListView(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 14,
                      left: 12,
                      bottom: 8,
                      right: focus.hasFocus ? 0 : 12),
                  child: CupertinoTextField(
                    controller: controller,
                    onChanged: (v) {
                      text = v;
                      setState(() {});
                    },
                    prefix: Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: Icon(
                        Icons.search,
                        color: Colors.black.withOpacity(.4),
                      ),
                    ),
                    onTap: () {
                      focus.requestFocus();
                      setState(() {});
                    },
                    cursorColor: Colors.blue,
                    focusNode: focus,
                    clearButtonMode: OverlayVisibilityMode.editing,
                    placeholder: " Search",
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey.withOpacity(.35)),
                  ),
                ),
              ),
              focus.hasFocus
                  ? CupertinoTextSelectionToolbarButton(
                      child: const Text(
                        "Cancel",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: () {
                        text = "";
                        controller.text = "";
                        setState(() {});
                        focus.unfocus();
                      },
                    )
                  : const SizedBox(),
            ],
          ),
          if (users.isNotEmpty)
            ...List.generate(
              users.length,
              (index) {
                FileManagerBloc fileManagerBloc = FileManagerBloc();

                return BlocProvider.value(
                  value: fileManagerBloc,
                  child: BlocBuilder<FileManagerBloc, FileManagerState>(
                    builder: (context, state) {
                      debugPrint("CURRENT MB: ${state.progress}");
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          children: [
                            ListTile(
                              leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.network(
                                    users[index].iconPath,
                                    width: 60,
                                    height: 60,
                                    fit: BoxFit.cover,
                                  )),
                              title: Text(users[index].fileName),
                              subtitle: Text(
                                users[index].fileUrl,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              trailing: IconButton(
                                onPressed: () async {
                                  if (state.newFileLocation.isEmpty) {
                                    fileManagerBloc.add(
                                      DownloadFileEvent(
                                        fileDataModel: users[index],
                                      ),
                                    );
                                  } else {
                                    await OpenFilex.open(state.newFileLocation);
                                  }
                                },
                                icon: Icon(
                                  state.newFileLocation.isEmpty
                                      ? Icons.download
                                      : Icons.check,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            Visibility(
                              visible: state.progress != 0,
                              child: LinearProgressIndicator(
                                value: state.progress,
                                backgroundColor: Colors.grey,
                              ),
                            ),
                            Visibility(
                                visible: state.progress == 0,
                                child: Container(
                                  width: double.infinity,
                                  height: 1,
                                  color: Colors.grey,
                                )),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            )
          else if (users.isEmpty)
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 3 - 30,
                  ),
                  Icon(
                    Icons.search,
                    size: 62,
                    color: Colors.black.withOpacity(.6),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      "No result for \"$text\"",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                  ),
                  Text(
                    "Check the spelling on try a new speech.",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: Colors.black.withOpacity(.35),
                    ),
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
