import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/services/firestore_service.dart';
import 'package:intl/intl.dart';

class FeedbackPage extends StatefulWidget {
  FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  TextEditingController messageController = TextEditingController();

  var feedbacks;

  @override
  void initState() {
    super.initState();
    feedbacks = FirestoreService().getFeedback();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedbacks'),
      ),
      body: RefreshIndicator(
        onRefresh: () async{
          setState(() {
            feedbacks = FirestoreService().getFeedback();
          });
        },
        child: FutureBuilder(
            future: feedbacks,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.separated(
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      Timestamp date = snapshot.data[index]['create_at'];
                      var formatDate = DateFormat("dd/MM/yyyy").format(date.toDate());
                      return ListTile(
                        leading: CircleAvatar(),
                        title: Text(snapshot.data[index]['user'].toString()),
                        subtitle: Text(snapshot.data[index]['message'].toString()),
                        trailing: Text(formatDate),
                      );
                    });
              }
            }),
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: messageController,
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
                  await FirestoreService().postFeedback(messageController.text);
                },
                child: Icon(Icons.send)),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 3),
            height: 50,
            child: ElevatedButton(onPressed: () {}, child: Icon(Icons.mic)),
          )
        ],
      ),
    );
  }
}
