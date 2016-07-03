part of dartabase.simple_server;

final Map serverRoutes={

  'listBodyParts':{'url':new UrlPattern(r'/listBodyParts'),'method':'POST','action': listBodyParts ,'async':true},
  'loadBodyPart':{'url':new UrlPattern(r'/loadBodyPart'),'method':'POST','action': loadBodyPart ,'async':true},
  'saveBodyPart':{'url':new UrlPattern(r'/saveBodyPart'),'method':'POST','action': saveBodyPart,'async':true },
  'deleteBodyPart':{'url':new UrlPattern(r'/deleteBodyPart'),'method':'POST','action': deleteBodyPart,'async':true }

};
