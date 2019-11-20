import 'package:flutter/material.dart';
import 'package:npa_distributor/color.dart';
import 'package:npa_distributor/page/delivery_page.dart';
import 'package:npa_distributor/page/notification_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    DeliveryPage(),
    NotificationPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dispatch"),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            // sets the background color of the `BottomNavigationBar`
            canvasColor: colorPrimary,
            // sets the active color of the `BottomNavigationBar` if `Brightness` is light
            primaryColor: Colors.red,
            textTheme: Theme.of(context)
                .textTheme
                .copyWith(caption: new TextStyle(color: colorPrimaryYellow))),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.local_shipping),
              title: Text('Delivery'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: colorPrimaryYellow,
          onTap: _onItemTapped,
        ),
      ),

      // body: ListView(
      //   children: <Widget>[
      //     Container(
      //       height: 280,
      //       decoration: BoxDecoration(
      //         image: DecorationImage(
      //           image: AssetImage('assets/images/npa_logo.png'),
      //           fit: BoxFit.fitHeight,
      //         ),
      //       ),
      //     ),
      //     SizedBox(height: 20),
      //     Container(
      //       // width: MediaQuery.of(context).size.width,
      //       // decoration: BoxDecoration(color: Colors.indigo),
      //       // padding: EdgeInsets.symmetric(horizontal: 15),
      //       child: Column(
      //         children: <Widget>[
      //           Center(
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: <Widget>[
      //                 _buildItem(
      //                     icon: Icons.local_shipping,
      //                     text: "Delivery",
      //                     onTap: () {
      //                       // Navigator.push(
      //                       //   context,
      //                       //   MaterialPageRoute(
      //                       //       builder: (context) => RequestPage()),
      //                       // );
      //                     }),
      //                 _buildItem(
      //                     icon: Icons.track_changes,
      //                     text: "Tracking",
      //                     onTap: () {
      //                       // Navigator.push(
      //                       //   context,
      //                       //   MaterialPageRoute(
      //                       //       builder: (context) => UpcomingOrderPage()),
      //                       // );
      //                     }),
      //                 _buildItem(
      //                     icon: Icons.notifications_active,
      //                     text: "Notification",
      //                     onTap: () {
      //                       // Navigator.push(
      //                       //   context,
      //                       //   MaterialPageRoute(
      //                       //       builder: (context) => HistoryPage()),
      //                       // );
      //                     }),
      //               ],
      //             ),
      //           ),

      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }

  Widget _buildItem({IconData icon, String text, GestureTapCallback onTap}) {
    return Container(
      width: 120,
      height: 120,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Card(
          elevation: 15,
          shape: new RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(2.0)),
          ),
          color: colorPrimaryYellow,
          child: InkWell(
            splashColor: Colors.indigo,
            onTap: onTap,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  icon,
                  color: Colors.white,
                  size: 50,
                ),
                Padding(
                  // decoration: BoxDecoration(color: Colors.black38),
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  child: Text(
                    text != null ? text : "",
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.body2.copyWith(
                          color: Colors.white,
                        ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
