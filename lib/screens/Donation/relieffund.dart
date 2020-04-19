import '../mainDrawer.dart';
import 'payment_item.dart';
import 'package:flutter/material.dart';
import 'payment.dart';

class ReliefFund extends StatefulWidget {
  @override
  _ReliefFundState createState() => _ReliefFundState();
}

class _ReliefFundState extends State<ReliefFund> {
  // static const routeName = '/products';

  List<Payment> displayedProducts_1 = [
    Payment(
      id: 'p1',
      title: 'PayTm',
      imageUrl: 'assets/paytm.png',
      url: 'https://paytm.com/helpinghand/pm-cares-fund',
    ),
    Payment(
      id: 'p2',
      title: 'Google Pay',
      imageUrl:
          'assets/gpay.jpg',
      url: 'https://gpay.app.goo.gl/JNmwJB',
    ),
    Payment(
      id: 'p3',
      title: 'Axis Bank',
      imageUrl:
          'assets/axisbank.png',
      url: 'https://www.axisbank.com/coronavirus-pm-cares-fund-donation',
    ),
    Payment(
      id: 'p4',
      title: 'PMNRF',
      imageUrl:
          'assets/pmnrf.webp',
      url: 'https://pmnrf.gov.in/en/online-donation',
    ),
  ];
  List<Payment> displayedProducts_2 = [
    Payment(
      id: 'p1',
      title: 'Meddo Health',
      imageUrl:
          "assets/meddohealth.png",
      url: 'https://www.meddo.in/covid',
    ),
    Payment(
      id: 'p2',
      title: 'Practo',
      imageUrl:
          'assets/practo.png',
      url:
          'https://www.practo.com/health-checkup-packages/covid-19-sars-cov-2-detection/p?utm_source=referral&utm_campaign=coronavirus&utm_medium=social',
    ),
    Payment(
      id: 'p3',
      title: 'Path Labs',
      imageUrl:
          'assets/lalpathlabs.png',
      url:
          'https://www.lalpathlabs.com/book-a-test/Delhi?utm_source=internal&utm_medium=home_page_banner&utm_campaign=covid-19',
    ),
    Payment(
      id: 'p4',
      title: 'ThyroCare',
      imageUrl:
          'assets/thyrocare.jpg',
      url: 'https://covid.thyrocare.com/covid-19.aspx',
    ),
  ];
  List<Payment> displayedProducts_3 = [
    Payment(
      id: 'p1',
      title: '',
      imageUrl:
          "assets/jio.jpg",
      url:
          'https://covid.bhaarat.ai/workflow/5e7912eaab25b3cac1451628',
    ),
    Payment(
      id: 'p2',
      title: '',
      imageUrl:
          'assets/apple.jpg',
      url:
          'https://www.apple.com/covid19/',
    ),
    Payment(
      id: 'p3',
      title: '',
      imageUrl:
          'assets/mountainhealthcare.jpg',
      url:
          'https://intermountainhealthcare.org/covid19-coronavirus/covid19-symptom-checker/',
    ),
    Payment(
      id: 'p4',
      title: '',
      imageUrl:
          'assets/cdc.jpg',
      url: 'https://www.cdc.gov/coronavirus/2019-ncov/symptoms-testing/index.html',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      backgroundColor: Colors.blue[50],
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Utilities",
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.all(
                10,
              ),
              child: Center(
                child: Container(
                  height: 200,
                  width: 350,
                  child: Card(
                    elevation: 15,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.blue[100],
                            Colors.blue[200],
                            Colors.blue[300],
                            Colors.blue[400],
                            Colors.blue[500],
                          ],
                        ),
                      ),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(
                              20,
                            ),
                            child: Text(
                              "Donate to PM Relief Fund",
                              style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: displayedProducts_1
                                  .map(
                                    (i) => PaymentItem(
                                      id: i.id,
                                      imageUrl: i.imageUrl,
                                      url: i.url,
                                      title: i.title,
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(
                10,
              ),
              child: Center(
                child: Container(
                  height: 200,
                  width: 350,
                  child: Card(
                    elevation: 15,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.blue[100],
                            Colors.blue[200],
                            Colors.blue[300],
                            Colors.blue[400],
                            Colors.blue[500],
                          ],
                        ),
                      ),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(
                              20,
                            ),
                            child: Text(
                              "Book Your COVID-19 Test",
                              style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: displayedProducts_2
                                  .map((i) => PaymentItem(
                                        id: i.id,
                                        imageUrl: i.imageUrl,
                                        url: i.url,
                                        title: i.title,
                                      ))
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(
                10,
              ),
              child: Center(
                child: Container(
                  height: 200,
                  width: 350,
                  child: Card(
                    elevation: 15,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.blue[100],
                            Colors.blue[200],
                            Colors.blue[300],
                            Colors.blue[400],
                            Colors.blue[500],
                          ],
                        ),
                      ),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(
                              20,
                            ),
                            child: Text(
                              "Check for Symptoms",
                              style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: displayedProducts_3
                                  .map(
                                    (i) => PaymentItem(
                                      id: i.id,
                                      imageUrl: i.imageUrl,
                                      url: i.url,
                                      title: i.title,
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
