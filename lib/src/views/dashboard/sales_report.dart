import 'package:admin_dashboard/src/constant/color.dart';
import 'package:admin_dashboard/src/constant/enum.dart';
import 'package:admin_dashboard/src/constant/string.dart';
import 'package:admin_dashboard/src/constant/text.dart';
import 'package:admin_dashboard/src/utils/charts/chartsutils.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class SalesReport extends StatefulWidget {
  const SalesReport({Key? key}) : super(key: key);

  @override
  State<SalesReport> createState() => _SalesReportState();
}

class _SalesReportState extends State<SalesReport> {
  // final List<Map<String, dynamic>> _chartList = [
  //   {
  //     'bedgeTitle': 'Desk',
  //     'badgeColor': ColorConst.primary,
  //     'title': Strings.desktop,
  //     'percentage': '35.5%',
  //   },
  //   {
  //     'bedgeTitle': 'Mob',
  //     'badgeColor': ColorConst.chartColorGreen,
  //     'title': Strings.mobile,
  //     'percentage': '30.0%',
  //   },
  //   {
  //     'bedgeTitle': 'Tab',
  //     'badgeColor': ColorConst.chartColorYellow,
  //     'title': Strings.tablets,
  //     'percentage': '44.5%',
  //   },
  // ];

  // List<PieChartSectionData> showingSections() {
  //   return List.generate(3, (i) {
  //     double radius = 16.0;
  //     switch (i) {
  //       case 0:
  //         return PieChartSectionData(
  //           color: ColorConst.primary,
  //           radius: radius,
  //         );
  //       case 1:
  //         return PieChartSectionData(
  //           color: ColorConst.chartColorGreen,
  //           radius: radius,
  //         );
  //       case 2:
  //         return PieChartSectionData(
  //           color: ColorConst.chartColorYellow,
  //           radius: radius,
  //         );
  //       default:
  //         throw Error();
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: ColorConst.primary.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      elevation: 7,
      child: Container(
        constraints: const BoxConstraints(minHeight: 465),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ConstText.lightText(
              text: Strings.salesReport,
              fontWeight: FontWeight.bold,
            ),
            FxBox.h24,
            _dateAndPrice(),
            FxBox.h40,
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 240,
              // child: _chart(),
              child: getChart(ChartType.piaChart),
            ),
            // FxBox.h24,
            // ListView.separated(
            //   separatorBuilder: (context, index) {
            //     return Divider(
            //       height: 1,
            //       color: ColorConst.grey800.withOpacity(0.2),
            //     );
            //   },
            //   shrinkWrap: true,
            //   itemCount: _chartList.length,
            //   itemBuilder: (context, index) {
            //     return _chartValue(
            //       bedgeTitle: _chartList[index]['bedgeTitle'],
            //       badgeColor: _chartList[index]['badgeColor'],
            //       title: _chartList[index]['title'],
            //       percentage: _chartList[index]['percentage'],
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }

  Widget _dateAndPrice() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          'November 01 - November 30',
          softWrap: true,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          '\$${2730}',
          softWrap: true,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  // Widget _chartValue({
  //   required String bedgeTitle,
  //   required Color badgeColor,
  //   required String title,
  //   required String percentage,
  // }) {
  //   return Column(
  //     children: [
  //       Padding(
  //         padding: const EdgeInsets.all(10.0),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             FxBadge(
  //               text: bedgeTitle,
  //               radius: 4,
  //               color: badgeColor,
  //             ),
  //             Text(
  //               title,
  //               softWrap: true,
  //               style: const TextStyle(
  //                 fontSize: 15,
  //                 fontWeight: FontWeight.w600,
  //               ),
  //             ),
  //             Text(
  //               percentage,
  //               softWrap: true,
  //               style: const TextStyle(
  //                 fontSize: 15,
  //                 fontWeight: FontWeight.w600,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // Widget _chart() {
  //   return PieChart(
  //     PieChartData(
  //       centerSpaceRadius: 80,
  //       sections: showingSections(),
  //     ),
  //   );
  // }
}
