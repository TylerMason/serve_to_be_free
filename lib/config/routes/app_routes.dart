import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:serve_to_be_free/screens/dashboard.dart';
import 'package:serve_to_be_free/screens/groups.dart';
import 'package:serve_to_be_free/screens/menu.dart';
import 'package:serve_to_be_free/screens/messages.dart';
import 'package:serve_to_be_free/screens/projects.dart';
import 'package:serve_to_be_free/screens/tasks.dart';
import 'package:serve_to_be_free/sub_pages/projects_subpages/create_a_project/create_a_project.dart';
import 'package:serve_to_be_free/sub_pages/projects_subpages/lead_a_project.dart';

import 'package:serve_to_be_free/sub_pages/projects_subpages/sponsor_a_project.dart';
import 'package:serve_to_be_free/widgets/ui/my_scaffold.dart';

import '../../sub_pages/projects_subpages/find_a_project.dart';
import '../../sub_pages/projects_subpages/my_projects.dart';

// class AppRouter {
//   // all the route paths. So that we can access them easily  across the app
//   static const root = '/';
//   static const allProjects = '/projects';
//   static const allGroups = '/groups';
//   static const myTasks = '/mytasks';
//   static const myMessages = '/mymessages';
//   static const menu = '/menu';

//   // or singleUser? for use on others? Or Profile?
//   static const myProfile = '/myprofile';

//   // static const howItWorks = '/howitworks';
//   // static const settings = '/settings';
//   // static const splashScreen = '/splashscreen';

//   //static const singleArticleWithParams = '/article/:id';
//   // get route name with parameters, here [id] is optional because we need [:id] to define path on [_singleArticleWithParams]
//   //static singleArticleWithParams([String? id]) => '/article/${id ?? ':id'}';

//   /// private static methods that are accessible only in this class and not from outside
//   static Widget _appPage(BuildContext context, GoRouterState state) =>
//       const DashboardPage();
//   static Widget _allProjectsPageRouteBuilder(
//           BuildContext context, GoRouterState state) =>
//       const ProjectsPage();
//   static Widget _allGroupsPageRouteBuilder(
//           BuildContext context, GoRouterState state) =>
//       const GroupsPage();
//   static Widget _myTasksPageRouteBuilder(
//           BuildContext context, GoRouterState state) =>
//       const TasksPage();
//   static Widget _myMessagesPageRouteBuilder(
//           BuildContext context, GoRouterState state) =>
//       const MessagesPage();
//   static Widget _menuPageRouteBuilder(
//           BuildContext context, GoRouterState state) =>
//       const GroupsPage();
//   // static Widget _singleBlog(BuildContext context, GoRouterState state) =>
//   //     SingleArticle(blog: state.extra as Blog);
//   // static Widget _singleArticleWithParams(
//   //         BuildContext context, GoRouterState state) =>
//   //     SingleArticleWithParams(id: state.params["id"]!);
//   //static Widget errorWidget(BuildContext context, GoRouterState state) =>

//   /// use this in [MaterialApp.router]
//   static final GoRouter _router = GoRouter(
//     //initialLocation: root,
//     routes: <GoRoute>[
//       GoRoute(path: root, builder: _appPage),
//       GoRoute(path: allProjects, builder: _allProjectsPageRouteBuilder),
//       GoRoute(path: allGroups, builder: _allGroupsPageRouteBuilder),
//       GoRoute(path: myTasks, builder: _myTasksPageRouteBuilder),
//       GoRoute(path: myMessages, builder: _myMessagesPageRouteBuilder),
//       GoRoute(path: menu, builder: _menuPageRouteBuilder),
//     ],

//     //errorBuilder: errorWidget,
//   );

//   static GoRouter get router => _router;
// }

// private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

// the one and only GoRouter instance
final goRouter = GoRouter(
  initialLocation: '/dashboard',
  navigatorKey: _rootNavigatorKey,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        /*
        We need to use this scaffold to maintain our Bottom Nav and then wrap
        the other widgets with a normal scaffold to specify the appbar header.
        */
        return MyScaffold(child: child);
      },
      routes: [
        GoRoute(
          path: '/dashboard',
          pageBuilder: (context, state) => NoTransitionPage(
            child:
                const DashboardPage(/*label: 'A', detailsPath: '/a/details'*/),
          ),
          // routes: [
          //   GoRoute(
          //     path: 'details',
          //     builder: (context, state) => const DetailsScreen(label: 'A'),
          //   ),
          // ],
        ),
        GoRoute(
          path: '/projects',
          pageBuilder: (context, state) => NoTransitionPage(
              // eventually we add a way to see all projects from a different profile.
              child: const ProjectsPage(
            myProjectsPath: '/projects/myprojects',
            findProjectsPath: '/projects/findprojects',
            createProjectsPath: '/projects/createprojects',
            leadProjectsPath: '/projects/leadprojects',
            sponsorProjectsPath: '/projects/sponsorprojects',
          )),
          routes: [
            GoRoute(
              path: 'findprojects',
              builder: (context, state) => const FindAProject(/*label: 'B'*/),
            ),
            GoRoute(
              path: 'createprojects',
              builder: (context, state) => const CreateAProject(/*label: 'B'*/),
            ),
            GoRoute(
              path: 'leadprojects',
              builder: (context, state) => const LeadAProject(/*label: 'B'*/),
            ),
            GoRoute(
              path: 'sponsorprojects',
              builder: (context, state) =>
                  const SponsorAProject(/*label: 'B'*/),
            ),
            GoRoute(
              path: 'myprojects',
              builder: (context, state) => const MyProjects(/*label: 'B'*/),
            ),
          ],
        ),
        GoRoute(
          path: '/groups',
          pageBuilder: (context, state) => NoTransitionPage(
            child: const GroupsPage(/*label: 'B', detailsPath: '/b/details'*/),
          ),
          // routes: [
          //   GoRoute(
          //     path: 'details',
          //     builder: (context, state) => const DetailsScreen(label: 'B'),
          //   ),
          // ],
        ),
        GoRoute(
          path: '/mytasks',
          pageBuilder: (context, state) => NoTransitionPage(
            child: const TasksPage(/*label: 'B', detailsPath: '/b/details'*/),
          ),
          // routes: [
          //   GoRoute(
          //     path: 'details',
          //     builder: (context, state) => const DetailsScreen(label: 'B'),
          //   ),
          // ],
        ),
        GoRoute(
          path: '/mymessages',
          pageBuilder: (context, state) => NoTransitionPage(
            child:
                const MessagesPage(/*label: 'B', detailsPath: '/b/details'*/),
          ),
          // routes: [
          //   GoRoute(
          //     path: 'details',
          //     builder: (context, state) => const DetailsScreen(label: 'B'),
          //   ),
          // ],
        ),
        GoRoute(
          path: '/menu',
          pageBuilder: (context, state) => NoTransitionPage(
            child: const MenuPage(/*label: 'B', detailsPath: '/b/details'*/),
          ),
          // routes: [
          //   GoRoute(
          //     path: 'details',
          //     builder: (context, state) => const DetailsScreen(label: 'B'),
          //   ),
          // ],
        ),
      ],
    ),
  ],
);

// use like this:
// MaterialApp.router(routerConfig: goRouter, ...)