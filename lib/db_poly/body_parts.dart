// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code

// is governed by a BSD-style license that can be found in the LICENSE file.
@HtmlImport('body_parts.html')
library sport_port.lib.body_parts;

import 'dart:html';
import 'dart:convert';

import 'package:polymer_elements/paper_input.dart';
import 'package:polymer_elements/paper_button.dart';
import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart';
import 'package:sport_port/db_poly/body_parts.dart';

/// Uses [PaperInput]
@PolymerRegister('body-parts')
class BodyParts extends PolymerElement {

    @Property(notify: true)
    Map bodyPartMap;
    @Property(notify: true)
    String state;
    @Property(notify: true)
    Map backupBodyPartMap;
    @Property(notify: true)
    String color;

    /// Constructor used to create instance.
    BodyParts.created() : super.created();


    @reflectable
    isShowAll(var currentState) {
        if (currentState == "showAll") {
            showAll();
        }
        return currentState == "showAll";
    }

    @reflectable
    showAll() {
        HttpRequest request = new HttpRequest(); // create a new XHR
        // add an event handler that is called when the request finishes
        request.onReadyStateChange.listen((_) {
            if (request.readyState == HttpRequest.DONE && (request.status == 200 || request.status == 0)) {
                print(request.responseText); // output the response from the server
                List bodyParts = JSON.decode(request.responseText);
                for (Map bodyPart in bodyParts) {
                    BodyParts bodyPartElement = new Element.tag("body-parts");
                    bodyPartElement.set("bodyPartMap", bodyPart);
                    bodyPartElement.set("state", "show");
                    querySelector("#body_parts_list").append(bodyPartElement);
                }
            }
        });
        var url = "http://127.0.0.1:8079/listBodyParts";
        request.open("POST", url);
        request.send(); // perform the async POST
    }

    @reflectable
    isShow(var currentState) {
        if (currentState == "show") {
            show();
        }
        return currentState == "show";
    }

    @reflectable
    show() {
        HttpRequest request = new HttpRequest(); // create a new XHR
        request.onReadyStateChange.listen((_) {
            if (request.readyState == HttpRequest.DONE && (request.status == 200 || request.status == 0)) {
                print(request.responseText); // output the response from the server
            }
        });
        var url = "http://127.0.0.1:8079/loadBodyPart?body_part_id=${bodyPartMap["id"]}";
        request.open("POST", url);
        request.send(); // perform the async POST
    }

    @reflectable
    isEdit(var currentState) {
        return currentState == "edit";
    }

    @reflectable
    edit(Event event, [_]) {
        set("backupBodyPartMap", JSON.decode(JSON.encode(bodyPartMap)));
        set("state", "edit");
    }

    @reflectable
    cancel(Event event, [_]) {
        set("bodyPartMap", JSON.decode(JSON.encode(backupBodyPartMap)));
        set("backupBodyPartMap", {});
        set("state", "show");
    }

    @reflectable
    save(Event event, [_]) {
        HttpRequest request = new HttpRequest(); // create a new XHR
        // add an event handler that is called when the request finishes
        request.onReadyStateChange.listen((_) {
            if (request.readyState == HttpRequest.DONE && (request.status == 200 || request.status == 0)) {
                print(request.responseText); // output the response from the server
                Map bodyPart = JSON.decode(request.responseText);
                set("state", "show");
            }
        });
        var url = "http://127.0.0.1:8079/saveBodyPart?body_part=${JSON.encode({"id":bodyPartMap["id"], "name":bodyPartMap["name"]})}";

        request.open("POST", url);
        request.send(); // perform the async POST
    }

    @reflectable
    delete(Event event, [_]) {
        HttpRequest request = new HttpRequest(); // create a new XHR
        // add an event handler that is called when the request finishes
        request.onReadyStateChange.listen((_) {
            if (request.readyState == HttpRequest.DONE && (request.status == 200 || request.status == 0)) {
                // data saved OK.
                print(request.responseText); // output the response from the server

            }
        });
        var url = "http://127.0.0.1:8079/deleteBodyPart?id=${bodyPartMap["id"]}";

        request.open("POST", url);
        request.send(); // perform the async POST
    }


// Optional lifecycle methods - uncomment if needed.

//  /// Called when an instance of main-app is inserted into the DOM.
  attached() {
      customStyle['--my-toolbar-color'] = color;
      updateStyles();
    super.attached();
  }

//  /// Called when an instance of main-app is removed from the DOM.
//  detached() {
//    super.detached();
//  }

//  /// Called when an attribute (such as a class) of an instance of
//  /// main-app is added, changed, or removed.
  attributeChanged(String name, String oldValue, String newValue) {

    super.attributeChanged(name, oldValue, newValue);
  }

//  /// Called when main-app has been fully prepared (Shadow DOM created,
//  /// property observers set up, event listeners attached).
//  ready() {
//  }
}
