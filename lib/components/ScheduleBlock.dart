import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:train_schedule/providers/FormModel.dart';

class ScheduleBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FormModel model = Provider.of<FormModel>(context);
    return Container(
      height: (model.schedule.length < 4
          ? model.schedule.length * 90
          : 4 * 90).toDouble(),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        border: Border.all(
          color: Colors.grey[200],
          width: 2,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListView.separated(
        itemCount: model.schedule.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) {
          return ListTile(
            title: Column(
              children: [
                Text(
                  '${model.schedule[index].route}',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                ),
                PointSchedule(
                  model.schedule[index].source,
                  model.schedule[index].sourceArrival,
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                ),
                PointSchedule(
                  model.schedule[index].destination,
                  model.schedule[index].destinationArrival,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class PointSchedule extends StatelessWidget {
  final String _station;
  final String _arrival;

  PointSchedule(this._station, this._arrival);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$_station',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          Text(
            '$_arrival',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
