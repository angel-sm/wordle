---
to: src/apps/levita/backend/controllers/<%= h.changeCase.pascal(h.inflection.pluralize(name)) %>/<%= h.changeCase.pascal(h.inflection.singularize(name)) %>PutController.ts
---
<%
 Singular = h.inflection.singularize(name)
 Plural = h.inflection.pluralize(name)
%>
import { Request, Response } from 'express';
import httpStatus from 'http-status';
import { <%= h.changeCase.pascal(Singular) %>Creator } from '../../../../../contexts/levita/<%= h.changeCase.pascal(Plural) %>/application/<%= h.changeCase.pascal(Singular) %>Creator';
import { Controller } from '../Controller';

type <%= h.changeCase.pascal(Singular) %>PutRequest = Request & {
  body: {
    
  };
};
export class <%= h.changeCase.pascal(Singular) %>PutController implements Controller {
  constructor(private <%= h.changeCase.camel(Singular) %>Creator: <%= h.changeCase.pascal(Singular) %>Creator) {}

  async run(req: <%= h.changeCase.pascal(Singular) %>PutRequest, res: Response) {
    try {
      const {  } = req.body;
      const { id } = req.params
      await this.<%= h.changeCase.camel(Singular) %>Creator.update<%= h.changeCase.pascal(Singular) %>({ id });
      res.status(httpStatus.OK).send();
    } catch (error) {
      res.status(httpStatus.INTERNAL_SERVER_ERROR).send();
    }
  }
}
