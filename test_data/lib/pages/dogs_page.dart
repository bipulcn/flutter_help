import 'package:flutter/material.dart';
import 'package:test_data/database/dog_db.dart';
import 'package:test_data/models/dogs.dart';
import 'package:test_data/widget/e_dog_widget.dart';

class DogsPage extends StatefulWidget {
  const DogsPage({super.key});

  @override
  State<DogsPage> createState() => _DogsPageState();
}

class _DogsPageState extends State<DogsPage> {
  Future<List<Dog>>? futureDogs;
  final dogDb = DogDB();

  @override
  void initState() {
    super.initState();
    fetchDogs();
  }

  void fetchDogs() {
    setState(() {
      futureDogs = dogDb.getAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dog List")),
      body: FutureBuilder<List<Dog>>(
        future: futureDogs,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            final dogs = snapshot.data!;
            return dogs.isEmpty
                ? const Center(
                    child: Text("No dogs...."),
                  )
                : ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                    itemCount: dogs.length,
                    itemBuilder: (context, index) {
                      final dog = dogs[index];
                      return ListTile(
                        title: Text(dog.name),
                        subtitle: Text(dog.age.toString()),
                        trailing: IconButton(
                            onPressed: () async {
                              await dogDb.delete(dogs[index].id);
                              fetchDogs();
                            },
                            icon: const Icon(Icons.delete)),
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) =>
                                  CreateDogWidget(onSubmit: (title) async {
                                    await dogDb.update(
                                        id: dog.id,
                                        name: dog.name,
                                        age: dog.age);
                                    if (!mounted) return;
                                    fetchDogs();
                                    Navigator.of(context).pop();
                                  }));
                        },
                      );
                    });
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) => CreateDogWidget(
                    onSubmit: (dts) async {
                      await dogDb.create(name: dts[0], age: int.parse(dts[1]));
                      if (!mounted) return;
                      fetchDogs();
                      Navigator.of(context).pop();
                    },
                  ));
        },
      ),
    );
  }
}
