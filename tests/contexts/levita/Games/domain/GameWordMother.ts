import { WordMother } from '../../../shared/domain/WordMother'

export class GameWordMother {
	static create(value: string): string {
		return value
	}

	static generate(): string {
		return this.create(WordMother.generate())
	}
}
