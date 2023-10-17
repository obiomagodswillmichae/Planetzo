import 'package:flutter/material.dart';
import 'package:planet_b/Styles/colors.dart';
import 'package:planet_b/Utils/page_service.dart';

class CarbonFootprintTipsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        leading: BackButton(color: AppColor.black,),
        title: Text('Tips', style: PageService.bigHeaderStyle,),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Here are some tips for reducing your carbon footprint:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                '1. Calculate Your Carbon Emissions:\nStart by calculating your annual carbon emissions. You can use online calculators to estimate your carbon footprint. Consider factors like transportation, energy use, and consumption habits.',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                '2. Determine How Many Trees You Need:\nUse a carbon offset calculator to determine how many trees you would need to plant to offset your emissions. The number of trees required will depend on your emissions and the tree species you plan to plant.',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                '3. Select the Right Tree Species:\nChoose tree species that are native to your region and well-suited to the local climate. Native trees are typically easier to care for and have a higher chance of survival.',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                '4.Find a Planting Location:\nIdentify suitable planting locations. Consider factors like available land, soil quality, and local regulations. You may plant trees in your own yard, participate in community reforestation projects, or support organizations that plant trees..',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                '5. Acquire Tree Seedlings or Seeds:\nYou can obtain tree seedlings or seeds from local nurseries, conservation organizations, or government forestry departments. Ensure you select the right species and quantity.posed of.',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                '6. Prepare the Planting Site:\nPrepare the planting site by clearing weeds and ensuring the soil is ready for planting. Remove any grass, debris, and competing vegetation from the planting area.',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                '7. Plant the Trees:\nFollow the planting instructions for the specific tree species you have chosen. Typically, you will dig a hole, place the seedling or seed, and cover it with soil. Ensure proper spacing between trees for optimal growth.',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                '8.Provide Care and Maintenance:\nNewly planted trees need care and attention. Water them regularly, especially during dry periods, and mulch around the base of the trees to retain moisture and prevent weeds. Protect them from pests and diseases.',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                '9. Monitor and Record Progress:\nKeep a record of the trees you have planted, and periodically check on their growth and health. This will help ensure the success of your carbon offset efforts.',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                '10.Track and Share Your Impact:\nContinue to calculate your carbon emissions annually and compare the amount you have offset with the trees you have planted. Share your experience and encourage others to join in carbon offset initiatives..',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'Remember, every small action counts towards reducing our carbon footprint and protecting the environment for future generations. Have it mind that while tree planting is a valuable part of carbon offset efforts, it should be combined with other sustainable practices, such as reducing energy consumption, using renewable energy sources, and minimizing waste, for a more comprehensive approach to reducing carbon emissions.',
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16.0, color: Color(0xff358749)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
