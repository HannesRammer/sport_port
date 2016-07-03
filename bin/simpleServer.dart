library dartabase.simple_server;

import "dart:io";
import 'dart:convert';

import 'package:dartabase_model/dartabase_model.dart';
import 'package:route/url_pattern.dart';
import 'package:routes/server.dart' as Routes;


import 'server_functions.dart';

part '../routes.dart';


/* A simple web server that responds to **ALL** GET and **POST** requests
 * Browse to it using http://localhost:8079  
 * Provides CORS headers, so can be accessed from any other page
 */
final String HOST = "127.0.0.1"; // eg: localhost

final num PORT = 8079;

main() async {
    Model.initiate("C:\\darttestproject\\sport_port");
    var server = await HttpServer.bind(HOST, PORT);
    var router = Routes.initRouter(server, serverRoutes);
    print("Listening for GET and POST on http://$HOST:$PORT");
}

void printError(error) => print(error);
