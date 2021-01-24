import 'package:flutter/material.dart';
import 'package:starter_flutter_bloc_pattern/app/AppColors.dart';
import 'package:starter_flutter_bloc_pattern/src/blocs/usersBloc.dart';
import 'package:starter_flutter_bloc_pattern/src/models/userModel.dart';

class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    usersBloc.getUsersBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SafeArea(
            child: SingleChildScrollView(
          child: _widgetsContainer(),
        )));
  }

  Widget _widgetsContainer() {
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
      child: _getUsersWidget(),
    );
  }

  Widget _getUsersWidget() {
    return StreamBuilder<UserListModel>(
      stream: usersBloc.getUsersBlocStream,
      builder: (BuildContext context, AsyncSnapshot<UserListModel> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.results != null &&
              snapshot.data.results.length > 0) {
            return _userListWidget(snapshot.data);
          }

          return Container(
            child: Text(
              "No users found.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[200], fontSize: 15.0),
            ),
          );
        } else if (snapshot.hasError) {
          return Container();
        } else {
          //loading = true;
          return CircularProgressIndicator();
        }
      },
    );
  }

  Widget _userListWidget(UserListModel eventList) {
    return Column(
      children: <Widget>[
        ListView.separated(
          separatorBuilder:(BuildContext context, int index) => Divider( color: ColorsSets.primaryColor,) ,
            controller: _scrollController,
            shrinkWrap: true,
            itemCount: eventList.results.length,
            itemBuilder: (BuildContext context, int index) {
              var item = eventList.results[index];
              return Text(item.title);
            })
      ],
    );
  }
}
