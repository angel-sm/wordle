---
to: tests/contexts/levita/<%= h.changeCase.pascal(h.inflection.pluralize(name)) %>/domain/<%= h.changeCase.pascal(h.inflection.singularize(name)) %>WordMother.ts
---
<%
 Singular = h.inflection.singularize(name)
 Plural = h.inflection.pluralize(name)
%>
import { WordMother } from '../../../shared/domain/WordMother';

export class <%= h.changeCase.pascal(Singular) %>WordMother {
  static create(value: string): string {
    return value;
  }

  static generate(): string {
    return this.create(WordMother.generate());
  }
}
