import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Deleteuserclient extends StatefulWidget {
  Deleteuserclient({super.key});

  @override
  State<Deleteuserclient> createState() => _DeleteuserclientState();
}

class _DeleteuserclientState extends State<Deleteuserclient> {
  @override
  void initState() {
    getClientstream();
    searchword.addListener(_onSearchChange);
    super.initState();
  }

  _onSearchChange() {
    print('nnnnnnnnnnnnnnnn');
    searchResultlist();
  }

  TextEditingController searchword = TextEditingController();
  List Allresult = [];
  List Resultlist = [];
  List<String> emailblock = [''];
  getClientstream() async {
    var data = await FirebaseFirestore.instance
        .collection('user')
        .orderBy('name')
        .get();
    setState(() {
      Allresult = data.docs;
    });
    searchResultlist();
  }

  searchResultlist() {
    var showResult = [];
    if (searchword.text != '') {
      for (var userSnapShot in Allresult) {
        var name = userSnapShot['name'].toString().toLowerCase();
        if (name.contains(searchword.text.toLowerCase())) {
          showResult.add(userSnapShot);
        }
      }
    } else {
      showResult = List.from(Allresult);
    }
    setState(() {
      Resultlist = showResult;
    });
  }

  @override
  void dispose() {
    searchword.removeListener(_onSearchChange);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    getClientstream();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: CupertinoSearchTextField(
          controller: searchword,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, Index) {
          return ListTile(
            leading:    Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image:  DecorationImage(
                        image: AssetImage(
                         Resultlist[Index]['image'],
                        ),
                      ),
                    ),
                  ),
            title: Text(
              Resultlist[Index]['name'],
              style: TextStyle(color: Colors.black),
            ),
            subtitle: Text(Resultlist[Index]['bio'],
                style: TextStyle(color: Colors.black)),
            trailing: IconButton(
              onPressed: () {
                FirebaseFirestore.instance
                    .collection("user")
                    .doc(Resultlist[Index]['uid'])
                    .delete()
                    .then((_) {
                  print('done');
                });

                Navigator.pop(context);
              },
              icon: Icon(
                Icons.delete_outline,
                color: Colors.black,
              ),
            ),
          );
        },
        itemCount: Resultlist.length,
      ),
    );
  }
}
