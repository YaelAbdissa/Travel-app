import 'package:flutter/material.dart';
import 'package:travel_app/colors.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    // TODO: implement initState

    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // app bar menu
          Container(
            padding: const EdgeInsets.only(left: 20, top: 50, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.menu,
                  size: 30,
                  color: Colors.black54,
                ),
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.5)),
                )
              ],
            ),
          ),
          const SizedBox(height: 40),
          // discover text
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: AppLargeText(text: "Discover"),
          ),
          const SizedBox(height: 30),
          // Tab bar
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            alignment: Alignment.centerLeft,
            child: TabBar(
              padding: EdgeInsets.zero,
              indicator:
                  CircleTabIndicator(color: AppColors.mainColor, radius: 4),
              labelPadding: const EdgeInsets.only(right: 15, left: 15),
              controller: tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              isScrollable: true,
              labelStyle: TextStyle(),
              tabs: const [
                Tab(text: "Places"),
                Tab(text: "Inspiration"),
                Tab(text: "Emotions"),
              ],
            ),
          ),
          SizedBox(
            height: 300,
            width: double.maxFinite,
            child: TabBarView(
              controller: tabController,
              children: [
                ListView.builder(
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(
                            left: index == 0 ? 30 : 0, top: 15, right: 20),
                        width: 200,
                        height: 365,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                            image: AssetImage("asstes/images/mountain.jpeg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }),
                Text("data"),
                Text("data"),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AppLargeText(
                      text: "Explore more",
                      size: 22,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: AppText(
                        text: "See all",
                        color: AppColors.mainColor,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                height: 110,
                width: double.maxFinite,
                child: ListView.builder(
                    itemCount: 6,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.only(
                          left: index == 0 ? 15 : 0,
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 8, left: 8),
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: const DecorationImage(
                                  image:
                                      AssetImage("asstes/images/mountain.jpeg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            AppText(
                              text: "Hiking",
                              size: 14,
                              color: AppColors.textColor2,
                            )
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  final double radius;
  const CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  final double radius;
  const _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    // paint.
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius * 1.8);

    canvas.drawCircle(offset + circleOffset, radius, paint);
  }
}
