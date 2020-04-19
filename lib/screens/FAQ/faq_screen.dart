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
    'Can COVID-19 be transmitted through the air ?',
    'What can I do to protect myself?',
    'Are health workers at risk from the novel coronavirus?',
    'Is it true that this novel coronavirus originated from bats?',
    'Has WHO recommended any travel or trade restrictions related to this new virus?',
    'Can humans become infected with novel coronavirus from animals?',
  ];

  final List answers = [
    'Corona viruses are a large family of viruses which may cause illness in animals or humans.  In humans, several coronaviruses are known to cause respiratory infections ranging from the common cold to more severe diseases such as Middle East Respiratory Syndrome (MERS) and Severe Acute Respiratory Syndrome (SARS). The most recently discovered coronavirus causes coronavirus disease COVID-19. ',
    'COVID-19 is the infectious disease caused by the most recently discovered corona virus. This new virus and disease were unknown before the outbreak began in Wuhan, China, in December 2019. ',
    'The most common symptoms of COVID-19 are fever, tiredness, and dry cough. Some patients may have aches and pains, nasal congestion, runny nose, sore throat or diarrhea. These symptoms are usually mild and begin gradually. Some people become infected but don’t develop any symptoms and do not feel unwell. Most people (about 80%) recover from the disease without needing special treatment. Around 1 out of every 6 people who gets COVID-19 becomes seriously ill and develops difficulty breathing. Older people, and those with underlying medical problems like high blood pressure, heart problems or diabetes, are more likely to develop serious illness. People with fever, cough and difficulty breathing should seek medical attention.',
    'People can catch COVID-19 from others who have the virus. The disease can spread from person to person through small droplets from the nose or mouth which are spread when a person with COVID-19 coughs or exhales. These droplets land on objects and surfaces around the person. Other people then catch COVID-19 by touching these objects or surfaces, then touching their eyes, nose or mouth. People can also catch COVID-19 if they breathe in droplets from a person with COVID-19 who coughs out or exhales droplets. This is why it is important to stay more than 1 meter (3 feet) away from a person who is sick. ',
    'Studies to date suggest that the virus that causes COVID-19 is mainly transmitted through contact with respiratory droplets rather than through the air.  See previous answer on “How does COVID-19 spread?',
    'Exactly how people become infected with this virus is not known at this time. However, some general measures that would be prudent and help prevent the acquisition of any respiratory illness are to avoid close contact, when possible, with anyone who shows symptoms of illness (coughing and sneezing), and to maintain good hand hygiene.',
    'Health care workers come into contact with patients with many different infectious illnesses more often than the general public. Therefore WHO recommends that health care workers consistently apply appropriate infection prevention and control measures.',
    'This is one possibility but the origin of the virus has not yet been established.',
    'No. WHO does not recommend any travel or trade restrictions with respect to this event. WHO will continue to provide updated information as it is available.',
    'WHO is closely monitoring the situation to identify how people are being exposed. There is currently no direct evidence that the human cases were exposed through direct contact with animals.',
  ];

  bool isexpand = false;
  @override
  void initState(){
    super.initState();
    isexpand = false;
  }


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
              "FAQs",
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
                      title: Text(
                        '${questions[idx]}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold
                        ),
                        ),
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
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15.0,
                              fontFamily: 'Roboto'
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
      ),
        ),
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