import 'package:flutter/material.dart';
import 'package:pattern_provider/services/log_service.dart';
import 'package:pattern_provider/view_model/edit_page_view.dart';
import 'package:provider/provider.dart';
import '../models/post_model.dart';
import '../services/http_service.dart';
import '../views/itemOfTextField.dart';

//ignore: must_be_immutable
class EditPage extends StatefulWidget {
  static String id ="EditPage";
  Post? post;
   EditPage({Key? key, required this.post}) : super(key: key);

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
EditViewModel editViewModel = EditViewModel();


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    editViewModel.editPagePost(widget.post!);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Post"),
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){
              editViewModel.apiEditData(context);
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: ChangeNotifierProvider<EditViewModel>(
        create: (context) => editViewModel,
        child: Consumer<EditViewModel>(
          builder: (ctx, model, index) => Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                texformField(hintext: "Title", controller: editViewModel.titleController),
                texformField(hintext: "Body", controller: editViewModel.bodyController),
              ],
            ),
          ),
        )
      ),
    );

  }
}
