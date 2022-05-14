import { AggregateRoot } from '../../../shared/domain/AggregateRoot'

export class WordPicker extends AggregateRoot {
	word: string

	constructor(word: string) {
		super()
		this.word = word
	}

	static fromPrimitives(plainData: { word: string }): WordPicker {
		return new WordPicker(plainData.word)
	}

	toPrimitives(): any {
		return {
			word: this.word,
		}
	}
}
