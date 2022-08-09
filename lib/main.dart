import 'package:flutter/material.dart';
import 'package:love_shayari/firstpage.dart';
import 'package:love_shayari/model.dart';

void main() {
  runApp(const MaterialApp(
    home: loveshayri(),
      debugShowCheckedModeBanner: false,
  ));
}

class loveshayri extends StatefulWidget {
  const loveshayri({Key? key}) : super(key: key);

  @override
  State<loveshayri> createState() => _loveshayriState();
}

class _loveshayriState extends State<loveshayri> {
  List l = [
    'Love shayari',
    'Sad shayari',
    'Frindship shayari',
    'God shayari',
    'Life shayari',
    'Romentic shayari',
    'Brithday shayari',
    'Holi shayari',
    'Politics shayari',
    'Congratulation shayari',
    'Motivation shayari',
    'Comedy shayari'
  ];

  var imagelist = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTATsdakmk_qdjLaHCnBDQzSbdr0OyMskjFA&usqp=CAU",
    "https://i1.sndcdn.com/artworks-000347051514-iihv64-t500x500.jpg",
    "https://imgk.timesnownews.com/story/Friendship_day.jpg?tr=w-1200,h-900",
    "https://images.asiahighlights.com/allpicture/2019/11/d06874d1056743e38c84615b_cut_600x800_315.jpg",
    "https://images.unsplash.com/photo-1517960413843-0aee8e2b3285?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8&w=1000&q=80",
    "https://st.depositphotos.com/3203799/4106/i/600/depositphotos_41066325-stock-photo-couple-in-love-silhouette-during.jpg",
    "https://thumbs.dreamstime.com/b/happy-birthday-cupcake-celebration-message-160558421.jpg",
    "https://assets.seniority.in/media/ktpl_blog/Holi_Main_image.jpg",
    "https://thumbs.dreamstime.com/b/politics-government-referendum-democracy-vote-concept-76390514.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTs0fBxQpenS2RTgUKLg9Sna8DIfZ1HbbN4Qg&usqp=CAU",
    "https://www.success.com/wp-content/uploads/legacy/sites/default/files/new2.jpg",
    "https://rukminim2.flixcart.com/image/416/416/kb9ou4w0/poster/r/g/z/large-funny-comedy-poster-with-frame-f-72-frame-funny-po-072-original-imafsnmvhjzjfxmw.jpeg?q=70"
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    model().permissioncheck();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Love Shayari'),
      ),
      body: ListView.separated(
          separatorBuilder: (context, index) {
            return Divider(
              color: Colors.purple,
              thickness: 1,
              height: 10,
              indent: 10,
              endIndent: 10,
            );
          },
          itemBuilder: (context, index) {
            return ListTile(
              iconColor: Colors.purple,
              textColor: Colors.black,
              tileColor: Colors.orange,
              focusColor: Colors.green,
              hoverColor: Colors.red,
              selectedTileColor: Colors.yellow,
              onTap: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return first(
                          index,
                          imagelist[index],
                        );
                      },
                    ),
                  );
                });
              },
              leading: Container(
                height: 70,
                width: 70,
                child: Image.network(imagelist[index]),
              ),
              title: Text(
                "${l[index]}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            );
          },
          itemCount: l.length),
    );
  }
}
