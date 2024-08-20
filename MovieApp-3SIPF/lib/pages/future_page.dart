import 'package:flutter/material.dart';

class FuturePage extends StatefulWidget {
  const FuturePage({super.key});

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  Future<List<String>> getNames() async{
    await Future.delayed(const Duration(seconds: 5));
    throw Exception();
    return[
      'Arthur',
      'Madu',
      'Renan',
      'Thomas'
    ];
    
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
    future: getNames(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting){
        return Center(
          child: CircularProgressIndicator(),
        );
      }

      if(snapshot.hasError){
        return Center(child: Text('Ocorreu um erro'),
        );
      }
      return ListView.builder(
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index){
          return Text(snapshot.data![index]);
        },
      );
    },
    );
  }
}