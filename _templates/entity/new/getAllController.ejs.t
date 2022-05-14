---
to: src/apps/levita/backend/controllers/<%= h.changeCase.pascal(h.inflection.pluralize(name)) %>/<%= h.changeCase.pascal(h.inflection.singularize(name)) %>GetAllController.ts
---
<%
 Singular = h.inflection.singularize(name)
 Plural = h.inflection.pluralize(name)
%>
import { Request, Response } from 'express';
import httpStatus from 'http-status';
import { LimitValueObject } from '../../../../../contexts/shared/domain/value-object/LimitValueObject';
import { PageValueObject } from '../../../../../contexts/shared/domain/value-object/PageValueObject';
import { Controller } from '../Controller';
import { <%= h.changeCase.pascal(Singular) %>Creator } from '../../../../../contexts/levita/<%= h.changeCase.pascal(Plural) %>/application/<%= h.changeCase.pascal(Singular) %>Creator';

type <%= h.changeCase.pascal(Singular) %>PostRequest = Request & {
  body: {};
};
export class <%= h.changeCase.pascal(Singular) %>GetAllController implements Controller {
  constructor(private <%= h.changeCase.camel(Singular) %>Creator: <%= h.changeCase.pascal(Singular) %>Creator) {}
  
  async map(input: any) {
      const inputInmutable = [ ...input ]
      return inputInmutable.map((entity) => {
        entity.id = entity._id
        delete entity._id
        return entity
      })
  }
  
  async run(req: <%= h.changeCase.pascal(Singular) %>PostRequest, res: Response) {
    const { page, limit } = req.params 
    
    try {
      const <%= h.changeCase.camel(Plural) %> = await this.<%= h.changeCase.camel(Singular) %>Creator.get<%= h.changeCase.pascal(Plural) %>({ 
        page: new PageValueObject(Number(page)), 
        limit: new LimitValueObject(Number(limit)) 
      });
      
      const <%= h.changeCase.camel(Plural) %>DTO = await this.map(<%= h.changeCase.camel(Plural) %>)
      
      res.status(httpStatus.OK).json(<%= h.changeCase.camel(Plural) %>DTO);
    } catch (error) {
      res.status(httpStatus.INTERNAL_SERVER_ERROR).send();
    }
  }
}

