import 'package:flutter/material.dart';
import 'package:flutter_application_5/services/firestore_service.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedbacks'),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        itemCount: 24, 
        itemBuilder:(context, index) {
        return ListTile(
          leading: CircleAvatar(),
          title: Text("Rowena"),
          subtitle: Text("Lorem, Lorem, Lorem, Lorem, Lorem"),
          trailing: Text("10/10"),
        );
      },),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 4,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 3),
            height: 50,
            child: ElevatedButton(
              onPressed: () async {
                await FirestoreService().postFeedBack();
              },
             child: Icon(Icons.send)
             ),
          ),
          SizedBox(width: 10,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 3),
            height: 50,
            child: ElevatedButton(onPressed: () {}, 
            child: Icon(Icons.mic)
            ),
          )
        ],
      ),
    );
  }
}
