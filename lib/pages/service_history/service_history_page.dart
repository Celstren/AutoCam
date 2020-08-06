import 'package:autocam/models/service_history/service_history.dart';
import 'package:autocam/pages/navigation/methods/navigation_methods.dart';
import 'package:autocam/pages/service_history/filter/filter_controller.dart';
import 'package:autocam/pages/service_history/widget/service_filter_page.dart';
import 'package:autocam/pages/service_history/widget/service_history_item.dart';
import 'package:autocam/utils/exports/app_design.dart';
import 'package:autocam/utils/helpers/remove_over_scroll_glow.dart';
import 'package:flutter/material.dart';

class ServiceHistoryPage extends StatefulWidget {
  ServiceHistoryPage({Key key}) : super(key: key);

  @override
  _ServiceHistoryPageState createState() => _ServiceHistoryPageState();
}

class _ServiceHistoryPageState extends State<ServiceHistoryPage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.PrimaryBlue,
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: 80,
            padding: EdgeInsets.only(right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * .3,
                  decoration: BoxDecoration(
                    color: AppColors.PrimaryBlue,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.PrimaryWhite, width: 3),
                  ),
                  child: FlatButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => pushWidget(context, ServiceFilterPage()),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.filter_list, size: 24, color: AppColors.PrimaryWhite),
                        SizedBox(width: 10),
                        Text(ServiceHistoryStrings.Filter, style: AppTextStyle.whiteStyle(fontSize: AppFontSizes.Text2, fontFamily: AppFonts.Montserrat_Bold),),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: _buildSerivceHistory(),
          ),
        ],
      ),
    );
  }

  Widget _buildSerivceHistory() {
    return Container(
      child: StreamBuilder<List<ServiceHistory>>(
          stream: FilterController().getFilteredServices,
          builder: (BuildContext context,
              AsyncSnapshot<List<ServiceHistory>> servicesSnapshot) {
            switch (servicesSnapshot.connectionState) {
              case ConnectionState.none:
                return Container();
                break;
              case ConnectionState.waiting:
                return Container();
                break;
              case ConnectionState.active:
                {
                  if (servicesSnapshot.data == null) return Container();
                  return ScrollConfiguration(
                    behavior: RemoveOverScrollGlow(),
                    child: ListView.builder(
                      itemCount: servicesSnapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ServiceHistoryItem(
                            serviceHistory: servicesSnapshot.data[index]);
                      },
                    ),
                  );
                }
                break;
              case ConnectionState.done:
                return Container();
                break;
              default:
                return Container();
                break;
            }
          }),
    );
  }
}
