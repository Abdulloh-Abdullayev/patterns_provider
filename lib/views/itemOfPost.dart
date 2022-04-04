import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pattern_provider/view_model/home_page_view.dart';
import '../models/post_model.dart';

 Widget itemOfPost(Post post,HomeViewModel viewModel) {


  return Slidable(
    startActionPane: ActionPane(
      motion: const ScrollMotion(),
      children: [
        SlidableAction(
          onPressed: (BuildContext context) {
            viewModel.goToEditPage(post,context);
          },
          backgroundColor: const Color(0xFFFE6D49),
          foregroundColor: Colors.white,
          icon: Icons.edit,
          label: 'Edit',
        ),
      ],
    ),
    endActionPane:  ActionPane(
      motion: const ScrollMotion(),
      children: [
        SlidableAction(
          backgroundColor: const Color(0xFFFE4A49),
          foregroundColor: Colors.white,
          icon: Icons.delete,
          label: 'Delete',
          onPressed: (BuildContext context) {
            viewModel.apiPostDelete(post);
          },
        ),
      ],
    ),
    child: Container(
      padding:const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post.title.toUpperCase(),
            style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(post.body),
        ],
      ),
    ),
  );
}