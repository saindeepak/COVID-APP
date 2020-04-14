// import 'package:covid/screens/Home2/home2.dart';
import 'package:flutter/material.dart';
import '../mainDrawer.dart';

class FaqScreen extends StatefulWidget {
  static const routeName = '/faq';

  @override
  _FaqScreenState createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  final List questions = [
    'What is corona virus ?',
    'What is COVID-19 ?',
    'What are the symptoms of COVID-19 ?',
    'How does COVID-19 spread ?',
    'Can the virus that causes COVID-19 be transmitted through the air ?'
  ];

  final List answers = [
    'Corona viruses are a large family of viruses which may cause illness in animals or humans.  In humans, several coronaviruses are known to cause respiratory infections ranging from the common cold to more severe diseases such as Middle East Respiratory Syndrome (MERS) and Severe Acute Respiratory Syndrome (SARS). The most recently discovered coronavirus causes coronavirus disease COVID-19. ',
    'COVID-19 is the infectious disease caused by the most recently discovered corona virus. This new virus and disease were unknown before the outbreak began in Wuhan, China, in December 2019. ',
    'The most common symptoms of COVID-19 are fever, tiredness, and dry cough. Some patients may have aches and pains, nasal congestion, runny nose, sore throat or diarrhea. These symptoms are usually mild and begin gradually. Some people become infected but don’t develop any symptoms and do not feel unwell. Most people (about 80%) recover from the disease without needing special treatment. Around 1 out of every 6 people who gets COVID-19 becomes seriously ill and develops difficulty breathing. Older people, and those with underlying medical problems like high blood pressure, heart problems or diabetes, are more likely to develop serious illness. People with fever, cough and difficulty breathing should seek medical attention.',
    'People can catch COVID-19 from others who have the virus. The disease can spread from person to person through small droplets from the nose or mouth which are spread when a person with COVID-19 coughs or exhales. These droplets land on objects and surfaces around the person. Other people then catch COVID-19 by touching these objects or surfaces, then touching their eyes, nose or mouth. People can also catch COVID-19 if they breathe in droplets from a person with COVID-19 who coughs out or exhales droplets. This is why it is important to stay more than 1 meter (3 feet) away from a person who is sick. ',
    'Studies to date suggest that the virus that causes COVID-19 is mainly transmitted through contact with respiratory droplets rather than through the air.  See previous answer on “How does COVID-19 spread?',
  ];
  bool isexpand = false;
  @override
  void initState(){
    super.initState();
    isexpand = false;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FAQs"),
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: Container(
        color: Colors.lightBlue[50],
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: ListView.builder(
          itemCount: questions.length,
          itemBuilder: (context,idx){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.lightBlue[50],
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                elevation: 10.0,
                child: ExpansionTile(
                  leading: Icon(Icons.arrow_forward_ios),
                  trailing: (isexpand)?Icon(Icons.arrow_drop_down):Icon(Icons.arrow_drop_up),
                  key: PageStorageKey<String>(questions[idx]),
                  title: Text('${questions[idx]}'),
                  onExpansionChanged: (val){
                    setState(() {
                      if(isexpand){
                        isexpand = false;
                      }
                      else{
                        isexpand = true;
                      }
                    });
                  },
                  children: [
                    Container(
                      margin: EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: Colors.blueGrey.withOpacity(0.4),
                      ),
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        '${answers[idx]}',
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                        maxLines: 15,
                        ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      )
    );
  }
}

class Expandablecontent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Colors.lightBlue[100],
        borderRadius: BorderRadius.circular(18.0)
      ),
      child: Text(''),
    );
  }
}