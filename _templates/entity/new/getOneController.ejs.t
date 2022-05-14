---
to: src/apps/levita/backend/controllers/<%= h.changeCase.pascal(h.inflection.pluralize(name)) %>/<%= h.changeCase.pascal(h.inflection.singularize(name)) %>GetOneController.ts
---
<%
 Singular = h.inflection.singularize(name)
 Plural = h.inflection.pluralize(name)
%>
import { Request, Response } from 'express';
import httpStatus from 'http-status';
import { <%= h.changeCase.pascal(Singular) %>Creator } from '../../../../../contexts/levita/<%= h.changeCase.pascal(Plural) %>/application/<%= h.changeCase.pascal(Singular) %>Creator';
import { <%= h.changeCase.pascal(Singular) %>Id } from '../../../../../contexts/levita/shared/domain/<%= h.changeCase.pascal(Plural) %>/<%= h.changeCase.pascal(Singular) %>Id';
import { Controller } from '../Controller';

type <%= h.changeCase.pascal(Singular) %>PostRequest = Request & {
  body: {};
};
export class <%= h.changeCase.pascal(Singular) %>GetOneController implements Controller {
  constructor(private <%= h.changeCase.camel(Singular) %>Creator: <%= h.changeCase.pascal(Singular) %>Creator) {}
   
  map(input: any) {
    const inmutableObject = {...input}
    inmutableObject.id = inmutableObject._id
    delete inmutableObject._id
    return inmutableObject
  }

  async run(req: <%= h.changeCase.pascal(Singular) %>PostRequest, res: Response) {
    const { id } = req.params
    try {
      const <%= h.changeCase.camel(Singular) %> = await this.<%= h.changeCase.camel(Singular) %>Creator.get<%= h.changeCase.pascal(Singular) %>(new <%= h.changeCase.pascal(Singular) %>Id(id));
      
      if(<%= h.changeCase.camel(Singular) %> === null){
        res.status(httpStatus.NOT_FOUND)
        return
      }
      const <%= h.changeCase.camel(Singular) %>DTO = await this.map(<%= h.changeCase.camel(Singular) %>)
      
      res.status( httpStatus.OK).json(<%= h.changeCase.camel(Singular) %>DTO);
    } catch (error) {
      res.status(httpStatus.INTERNAL_SERVER_ERROR).send();
    }
  }
}


