import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/service_provider.dart';
import '../utils/spinny_image.dart';
import '../viewmodels/service_viewmodel.dart';
import 'details_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final serviceProvider = Provider.of<ServiceProvider>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      serviceProvider.fetchServices();
    });

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [

          Expanded(
            child: Consumer<ServiceProvider>(
              builder: (context, provider, child) {
                if (provider.isLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                return SingleChildScrollView(
                  child: Column(
                    children: [

                      Container(
                        height:MediaQuery.of(context).size.height * 0.4,
                        alignment: Alignment.topLeft,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xffA90140),
                                Color(0xff550120)
                              ]
                          ),

                        ),
                        child: Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 60,left: 10, right: 10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          decoration: InputDecoration(
                                            hintText: 'Search "Punjabi Lyrics"',
                                            hintStyle: TextStyle(color: Colors.white54),
                                            prefixIcon: Icon(Icons.search, color: Colors.white),
                                            suffixIcon: Icon(Icons.mic, color: Colors.white,),
                                            filled: true,
                                            fillColor: Colors.grey[900],
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                          style: TextStyle(color: Colors.white),
                                        ),

                                      ),
                                      SizedBox(width: 20,),
                                      CircleAvatar(
                                        radius: 20,
                                        backgroundColor: Colors.white, // You can change this
                                        child: Icon(
                                          Icons.person_2_outlined, // Replace with any icon you want
                                          color: Colors.black,
                                          size: 24,
                                        ),
                                      )

                                    ],
                                  ),
                                ),
                                SizedBox(height: 20,),
                                Container(
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Claim your\n',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'Free Demo\n',
                                          style: TextStyle(
                                            fontFamily: 'Lobster',
                                            fontSize: 40,
                                            color: Colors.white,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'for custom Music Production',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10,),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Text('Book Now'),
                                ),
                                SizedBox(height: 20,),


                              ],
                            ),
                            Stack(
                              children: [
                                SpinningImage(),
                                Positioned(child: Image.asset("assets/icons/pio.png", height: 120,), bottom: 20,right: -40,)
                              ],
                            )
                          ],
                        ),
                      ),


                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          'Hire hand-picked Pros for popular music services',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      ...provider.services.map((service) {
                        final viewModel = ServiceViewModel(service);
                        return ServiceCard(viewModel: viewModel);
                      }).toList(),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed, // <-- Keep all labels visible
        unselectedItemColor: Color(0xff61616B),
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/home.png', height: 24, ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/news.png', height: 24,),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/track.png', height: 24,),
            label: 'Track',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/messages.png', height: 24,),
            label: 'Messages',
          ),
        ],
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final ServiceViewModel viewModel;

  const ServiceCard({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          image: viewModel.background.isNotEmpty
              ? DecorationImage(
            image: AssetImage(viewModel.background),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.dstATop,
            ),
          )
              : null,
          gradient: viewModel.background.isEmpty
              ? LinearGradient(
            colors: [Colors.grey[900]!.withOpacity(0.8), Colors.black.withOpacity(0.8)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
              : null,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: ListTile(
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              
              color: Color(0x433A3062),
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(viewModel.icons),
                fit: BoxFit.cover,
              ),
            ),
          ),

          title: Text(viewModel.title, style: TextStyle(color: Colors.white)),
          subtitle: Text(viewModel.description, style: TextStyle(color: Colors.white70)),
          trailing: Image.asset(viewModel.arrowBackground, color: Colors.white, height: 25,),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsScreen(title: viewModel.title),
              ),
            );
          },
        ),
      ),
    );
  }
}