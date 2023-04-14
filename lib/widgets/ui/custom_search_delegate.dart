import 'package:flutter/material.dart';
import 'package:serve_to_be_free/widgets/user_invite_display.dart';

import '../classes/User.dart';

class CustomSearchDelegate extends SearchDelegate {
  /* This can get a list of users, for example we 
  just want leaders who might be friends with the user. 
  Or maybe just users to invite to participate in a task.

  Should be late because we dont have access yet right?
  */
  late List<User> potentialUsers;

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          onPressed: () {
            query:
            '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // Need to display the User with all the info
    List<User> matchQuery = [];
    for (var user in potentialUsers) {
      if ((user.name).toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(user);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: ((context, index) {
        var result = matchQuery[index];
        return UserInviteDisplay(user: result);
      }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Need to display the User with all the info
    List<User> matchQuery = [];
    for (var user in potentialUsers) {
      if ((user.name).toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(user);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: ((context, index) {
        var result = matchQuery[index];
        return UserInviteDisplay(user: result);
      }),
    );
  }
}
