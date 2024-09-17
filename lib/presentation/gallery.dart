import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/pixabay_provider.dart';
import 'full_image.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {

    WidgetsBinding.instance.addPostFrameCallback((_){
      final pixabayProvider = context.read<PixabayImageProvider>();
      if (pixabayProvider.images == null){
        pixabayProvider.getImages();
      }
    });
    super.initState();
  }

  final TextEditingController _query = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PixabayImageProvider>();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('Pixabay Images')
        ),
        body: Column(
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Flexible(
                        child: TextField(
                          controller: _query,
                          onChanged: (q){
                            provider.setQuery(q);
                          },
                          decoration: InputDecoration(
                            hintText: "Search Images for ...",
                            fillColor: Colors.blue[200],
                            filled: true,
                            suffix: IconButton(
                              icon: const Icon(Icons.search),
                              onPressed: provider.getImages,
                            ),
                          ),
                        ),
                    ),
                    SizedBox(width: 10,),
                    ElevatedButton(
                        onPressed: provider.getImages,
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: const BorderSide(color: Colors.black, width: 2)
                            )
                        ),
                        child: const Text('Search')
                    ),
                  ],
                ),
              ),


            Expanded(
              child: LayoutBuilder(
                  builder: (context, constraints) {

                    if (provider.error != null ){
                      return Center(
                        child: Text(provider.error!),
                      );
                    }

                    if (provider.images == null){
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    else {
                      if (provider.images!.length == 0){
                        return const Center(
                          child: Text('No Image Found !!!'),
                        );
                      }
                      return GridView.builder(
                          itemCount: provider.images!.length,
                          padding: const EdgeInsets.all(20),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: constraints.maxWidth ~/ 170,
                            crossAxisSpacing: 4.0,
                            mainAxisSpacing: 4.0,
                            childAspectRatio: 0.8,
                          ),
                          itemBuilder: (context, index){
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => FullImagePage(img: provider.images![index].largeImageURL)));
                                  },
                                  child: Image.network(
                                    provider.images![index].previewURL,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Text(
                                  provider.images![index].likes.toString() + ' Likes', //String.fromCharCode(0x1F44D),
                                ),
                                Text(provider.images![index].comments.toString() + ' Comments')
                              ],
                            );
                          }
                      );
                    }

                    return const Center(
                      child: Text(
                        "Something went wrong!!!",
                      ),
                    );
                  }
              ),
            ),
          ],
        )
    );
  }
}