import 'package:flutter/material.dart';
import 'package:flutterproj/theme_model.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeModel(),
      child: Consumer(
        builder: (context, ThemeModel themeNotifier, child) {
          return MaterialApp(
            title: 'Contacts',
            theme: themeNotifier.isDark ? ThemeData.dark() : ThemeData.light(),
            home:
             Consumer(
              builder: (context, ThemeModel themeNotifier, child) {
              return Scaffold(
                  appBar: AppBar(
                    title: const Text('Contacts'),
                    actions:
                    [
                        IconButton(
                            onPressed: () {
                              themeNotifier.isDark
                                  ? themeNotifier.isDark = false
                                  : themeNotifier.isDark = true;
                            },
                            icon: Icon(
                              themeNotifier.isDark
                                  ? Icons.wb_sunny : Icons.nightlight_round))
                    ],
                  ),
                  body: const Center(
                      child: ContactList()
                  ),
                );
    }
            )
          );

        }
    )
    );
  }
}
class Contact {
  String first_name;
  String last_name;
  String address;

  Contact({required this.first_name, required this.last_name, required this.address});
}

List<Contact> contacts = [
  Contact(first_name: "Aiden", last_name: "Roberts",address: "23 Secondary Ln, 60604"),
  Contact(first_name: "Ainsley" ,last_name: "Preston" ,address: "21 Primary St, 60604"),
  Contact(first_name: "Andrew",last_name: "Friedrich" ,address: "34 Main St, 60604" ),
  Contact(first_name: "Barry" ,last_name:"Walton",address: "1334 Strategy Rd, 60604" ),
  Contact(first_name: "Benny",last_name: "Walton" ,address:"1334 Strategy Rd, 60604" ),
  Contact(first_name: "Cade" ,last_name:"Barron" ,address: "77 Wind Rd, 60604" ),
  Contact(first_name: "Caroline",last_name: "Dyer" ,address:"2 Hollowbrook Ln, 60604" ),
  Contact(first_name: "Colby",last_name:"Matthews" ,address:"66 Wind Rd, 60604" ),
  Contact(first_name: "Colby",last_name:"Richardson" ,address:"66 Wind Rd, 60604" )

];
class ContactList extends StatefulWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  var realindex = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contacts.length+3,
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, index) {
        if(index==0) {
          realindex=0;
          return ListTile(leading: Text('A'), textColor: Colors.grey);
        }
        if(index==4)
        {
            realindex=3;
            return ListTile(leading: Text('B'), textColor: Colors.grey);
        }
        if(index==7)
        {
            realindex=5;
            return ListTile(leading: Text('C'), textColor: Colors.grey);
        }
        realindex++;
        return ListTile(
          leading: Icon(Icons.contacts),
          trailing: Text(contacts[realindex-1].address),
          minVerticalPadding: 25,
          title: Text(
            contacts[realindex-1].first_name+" "+contacts[realindex-1].last_name
          ),
        );
      },
    );
  }
}
