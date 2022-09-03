import 'package:flutter/material.dart';
import 'package:flutterproj/AppTheme.dart';
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
            theme: themeNotifier.isDark ?  AppTheme.darkTheme : AppTheme.lightTheme,
            home:
             Consumer(
              builder: (context, ThemeModel themeNotifier, child) {
              return Scaffold(
                  appBar: AppBar(
                    title: const Text('Contacts'),
                    actions:
                    [
                      // Button to change theme
                        IconButton(
                            onPressed: () {
                              //checks if isDark is true, if it is, changes to false and vice versa
                              themeNotifier.isDark
                                  ? themeNotifier.isDark = false
                                  : themeNotifier.isDark = true;
                            },
                            //sets icon and changes based on isDark
                            icon: Icon(
                              themeNotifier.isDark
                                  ? Icons.wb_sunny : Icons.nightlight_round))
                    ],
                  ),
                  body: const Center(
                      //ContactList is displayed here
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
  //Contact class and constructor
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
  var lastChar = contacts[0].first_name[0];
  var numLets = 1;

        @override
        Widget build(BuildContext context ) {
          // calculates number of starting letters for first names to determine
              // number of headers for itemcount
              for(int i =0;i<contacts.length-1;i++)
                {
                    if(contacts[i+1].first_name[0]!=contacts[i].first_name[0])
                      {
                        numLets++;
                      }
                }
              return ListView.builder(
                  //itemCount accounts for dividers and number of unique letters
                  // and prevents going past range.
                  //
                  itemCount: contacts.length*2+numLets,
                  padding: const EdgeInsets.all(16.0),
                  itemBuilder: (context, index) {
                      if(realindex<contacts.length-1) {
                        if(index == 0)
                        {
                          return ListTile(
                              leading: Text(lastChar,
                                  style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16
                                   )
                                  )
                                );
                        }
                        if (contacts[realindex + 1].first_name[0] != lastChar) {
                          lastChar = contacts[realindex + 1].first_name[0];
                          return ListTile(
                              leading: Text(lastChar,
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 16
                                            )
                                        ),
                              );
                        }
                        if (index.isOdd) return const Divider(color: Colors.grey);
                        realindex = (index ~/ 2) - 1;


                        return ListTile(

                          //To match design,
                          // Account circle foreground color needs to change.
                          // Imperfect solution: use CircleAvatar as a background color
                          leading: Icon( Icons.account_circle, size: 25),
                          trailing: Text(contacts[realindex].address,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            )
                          ),
                          minVerticalPadding: 10,
                          title: Text(
                              contacts[realindex].first_name + " " +
                                  contacts[realindex].last_name
                          ),
                        );
                      }
                      else{
                        return Divider();
                      }
                  },
                );
        }
}
