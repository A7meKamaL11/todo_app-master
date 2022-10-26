import 'package:flutter/material.dart';

class messanger_screen extends StatelessWidget {
  const messanger_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: const CircleAvatar(
            radius: 10.0,
            backgroundImage: NetworkImage(
                'https://scontent-hbe1-1.xx.fbcdn.net/v/t39.30808-6/286080878_1907619479443788_745728531602340424_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=p0RibFxA0IoAX8elvNq&tn=lmgyQIOxP8zYAeik&_nc_ht=scontent-hbe1-1.xx&oh=00_AT9Kgc05f65tkQ-ZxSHAPxZMQakX0S5tQjCzTHuuGsY7mg&oe=632CF7D3'),
          ),
          title: Row(
            children: const [
              SizedBox(
                width: 100.0,
              ),
              Text(
                'Chats',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              SizedBox(
                width: 60.0,
              )
            ],
          ),
          actions: [
            CircleAvatar(
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.edit),
                //color: Colors.blue,
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 35,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                          ),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0))),
                          hintText: 'Search',
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(height: 100,
                  child: ListView.separated(scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => SizedBox(width: 5.0,), itemBuilder: (context,index)=>storyBuilder(), itemCount:8)),
              SizedBox(
                height: 10.0,
              ),
              ListView.separated(itemBuilder: (context,index)=>itemBuilder(), separatorBuilder:(context,index)=>SizedBox(
                height: 5.0,
              ), itemCount: 8)

            ],
          ),
        ));
  }

  Widget itemBuilder()=> Container(
    child: Row(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: const [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://scontent-hbe1-1.xx.fbcdn.net/v/t39.30808-6/286080878_1907619479443788_745728531602340424_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=p0RibFxA0IoAX8elvNq&tn=lmgyQIOxP8zYAeik&_nc_ht=scontent-hbe1-1.xx&oh=00_AT9Kgc05f65tkQ-ZxSHAPxZMQakX0S5tQjCzTHuuGsY7mg&oe=632CF7D3'),
              radius: 30.0,
            ),
            CircleAvatar(
              radius: 10.0,
              backgroundColor: Colors.white,
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                bottom: 3.0,
                end: 3.0,
              ),
              child: CircleAvatar(
                radius: 8.0,
                backgroundColor: Colors.green,
              ),
            ),
          ],
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Ahmed kamal',
                style: TextStyle(
                    fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 2.0,
              ),
              Row(
                children: [
                  Expanded(
                      child: Text(
                        'how are you how are you how are you how are you how are you how are you how are you how are you ',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0),
                    child: Container(
                      height: 8.0,
                      width: 8.0,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Text('12.30 pm'),
                ],
              )
            ],
          ),
        )
      ],
    ),
  );

  Widget storyBuilder()=> Row(
    children: [
      Container(
        width: 60.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: const [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://scontent-hbe1-1.xx.fbcdn.net/v/t39.30808-6/286080878_1907619479443788_745728531602340424_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=p0RibFxA0IoAX8elvNq&tn=lmgyQIOxP8zYAeik&_nc_ht=scontent-hbe1-1.xx&oh=00_AT9Kgc05f65tkQ-ZxSHAPxZMQakX0S5tQjCzTHuuGsY7mg&oe=632CF7D3'),
                  radius: 30.0,
                ),
                CircleAvatar(
                  radius: 10.0,
                  backgroundColor: Colors.white,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    bottom: 3.0,
                    end: 3.0,
                  ),
                  child: CircleAvatar(
                    radius: 8.0,
                    backgroundColor: Colors.green,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 6.0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
                top: 2.0,
              ),
              child: Text(
                'ahmed kamal mohamady',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),

    ],
  );
}
