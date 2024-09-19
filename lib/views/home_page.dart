import 'package:flutter/material.dart';
import 'package:flutter_application_5/data/users_data.dart';
import 'package:flutter_application_5/services/get_users.dart';
import 'package:flutter_application_5/views/detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 213, 243, 255),
        appBar: AppBar(
          title: Text('HomePage'),
        ),
        body: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  12,
                  (index) {
                    return Container(
                      margin: EdgeInsets.all(8),
                      child: CircleAvatar(radius: 45),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: users.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.85),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => DetailPage(
                      //       user: users[index],
                      //     ),
                      //   ),
                      // );
                      getUsers();
                    },
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundImage:
                                NetworkImage(users[index]['image']),
                          ),
                          Text(
                            users[index]['firstName'],
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(users[index]['company']['title']),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ));
  }
}
