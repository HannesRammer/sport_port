// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code

// is governed by a BSD-style license that can be found in the LICENSE file.
@HtmlImport('main_app.html')
library sport_port.lib.main_app;

import 'dart:html';

import 'package:polymer_elements/paper_input.dart';
import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart';
import 'package:sport_port/db/body_parts.dart';

/// Uses [PaperInput]
@PolymerRegister('main-app')
class MainApp extends PolymerElement {


    /// Constructor used to create instance of MainApp.
    MainApp.created() : super.created();

    @property
    List colors = ["blue", "yellow", "green", "red"];
    @property
    List modelList = ["body_parts","body_parts","body_parts","body_parts"];

    void ready() {
        int counter = 0;
        for (String modelName in modelList) {
            UListElement menu = querySelector("ul");
            BodyParts bodyPartsContainer = new Element.tag("body-parts");
            LIElement liBodyParts = createLink(modelName,bodyPartsContainer,colors[counter]);
            BodyParts bodyParts = createContent(bodyPartsContainer,colors[counter]);
            menu.append(liBodyParts);
            querySelector("#project_content").append(bodyParts);

            if (counter == 3) {
                counter = 0;
            } else {
                counter++;
            }
        }
    }
    Element createLink(modelName,bodyPartsContainer,color){
        LIElement li = new LIElement();
        AnchorElement a = new AnchorElement(href: "#${modelName}");
        a.classes.add(color);
        a.classes.add("main-app");
        a.setInnerHtml(modelName);
        a.onClick.listen((MouseEvent event) {
            Element target = event.target;
            target.classes.toggle('active');
            bodyPartsContainer.classes.add("main-app");
            bodyPartsContainer.classes.toggle("hidden");
        });
        li.append(a);
        return li;
    }
    Element createContent(bodyPartsContainer, color){
        bodyPartsContainer.classes.toggle("hidden");
        bodyPartsContainer.set("state", "showAll");
        bodyPartsContainer.classes.add("main");
        bodyPartsContainer.classes.add("main-app");
        bodyPartsContainer.set("color", color);
        return bodyPartsContainer;
    }
}
