---
to: src/apps/levita/backend/controllers/<%= h.changeCase.pascal(h.inflection.pluralize(name)) %>/<%= h.changeCase.pascal(h.inflection.singularize(name)) %>DeleteController.ts
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
export class <%= h.changeCase.pascal(Singular) %>DeleteController implements Controller {
  constructor(private <%= h.changeCase.camel(Singular) %>Creator: <%= h.changeCase.pascal(Singular) %>Creator) {}
   
  async run(req: <%= h.changeCase.pascal(Singular) %>PostRequest, res: Response) {
    const { id } = req.params
    try {
      await this.<%= h.changeCase.camel(Singular) %>Creator.delete<%= h.changeCase.pascal(Singular) %>(new <%= h.changeCase.pascal(Singular) %>Id(id));
      res.status(httpStatus.OK).send();
    } catch (error) {
      res.status(httpStatus.INTERNAL_SERVER_ERROR).send();
    }
  }
}


