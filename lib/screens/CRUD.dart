import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyStore extends StatefulWidget {
  const MyStore({super.key});

  @override
  State<MyStore> createState() => _MyStoreState();
}

class _MyStoreState extends State<MyStore> {
  //creating an instance of our collection(table):
  final CollectionReference Products =
      FirebaseFirestore.instance.collection('products');
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  Future<void> Update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      //grap the current value of this object:
      nameController.text = documentSnapshot['name'];
      priceController.text = documentSnapshot['price'].toString();
    }
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: ((BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: priceController,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(labelText: 'Price'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () async {
                      final String name = nameController.text;
                      final double? price =
                          double.tryParse(priceController.text);

                      if (price != null) {
                        await Products.doc(documentSnapshot!.id)
                            .update({"name": name, "price": price});
                        nameController.text = '';
                        priceController.text = '';
                        Navigator.of(context).pop();
                      }
                    },
                    child: const Text('Update'))
              ],
            ),
          );
        }));
  }

  Future<void> Create([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      //grap the current value of this object:
      nameController.text = documentSnapshot['name'];
      priceController.text = documentSnapshot['price'].toString();
    }
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: ((BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: priceController,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(labelText: 'Price'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () async {
                      final String name = nameController.text;
                      final double? price =
                          double.tryParse(priceController.text);

                      if (price != null) {
                        await Products.add({"name": name, "price": price});
                        nameController.text = '';
                        priceController.text = '';
                        Navigator.of(context).pop();
                      }
                    },
                    child: const Text('Create'))
              ],
            ),
          );
        }));
  }

  Future<void> Delete(String productID) async {
    await Products.doc(productID).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (() {
            Create();
            // _create();
          }),
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/loginImage.jpg"), fit: BoxFit.cover),
          ),
          child: StreamBuilder(
              stream: Products.snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                if (streamSnapshot.hasData) {
                  return ListView.builder(
                      itemCount: streamSnapshot.data!.docs.length,
                      itemBuilder: ((context, index) {
                        final DocumentSnapshot documentSnapshot =
                            streamSnapshot.data!.docs[index];
                        return Card(
                          margin: const EdgeInsets.all(10),
                          child: ListTile(
                            title: Text(documentSnapshot['name']),
                            subtitle:
                                Text(documentSnapshot['price'].toString()),
                            trailing: SizedBox(
                              width: 100,
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: (() {
                                      Update(documentSnapshot);
                                    }),
                                    icon: Icon(Icons.edit),
                                  ),
                                  IconButton(
                                    onPressed: (() {
                                      Delete(documentSnapshot.id);
                                    }),
                                    icon: Icon(Icons.delete),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }));
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),
        ));
  }
}
