import 'package:flutter/material.dart';
import 'package:quiz_app/gameScreen/word.dart';
import 'package:quiz_app/shared_pref.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController monController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController idPlusNum = TextEditingController();
  late Future<String> url;
  late Word v;
  @override
  void initState() {
    super.initState();
    v = Word(name: "", imagePath: "", mon: "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(hintText: "Name"),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: monController,
              decoration: const InputDecoration(hintText: "Mon"),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: idController,
              decoration: const InputDecoration(hintText: "id"),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: idPlusNum,
              decoration: const InputDecoration(hintText: "id + integer"),
            ),
            Text(Shared.prefs.getInt('level1').toString()),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  if (nameController.text.isNotEmpty && monController.text.isNotEmpty && idController.text.isNotEmpty) {
                    Shared.db.addData(nameController.text, monController.text, idController.text);
                  } else {
                    showDialog(
                        context: context,
                        builder: (_) => const AlertDialog(
                              title: Text("Алдаа"),
                              content: Text("Зарим утга хоосон байна"),
                            ));
                  }
                  if (idPlusNum.text.isEmpty) {
                    idPlusNum.text = "1";
                  } else if (idController.text.isNotEmpty) {
                    idController.text = (int.parse(idController.text) + int.parse(idPlusNum.text)).toString();
                  }
                },
                child: const Text("Үг нэмэх")),
            ElevatedButton(
                onPressed: () async {
                  if (nameController.text.isNotEmpty) {
                    v = (await Shared.db.getWordData(nameController.text)) ?? Word(name: "", imagePath: "", mon: "");
                    setState(() {
                      showDialog(
                          context: context,
                          builder: (_) => v.name != nameController.text || v.name.isEmpty
                              ? const AlertDialog(title: Text("Алдаа"), content: Text("Тийм үг байхгүй"))
                              : AlertDialog(title: const Text("Хайлт амжилттай"), content: Text("${v.name} байна.")));
                    });
                  }
                },
                child: const Text("Үг шалгах")),
            /*ElevatedButton(
                onPressed: () async {
                  setState(() {});
                  url = Shared.storagef.downloadURL("sounds/Congratulations.mp3");
                  Shared.audioPlayerR.play(await url);
                },
                child: Text("Play sound")),*/
            ElevatedButton(
                onPressed: () async {
                  setState(() {
                    //int? level = Shared.prefs.getInt('level')! + 1;
                    Shared.prefs.setInt('level1', 1);
                    Shared.prefs.setInt('level2', 1);
                    Shared.prefs.setInt('level3', 1);
                    Shared.prefs.setInt('level4', 1);
                  });
                },
                child: const Text("Үеүүдийн утга 1 болгох")),

            /*FutureBuilder(
                future: Shared.storagef.downloadURL(v.imagePath),
                builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                    return Column(
                      children: [
                        Container(
                            width: 200,
                            height: 200,
                            child: Image.network(
                              snapshot.data!,
                              fit: BoxFit.cover,
                            )),
                      ],
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData) {
                    return CircularProgressIndicator();
                  }
                  return Container();
                })*/
          ],
        ),
      ),
    );
  }
}
