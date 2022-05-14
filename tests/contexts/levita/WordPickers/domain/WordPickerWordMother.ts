import { WordMother } from '../../../shared/domain/WordMother'

export class WordPickerWordMother {
	static create(value: string): string {
		return value
	}

	static generate(): string {
		return this.create(WordMother.generate())
	}
}
