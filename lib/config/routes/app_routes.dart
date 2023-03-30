// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:serve_to_be_free/screens/dashboard.dart';
import 'package:serve_to_be_free/screens/groups.dart';
import 'package:serve_to_be_free/screens/menu.dart';
import 'package:serve_to_be_free/screens/messages.dart';
import 'package:serve_to_be_free/screens/profile.dart';
import 'package:serve_to_be_free/screens/projects.dart';
import 'package:serve_to_be_free/screens/sub_screens/menu_subpages/how_it_works.dart';
import 'package:serve_to_be_free/screens/tasks.dart';
import '../../screens/sub_screens/menu_subpages/about_page.dart';
import '../../screens/sub_screens/menu_subpages/account_details.dart';
import '../../screens/sub_screens/menu_subpages/my_account.dart';
import '../../screens/sub_screens/projects_subpages/create_a_project/project_details_form.dart';
import 'package:serve_to_be_free/screens/sub_screens/projects_subpages/create_a_project/create_a_project.dart';
import 'package:serve_to_be_free/screens/sub_screens/projects_subpages/lead_a_project.dart';
import 'package:serve_to_be_free/screens/sub_screens/projects_subpages/project_scr.dart';

import 'package:serve_to_be_free/screens/sub_screens/projects_subpages/sponsor_a_project.dart';
import 'package:serve_to_be_free/widgets/ui/my_scaffold.dart';

import '../../screens/sub_screens/projects_subpages/find_a_project.dart';
import '../../screens/sub_screens/projects_subpages/my_projects.dart';

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
                builder: (context, state) => const CreateAProject(
                    '/projects/createprojects/projectdetailsform'),
                routes: [
                  GoRoute(
                      path: 'projectdetailsform',
                      builder: (context, state) => ProjectDetailsForm())
                ]),
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
            GoRoute(
                path: 'projectDetails',
                builder: (context, state) => ProjectDetailsPage(
                    projectName: 'projectName', numOfMembers: 9))
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
            child: const MenuPage(
              myProfilePath: '/menu/myprofile',
              myAccountPath: '/menu/myaccount',
              //favoritesPath: '/menu/createprojects',
              howItWorksPath: '/menu/howitworks',
              aboutPath: '/menu/aboutservetobefree',
            ),
          ),
          routes: [
            GoRoute(
              path: 'myprofile',
              builder: (context, state) => Profile(/*label: 'B'*/),
            ),
            GoRoute(
              path: 'myaccount',
              builder: (context, state) => const MyAccount(),
              // routes: [
              //   GoRoute(
              //       path: 'accountdetails',
              //       builder: (context, state) => AccountDetailsPage())
              // ]
            ),
            GoRoute(
              path: 'howitworks',
              builder: (context, state) => const HowItWorksPage(/*label: 'B'*/),
            ),
            GoRoute(
              path: 'aboutservetobefree',
              builder: (context, state) => const AboutPage(/*label: 'B'*/),
            ),
          ],
        ),
      ],
    ),
  ],
);

// use like this:
// MaterialApp.router(routerConfig: goRouter, ...)