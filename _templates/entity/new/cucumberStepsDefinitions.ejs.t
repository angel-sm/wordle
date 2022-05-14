---
to: tests/apps/levita/backend/features/<%= h.changeCase.pascal(h.inflection.singularize(name)) %>/step_definitions/create.steps.ts
---
<%
 Singular = h.inflection.singularize(name)
 Plural = h.inflection.pluralize(name)
%>
import assert from 'assert';
import { AfterAll, BeforeAll, Given, Then } from 'cucumber';
import request from 'supertest';
import { LevitaBackendApp } from '../../../../../../../src/apps/levita/backend/LevitaBackendApp';

let _request: request.Test;
let application: LevitaBackendApp;
let _response: request.Response;

Given('I send a POST request to {string} with body:', (route: string, body: string) => {
  _request = request(application.httpServer).post(route).send(JSON.parse(body));
});

Then('the response status code should be {int}', async (status: number) => {
  _response = await _request.expect(status);
});

BeforeAll(async () => {
  application = new LevitaBackendApp();
  await application.start();
});

AfterAll(async () => {
  await application.stop();
});
