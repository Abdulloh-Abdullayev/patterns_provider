import 'package:flutter/material.dart';
import 'package:pattern_provider/view_model/create_view_page.dart';
import 'package:provider/provider.dart';
import '../views/itemOfTextField.dart';


class CreatePage extends StatefulWidget {
  static String id = "CreatePage";
  const CreatePage({Key? key}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  CreateViewModel createViewModel = CreateViewModel();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Post"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: (){
              createViewModel.apiCreatePost(context);
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: ChangeNotifierProvider<CreateViewModel>(
        create: (context) => createViewModel,
        child: Consumer(
          builder: (ctx,model,index) => itemOfTextField(),
        )
      ),
    );

  }

  Container itemOfTextField() {
    return Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              texformField(hintext: 'Title', controller: createViewModel.titleController),
              texformField(hintext: 'Body', controller: createViewModel.bodyController),
            ],
          ),
        );
  }
}
