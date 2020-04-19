import './games_item.dart';
import 'package:flutter/material.dart';
import '../mainDrawer.dart';
import './games.dart';

class GamesScreen extends StatefulWidget {
  static const routeName = '/games';
  @override
  _GamesScreenState createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen> {
  List<Games> displayedProducts = [
    Games(
      id: 'g1',
      title: 'Monopoly',
      imageUrl:
          'https://lh3.googleusercontent.com/DdOcy6cPCY0bpp4BF7n2kAp9ubvVmLfbi7LNQcly6ZTbF2RxcY5AJXuKiftRi7SwUpI=w1536-h722-rw',
      url:
          'https://play.google.com/store/apps/details?id=com.scientificgames.monopolyslots',
      rating: '4.6',
      downlaod: '134,102',
    ),
    Games(
      id: 'g2',
      title: 'Uno Friends',
      imageUrl:
          'https://lh3.googleusercontent.com/1xdx2LfyIyIYF_eozRsG7tlY-9FezJ-cHuy97xWxf9Z4D_09xaUm_YXA94izzuMnEf0=w1536-h722-rw',
      url:
          'https://play.google.com/store/apps/details?id=uno.friends.free.card.ono',
      rating: '4.1',
      downlaod: '27,683',
    ),
    Games(
      id: 'g3',
      title: 'Ludo King',
      imageUrl:
          'https://lh3.googleusercontent.com/UkGZ8EOaKHr6hzgv-Fp8cOF2aZDa-3f2FJ4-uFPrx5UwtK00KCXsJC3v-fv43dE7dxw=w1536-h722-rw',
      url: 'https://play.google.com/store/apps/details?id=com.ludo.king',
      rating: '4.3',
      downlaod: '4,317,794',
    ),
    Games(
      id: 'g4',
      title: "June's Journey",
      imageUrl:
          'https://lh3.googleusercontent.com/0sIqYPsQn5FxaUfT8Uo0F6Vd4R01xBRFLkoNl3gGcsy9o6FAlp0sgKsAEi4VET3L-5c=w1536-h722-rw',
      url:
          'https://play.google.com/store/apps/details?id=net.wooga.junes_journey_hidden_object_mystery_game',
      rating: '4.6',
      downlaod: '551,501',
    ),
    Games(
      id: 'g5',
      title: 'Word Cross',
      imageUrl:
          'https://lh3.googleusercontent.com/B6uXpQ5RyCA3oSbNpfDFS8rZ83RQfsRZfyr0hJFZfm-dFhJNdOTbPPid-wjP6tbPv-Au=w1536-h722-rw',
      url:
          'https://play.google.com/store/apps/details?id=com.wordgame.puzzle.board.en',
      rating: '4.6',
      downlaod: '218,102',
    ),
    Games(
      id: 'g6',
      title: 'Stickman Party',
      imageUrl:
          'https://lh3.googleusercontent.com/z1Y7Xj590EErLrw6qvxlIyX3wQiFHUb4-GWiJ7EFm3viq6TCqYpvIEXA1sJRP-Sb7AME=w1536-h722-rw',
      url:
          'https://play.google.com/store/apps/details?id=com.PlayMax.playergames',
      rating: '4.2',
      downlaod: '259,430',
    ),
    Games(
      id: 'g7',
      title: 'Candy Crush Saga',
      imageUrl:
          'https://lh3.googleusercontent.com/cvOoRU_Toq56fmq3h4_Mx9F3j96w93ZWCxkrQIscsh8n1N9Ycj8m92aSTsiudZCqnhc=w1536-h722-rw',
      url:
          'https://play.google.com/store/apps/details?id=com.king.candycrushsaga',
      rating: '4.6',
      downlaod: '28,202,252',
    ),
    Games(
      id: 'g8',
      title: '8 Ball Pool',
      imageUrl:
          'https://lh3.googleusercontent.com/RvTomqn3-VjKNeVMKxluagjMvocjdAr__k8d6DZlAeEifAIF-ZoyJgQ3mGKRmN67bw=w1536-h722-rw',
      url:
          'https://play.google.com/store/apps/details?id=com.miniclip.eightballpool',
      rating: '4.5',
      downlaod: '18,509,389',
    ),
    Games(
      id: 'g9',
      title: 'Angry Birds 2',
      imageUrl:
          'https://lh3.googleusercontent.com/tjEFTCXRbi1NBIIvA8_jYl5CMFZHRcaXtSE_pUC-TxsR0MZJDOoCGyACvZBwLwFZr8s=w1536-h722-rw',
      url: 'https://play.google.com/store/apps/details?id=com.rovio.baba',
      rating: '4.6',
      downlaod: '5,124,923',
    ),
    Games(
      id: 'g10',
      title: 'World Cricket Championship 2',
      imageUrl:
          'https://lh3.googleusercontent.com/6hl4u-EWmF0y9UeljwQQrFuVUtkzeyjA6DOjvG1QGLunmr8u8DnZ2kP1ejtUSPTyCw=w1536-h722-rw',
      url: 'https://play.google.com/store/apps/details?id=com.nextwave.wcc2',
      rating: '4.3',
      downlaod: '2,660,002',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        Navigator.of(context).pushReplacementNamed('/home');
        return null;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Games",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: 'Roboto',
              ),
            ),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blue[100],
                    Colors.blue[200],
                    Colors.blue[300],
                    Colors.blue[400]
                  ],
                ),
              ),
            ),
          ),
          drawer: Drawer(
            child: MainDrawer(),
          ),
          body: Container(
            color: Colors.grey.withOpacity(0.2),
            child: ListView.builder(
              itemBuilder: (ctx, i) {
                return GamesItem(
                  id: displayedProducts[i].id,
                  title: displayedProducts[i].title,
                  imageUrl: displayedProducts[i].imageUrl,
                  url: displayedProducts[i].url,
                  rating: displayedProducts[i].rating,
                  download: displayedProducts[i].downlaod,
                );
              },
              itemCount: displayedProducts.length,
            ),
          ),
        ),
      ),
    );
  }
}
