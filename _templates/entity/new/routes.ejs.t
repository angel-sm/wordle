---
to: src/apps/levita/backend/routes/<%= h.changeCase.camel(h.inflection.pluralize(name)) %>.route.ts 
---
<%
 Singular = h.inflection.singularize(name)
 Plural = h.inflection.pluralize(name)
%>
import { Router, Request, Response } from 'express';
import container from '../dependency-injection';

export const register = (router: Router) => {

  const <%= h.changeCase.camel(Singular) %>GetOneController = container.get('Apps.levita.controllers.<%= h.changeCase.pascal(Singular) %>GetOneController');
  router.get('/<%= h.changeCase.camel(Plural) %>/:id', (req: Request, res: Response) => <%= h.changeCase.camel(Singular) %>GetOneController.run(req, res));

  const <%= h.changeCase.camel(Singular) %>GetAllController = container.get('Apps.levita.controllers.<%= h.changeCase.pascal(Singular) %>GetAllController');
  router.get('/<%= h.changeCase.camel(Plural) %>/page/:page/limit/:limit', (req: Request, res: Response) => <%= h.changeCase.camel(Singular) %>GetAllController.run(req, res));
  
  const <%= h.changeCase.camel(Singular) %>PostController = container.get('Apps.levita.controllers.<%= h.changeCase.pascal(Singular) %>PostController');
  router.post('/<%= h.changeCase.camel(Plural) %>', (req: Request, res: Response) => <%= h.changeCase.camel(Singular) %>PostController.run(req, res));

  const <%= h.changeCase.camel(Singular) %>PutController = container.get('Apps.levita.controllers.<%= h.changeCase.pascal(Singular) %>PutController');
  router.put('/<%= h.changeCase.camel(Plural) %>/:id', (req: Request, res: Response) => <%= h.changeCase.camel(Singular) %>PutController.run(req, res));

  const <%= h.changeCase.camel(Singular) %>DeleteController = container.get('Apps.levita.controllers.<%= h.changeCase.pascal(Singular) %>DeleteController');
  router.delete('/<%= h.changeCase.camel(Plural) %>/:id', (req: Request, res: Response) => <%= h.changeCase.camel(Singular) %>DeleteController.run(req, res));
};
