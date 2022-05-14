---
to: tests/contexts/levita/<%= h.changeCase.pascal(h.inflection.pluralize(name)) %>/application/<%= h.changeCase.pascal(Singular) %>Creator.test.ts
---
<%
 Singular = h.inflection.singularize(name)
 Plural = h.inflection.pluralize(name)
%>
import { <%= h.changeCase.pascal(Singular) %>Creator } from '../../../../../src/contexts/levita/<%= h.changeCase.pascal(Plural) %>/application/<%= h.changeCase.pascal(Singular) %>Creator';
import { <%= h.changeCase.pascal(Singular) %>Mother } from '../domain/<%= h.changeCase.pascal(Singular) %>Mother';
import { <%= h.changeCase.pascal(Singular) %>RepositoryMock } from '../__mocks__/<%= h.changeCase.pascal(Singular) %>RepositoryMock';
import { Create<%= h.changeCase.pascal(Singular) %>RequestMother } from './Create<%= h.changeCase.pascal(Singular) %>RequestMother';

let repository: <%= h.changeCase.pascal(Singular) %>RepositoryMock;
let creator: <%= h.changeCase.pascal(Singular) %>Creator;

beforeEach(() => {
  repository = new <%= h.changeCase.pascal(Singular) %>RepositoryMock();
  creator = new <%= h.changeCase.pascal(Singular) %>Creator(repository);
});

describe('<%= h.changeCase.pascal(Singular) %>Creator', () => {
  it('should create a valid <%= h.changeCase.pascal(Singular) %>', async () => {
    const request = Create<%= h.changeCase.pascal(Singular) %>RequestMother.generate();

    const <%= h.changeCase.pascal(Singular) %> = <%= h.changeCase.pascal(Singular) %>Mother.fromRequest(request);

    await creator.insert<%= h.changeCase.pascal(Singular) %>(request);

    repository.findOne(<%= h.changeCase.pascal(Singular) %>.id);
  });
});