import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThaiFontsViewer extends StatefulWidget {
  const ThaiFontsViewer({Key? key}) : super(key: key);

  @override
  _ThaiFontsViewerState createState() => _ThaiFontsViewerState();
}

class _ThaiFontsViewerState extends State<ThaiFontsViewer> {
  String s = 'การเดินทางขากลับคงจะเหงาน่าดู';
  bool prompt = false;
  bool mali = false;
  bool press = true;
  bool mitr = false;
  bool pattaya = false;
  bool charm = false;
  double fontsSize = 40.0;
  double textSize = 16.0;

  _changeFonts(String name) {
    setState(() {
      if(name == 'Prompt')
        prompt = true;
      else if (name != 'Prompt' )
        prompt = false;
      if(name == 'Mali')
        mali = true;
      else if (name != 'Mali' )
        mali = false;
      if(name == 'Mitr')
        mitr = true;
      else if (name != 'mitr' )
        mitr = false;
      if(name == 'Pattaya')
        pattaya = true;
      else if (name != 'Pattaya' )
        pattaya = false;
      if(name == 'Charm')
        charm = true;
      else if (name != 'Charm' )
        charm = false;
    });
  }


  Widget _button(String name) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: (){_changeFonts(name);},
        style: ElevatedButton.styleFrom(
          primary: Colors.teal,
        ),
        child: Text(
          name,
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('THAI FONTS VIEWER'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        color: Colors.tealAccent.shade100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    if (prompt)
                      Text(s, style: GoogleFonts.prompt(fontSize: fontsSize,),textAlign: TextAlign.center,)
                    else if(mali)
                      Text(s, style: GoogleFonts.mali(fontSize: fontsSize,),textAlign: TextAlign.center,)
                    else if(mitr)
                      Text(s, style: GoogleFonts.mitr(fontSize: fontsSize,),textAlign: TextAlign.center,)
                      else if(pattaya)
                          Text(s, style: GoogleFonts.pattaya(fontSize: fontsSize,),textAlign: TextAlign.center,)
                      else if(charm)
                          Text(s, style: GoogleFonts.charm(fontSize: fontsSize,),textAlign: TextAlign.center,)
                    else
                      Text(s, style: GoogleFonts.sarabun(fontSize: fontsSize,),textAlign: TextAlign.center,)
                ],
              ),
            ),
            Column(
              children: [
                if (prompt)
                  Text('Font : Prompt', style: TextStyle(fontSize:textSize,))
                else if(mali)
                  Text('Font : Mali', style: TextStyle(fontSize:textSize,))
                else if(mitr)
                  Text('Font : Mitr', style: TextStyle(fontSize:textSize,))
                  else if(pattaya)
                      Text('Font : Pattaya', style: TextStyle(fontSize:textSize,))
                  else if(charm)
                      Text('Font : Charm', style: TextStyle(fontSize:textSize,))
                  else
                    Text('Font : Sarabun', style: TextStyle(fontSize:textSize,)),
                Card(
                    elevation: 5.0, //การยกตัวของการ์ด ซึ่งทำให้เกิดเงา
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                        alignment: WrapAlignment.center,
                        children: [
                          _button('Prompt'),
                          _button('Mali'),
                          _button('Mitr'),
                          _button('Pattaya'),
                          _button('Charm'),
                          _button('Saraban'),
                    ])),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
