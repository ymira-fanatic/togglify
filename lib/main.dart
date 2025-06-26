import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}
final ValueNotifier<bool> isDarkMode = ValueNotifier(true);
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return ValueListenableBuilder<bool>
    (valueListenable: isDarkMode,
     builder: (context, dark, _){
      return MaterialApp(
        title: 'Liquid Glass Toggle',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: dark ? ThemeMode.dark:ThemeMode.light,
        home: HomePage(),);},);
  }
}

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Toggle Button'),
        centerTitle: false,
        backgroundColor: Color.fromARGB(255, 72, 73, 75),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Toggle It!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: (){
                isDarkMode.value = !isDarkMode.value;
              },
              child: Container(
                width: 80,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: isDarkMode.value
                      ?[Colors.blue.shade800, Colors.purple.shade800]
                      :[Colors.blue.shade200, Colors.purple.shade200],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 1,
                    )
                  ]
                ),
                child: Stack(
                  children: [
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      left: isDarkMode.value ? 40 : 0,
                      right: isDarkMode.value ? 0 : 40,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 5,
                              spreadRadius: 1,
                            )
                          ],
                        ),
                        child: Icon(
                          isDarkMode.value ? Icons.nightlight : Icons.wb_sunny,
                          color: isDarkMode.value
                              ? Colors.blue.shade800
                              : Colors.orange,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            )
          ],
        ),
      )
    );
  }
}