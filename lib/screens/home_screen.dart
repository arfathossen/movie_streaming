import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:movies_streaming_app/widgets/movies_selection.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabSection);
    super.initState();
  }

  _handleTabSection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(right: 0, left: 15, top: 30),
                child: Column(
                  children: [
                    Icon(Icons.favorite),
                    SizedBox(
                      height: 10,
                    ),
                    Icon(Icons.access_alarm)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text(
          'Movies Streaming',
          style: TextStyle(color: Colors.white),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: ListView(
        children: [
          CarouselSlider(
            items: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: const DecorationImage(
                        image: AssetImage('images/upcoming1.jpg'),
                        fit: BoxFit.cover)),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: const DecorationImage(
                        image: AssetImage('images/upcoming2.jpg'),
                        fit: BoxFit.cover)),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: const DecorationImage(
                        image: AssetImage('images/upcoming3.jpg'),
                        fit: BoxFit.cover)),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: const DecorationImage(
                        image: AssetImage('images/upcoming4.jpg'),
                        fit: BoxFit.cover)),
              )
            ],
            options: CarouselOptions(
              autoPlay: true,
              height: 230,
              aspectRatio: 16 / 9,
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              viewportFraction: 0.8,
              autoPlayAnimationDuration: const Duration(microseconds: 800),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          TabBar(
            controller: _tabController,
            unselectedLabelColor: Colors.white.withOpacity(0.5),
            isScrollable: true,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.red),
            labelStyle:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            labelPadding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            tabs: const [
              Tab(
                text: 'All',
              ),
              Tab(
                text: 'Action',
              ),
              Tab(
                text: 'Adventure',
              ),
              Tab(
                text: 'Comedy',
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: [
              const MoviesSelection(),
              Container(),
              Container(),
              Container()
            ][_tabController.index],
          )
        ],
      ),
    );
  }
}
