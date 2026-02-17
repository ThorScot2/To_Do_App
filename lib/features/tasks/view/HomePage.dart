import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/Settings/App_Colors.dart';

import '../viewmodel/prov.dart';
import 'Customized_Widgets/BottomSheet_AddNewToDo.dart';
import 'Customized_Widgets/Task_Card.dart';

class Homepage extends StatefulWidget {

  const Homepage({super.key});


  @override
  State<Homepage> createState() => _HomePageState();

}

class _HomePageState extends State<Homepage>{
  bool sortDescending = true; // true = High to Low ---- false = Low to High
  bool hideCompleted = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bodyColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.floatingBtnColor,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: AppColors.bottomSheetBacgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
            ),
            builder: (context) {
              return BottomsheetAddnewtodo();
            },
          );
        },
        child: Text(
          "+",
          style: TextStyle(
            color: AppColors.fontColor,
            fontSize: 36,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.appBarColor,
        actions: [
          PopupMenuButton(
            menuPadding: EdgeInsets.all(15),
            style: ButtonStyle(alignment: Alignment.centerLeft),
            iconColor: Colors.white,
            color: AppColors.toDoCardColor,
            itemBuilder: (context) => [
              PopupMenuItem(
                  child: Text(
                    "Edit",
                    style: TextStyle(color: AppColors.fontColor),
                  )
              ),
              PopupMenuItem(
                onTap: (){
                  setState(() {
                    hideCompleted = !hideCompleted;
                  });
                },
                  child: Text(
                    "Hide completed",
                    style: TextStyle(color: AppColors.fontColor),
                  )
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "To-dos",
                        style: TextStyle(
                            color: AppColors.fontColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 36),
                      ),
                      SizedBox(height: 5),

                      //tasks count

                      Consumer<TaskProvider>(
                        builder: (context, taskProvider, child) {
                          return Text(
                            "${taskProvider.tasks.length} to-dos",
                            style: TextStyle(color: Colors.grey),
                          );
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Sort",style: TextStyle(color: Colors.white,fontSize: 20),),
                      IconButton(
                          onPressed: (){
                            //tasks sorting
                            setState(() {
                              sortDescending = !sortDescending;
                            });
                          },
                          icon: Icon(
                            Icons.sort_by_alpha,
                            color: Colors.white,
                            size: 40,
                          )
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 10),

              // unfinished
              Consumer<TaskProvider>(
                builder: (context, taskProvider, child) {
                  final pendingTasks = taskProvider.tasks.where((t) => !t.isDone).toList()
                    ..sort((a, b) => sortDescending
                        ? b.priority.compareTo(a.priority) // High to Low
                        : a.priority.compareTo(b.priority) // Low to High
                    );

                  if (pendingTasks.isEmpty) {//check if empty
                    return Center(
                        child: Text(
                          "No pending tasks",
                          style: TextStyle(color: Colors.grey),
                        ));
                  }

                  return ListView.builder(//get data and show
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: pendingTasks.length,
                    itemBuilder: (context, index) {
                      final task = pendingTasks[index];
                      return TaskCard(
                        title: task.title,
                        priority: task.priority,
                        deadline: task.deadline,
                        isDone: task.isDone,
                        onToggleDone: () {
                          Provider.of<TaskProvider>(context, listen: false)
                              .toggleTaskDone(task);
                        },
                      );
                    },
                  );
                },
              ),

              //finished
              Consumer<TaskProvider>(
                builder: (context, taskProvider, child) {
                  final completedTasks = taskProvider.tasks.where((t) => t.isDone && !hideCompleted).toList()
                    ..sort((a, b) => sortDescending
                        ? b.priority.compareTo(a.priority) // High to Low
                        : a.priority.compareTo(b.priority) // Low to High
                    );


                  if (completedTasks.isEmpty) return SizedBox();//check if empty

                  return Padding(//get data and show
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Column(
                      spacing: 5,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Completed (${completedTasks.length})",
                          style: TextStyle(color: Colors.grey),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: completedTasks.length,
                          itemBuilder: (context, index) {
                            final task = completedTasks[index];
                            return TaskCard(
                              title: task.title,
                              priority: task.priority,
                              deadline: task.deadline,
                              isDone: task.isDone,
                              onToggleDone: () {
                                Provider.of<TaskProvider>(context, listen: false).toggleTaskDone(task);
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
