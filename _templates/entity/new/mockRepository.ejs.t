---
to: tests/contexts/levita/<%= h.changeCase.pascal(Plural = h.inflection.pluralize(name)) %>/__mocks__/<%= h.changeCase.pascal(h.inflection.singularize(name)) %>RepositoryMock.ts
---
<%
 Singular = h.inflection.singularize(name)
 Plural = h.inflection.pluralize(name)
%>
import { <%= h.changeCase.pascal(Singular) %>Repository } from '../../../../../src/contexts/levita/<%= h.changeCase.pascal(Plural) %>/domain/<%= h.changeCase.pascal(Singular) %>Repository';
import { <%= h.changeCase.pascal(Singular) %> } from '../../../../../src/contexts/levita/<%= h.changeCase.pascal(Plural) %>/domain/<%= h.changeCase.pascal(Singular) %>';
import { <%= h.changeCase.pascal(Singular) %>Id } from '../../../../../src/contexts/levita/shared/domain/<%= h.changeCase.pascal(Plural) %>/<%= h.changeCase.pascal(Singular) %>Id';
import { Nullable } from '../../../../../src/contexts/shared/domain/Nullable';

export class <%= h.changeCase.pascal(Singular) %>RepositoryMock implements <%= h.changeCase.pascal(Singular) %>Repository {
  private mockSave = jest.fn();

  assertLastSaved<%= h.changeCase.pascal(Singular) %>Is(expected: <%= h.changeCase.pascal(Singular) %>): void {
    const mock = this.mockSave.mock;
    const lastSaved<%= h.changeCase.pascal(Singular) %> = mock.calls[mock.calls.length - 1][0] as <%= h.changeCase.pascal(Singular) %>;
    expect(lastSaved<%= h.changeCase.pascal(Singular) %>).toBeInstanceOf(<%= h.changeCase.pascal(Singular) %>);
  }

  async create(<%= h.changeCase.camel(Singular) %>: <%= h.changeCase.pascal(Singular) %>): Promise<void> {
    return this.mockSave(<%= h.changeCase.camel(Singular) %>);
  }

  async findOne(id: <%= h.changeCase.pascal(Singular) %>Id): Promise<Nullable<<%= h.changeCase.pascal(Singular) %>>> {
    return null
  }

  async find(): Promise<Nullable<<%= h.changeCase.pascal(Singular) %>[]>> {
    return []
  }

  async deleteOne(id: <%= h.changeCase.pascal(Singular) %>Id): Promise<void> {
  }

  async update(id: <%= h.changeCase.pascal(Singular) %>Id, <%= h.changeCase.camel(Singular) %>: <%= h.changeCase.pascal(Singular) %>): Promise<void> {
  }

}
