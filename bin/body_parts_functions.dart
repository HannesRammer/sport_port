part of dartabase.server_function;

listBodyParts(Map params, HttpResponse res) async {
    String text;
    List <BodyParts> bodyParts = await new BodyParts().findAll();
    List <Map> encodableBodyParts = [];
    if (!bodyParts.isEmpty) {
        for (BodyParts bodyPart in bodyParts) {
            print("found ${await bodyPart.toJson()} bodyParts");
            encodableBodyParts.add(await bodyPart.toJson());
        }
        text = JSON.encode(encodableBodyParts);
    } else {
        String text = JSON.encode({"no bodyParts found":""});
        print(text);
    }
    Routes.closeResWith(res, text);
}

loadBodyPart(Map params, HttpResponse res) async {
    String text;
    BodyParts bodyPart = await new BodyParts().findById(params["body_part_id"]);
    if (bodyPart != null) {
        print("found ${await bodyPart.toJson()} bodyPart");
        text = JSON.encode(await bodyPart.toJson());
    } else {
        String text = JSON.encode({"no bodyPart found for body_part_id ${params["body_part_id"]}":""});
        print(text);
    }
    Routes.closeResWith(res, text);
}

saveBodyPart(Map params, HttpResponse res) async {
    String text;
    var cleanJSON = JSON.decode(params["body_part"].replaceAll('%5C', '\\').replaceAll('%7B', '{').replaceAll('%22', '"')
            .replaceAll('%20', ' ').replaceAll('%7D', '}').replaceAll('%5B', '[')
            .replaceAll('%5D', ']'));
    BodyParts bodyPart = await new BodyParts().findById(cleanJSON["id"]);

    if (bodyPart != null) {
        bodyPart.name = cleanJSON["name"];
        var response = await bodyPart.save();
        if (response == "created" || response == "updated") {
            print("found ${await bodyPart.toJson()} bodyPart");
            text = JSON.encode(await bodyPart.toJson());
        } else {
            String text = JSON.encode({"no bodyPart found for body_part_id ${cleanJSON["id"]}":""});
            print(text);
        }
        Routes.closeResWith(res, text);
    }
}

deleteBodyPart(Map params, HttpResponse res) async {
    String text;
    BodyParts bodyPart = await new BodyParts().findById(params["body_part_id"]);
    if (bodyPart != null) {
        print("removing ${await bodyPart.toJson()} bodyPart");
        await bodyPart.delete();
        text = JSON.encode(await bodyPart.toJson());
    } else {
        String text = JSON.encode({"no bodyPart found for body_part_id ${params["body_part_id"]}":""});
        print(text);
    }
    Routes.closeResWith(res, text);
}
