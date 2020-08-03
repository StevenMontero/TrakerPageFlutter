import 'package:flutter/material.dart';

class TrakingPage extends StatefulWidget {
  TrakingPage({Key key}) : super(key: key);

  @override
  _TrakingPageState createState() => _TrakingPageState();
}

class _TrakingPageState extends State<TrakingPage> {
  String currentStatus = 'placed';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF12A058),
        leading: IconButton(
          icon: Icon(Icons.menu, size: 28.0),
          color: Colors.white,
          onPressed: () {},
        ),
        title: Text(
          'Track Order',
          style: TextStyle(fontSize: 23.0),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () {},
            child: Text('CANCEL', style: TextStyle(fontSize: 14.0)),
            textColor: Colors.white,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeStatus,
        child: Icon(Icons.refresh),
        backgroundColor: Color(0xFF12A058),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _crearInfoOrden(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _crearStatusBarOrder(),
                SizedBox(
                  width: 30.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 67.0,
                    ),
                    _crearInfoStatus(
                        message: 'Order Placed',
                        subMessage: 'We have recevied your order',
                        pathImage: 'assets/listacheck.png'),
                    SizedBox(
                      height: 65.0,
                    ),
                    _crearInfoStatus(
                        message: 'Order Confirmed',
                        subMessage: 'Your order has been confirmed',
                        pathImage: 'assets/proteger.png'),
                    SizedBox(
                      height: 65.0,
                    ),
                    _crearInfoStatus(
                        message: 'Order Processed',
                        subMessage: 'We are preparing your order',
                        pathImage: 'assets/cocinero.png'),
                    SizedBox(
                      height: 68.0,
                    ),
                    _crearInfoStatus(
                        message: 'Order to Pickup',
                        subMessage: 'Your order is ready for pickup',
                        pathImage: 'assets/regalo.png'),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _crearInfoOrden() {
    return Container(
      height: 100.0,
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.grey[100], boxShadow: [
        BoxShadow(
            color: Colors.grey,
            blurRadius: 5.0,
            offset: Offset(1.0, -1.0),
            spreadRadius: 1.0)
      ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'ESTIMATED TIME',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF868686),
                    fontSize: 15.0),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                '30 minutes',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF656766),
                    fontSize: 15.0),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'ORDER NUMBER',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF868686),
                    fontSize: 15.0),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                '#2482011',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF656766),
                    fontSize: 15.0),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _crearStatusBarOrder() {
    return Container(
      padding: EdgeInsets.only(left: 35.0, top: 90.0),
      alignment: Alignment.topLeft,
      child: Column(children: <Widget>[
        _crearCirculo(
            color: currentStatus == 'placed' ? Colors.blue : Colors.red),
        SizedBox(
          height: 5.0,
        ),
        _crearBarra(
            color: currentStatus == 'confirmed'
                ? Color(0xFF12A058)
                : (currentStatus == 'processed' ||
                        currentStatus == 'pickup' ||
                        currentStatus == 'finish')
                    ? Color(0xFF12A058)
                    : Colors.grey),
        SizedBox(
          height: 5.0,
        ),
        _crearCirculo(
            color: (currentStatus == 'confirmed')
                ? Colors.blue
                : (currentStatus == 'processed' ||
                        currentStatus == 'pickup' ||
                        currentStatus == 'finish')
                    ? Colors.red
                    : Colors.grey),
        SizedBox(
          height: 5.0,
        ),
        _crearBarra(
            color: currentStatus == 'processed'
                ? Color(0xFF12A058)
                : (currentStatus == 'pickup' || currentStatus == 'finish')
                    ? Color(0xFF12A058)
                    : Colors.grey),
        SizedBox(
          height: 5.0,
        ),
        _crearCirculo(
            color: (currentStatus == 'processed')
                ? Colors.blue
                : (currentStatus != 'confirmed' &&
                        (currentStatus == 'processed' ||
                            currentStatus == 'pickup' ||
                            currentStatus == 'finish'))
                    ? Colors.red
                    : Colors.grey),
        SizedBox(
          height: 5.0,
        ),
        _crearBarra(
            color: currentStatus == 'pickup'
                ? Color(0xFF12A058)
                : (currentStatus == 'finish')
                    ? Color(0xFF12A058)
                    : Colors.grey),
        SizedBox(
          height: 5.0,
        ),
        _crearCirculo(
            color: (currentStatus == 'pickup')
                ? Colors.blue
                : (currentStatus == 'finish') ? Colors.red : Colors.grey),
      ]),
    );
  }

  Widget _crearCirculo({Color color}) {
    return CircleAvatar(
      backgroundColor: color,
      radius: 8.0,
    );
  }

  Widget _crearBarra({Color color}) {
    return Container(
        height: 100.0, width: 2.0, color: color //Color(0xFF12A058),
        );
  }

  Widget _crearInfoStatus(
      {@required String message,
      @required String subMessage,
      @required String pathImage}) {
    return Container(
      child: Row(
        children: <Widget>[
          Image(
            image: AssetImage(pathImage),
            height: 60.0,
          ),
          SizedBox(
            width: 10.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                message,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF656766),
                  fontSize: 20.0,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                subMessage,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF868686),
                    fontSize: 15.0),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _changeStatus() {
    switch (currentStatus) {
      case 'placed':
        currentStatus = 'confirmed';
        break;
      case 'confirmed':
        currentStatus = 'processed';
        break;
      case 'processed':
        currentStatus = 'pickup';
        break;
      case 'pickup':
        currentStatus = 'finish';
        break;
      default:
        currentStatus = 'placed';
        break;
    }
    setState(() {});
  }
}
