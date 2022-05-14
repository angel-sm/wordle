---
to: tests/contexts/levita/<%= h.changeCase.pascal(h.inflection.pluralize(name)) %>/infrastructure/persistence/<%= h.changeCase.pascal(h.inflection.singularize(name)) %>Repository.test.ts
---
<%
 Singular = h.inflection.singularize(name)
 Plural = h.inflection.pluralize(name)
%>
import container from '../../../../../../src/apps/levita/backend/dependency-injection';
import { <%= h.changeCase.pascal(Singular) %>Repository } from '../../../../../../src/contexts/levita/<%= h.changeCase.pascal(Plural) %>/domain/<%= h.changeCase.pascal(Singular) %>Repository';
import { EnvironmentArranger } from '../../../../shared/infrastructure/arranger/EnvironmentArranger';
import { <%= h.changeCase.pascal(Singular) %>Mother } from '../../domain/<%= h.changeCase.pascal(Singular) %>Mother';

const repository: <%= h.changeCase.pascal(Singular) %>Repository = container.get('Levita.<%= h.changeCase.pascal(Plural) %>.domain.<%= h.changeCase.pascal(Singular) %>Repository');
const environmentArranger: Promise<EnvironmentArranger> = container.get('Levita.EnvironmentArranger');

beforeEach(async () => {
  await (await environmentArranger).arrange();
});

afterAll(async () => {
  await (await environmentArranger).arrange();
  await (await environmentArranger).close();
});

describe('<%= h.changeCase.pascal(Singular) %>Repository', () => {
  describe('#save', () => {
    it('should save a <%= h.changeCase.pascal(Singular) %>', async () => {
      const <%= h.changeCase.camel(Singular) %> = <%= h.changeCase.pascal(Singular) %>Mother.generate();

      await repository.create(<%= h.changeCase.camel(Singular) %>);
    });
  });
});
