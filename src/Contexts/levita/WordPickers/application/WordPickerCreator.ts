import { WordPickerRepository } from '../domain/WordPickerRepository'

export class WordPickerCreator {
	private repository: WordPickerRepository

	constructor(repository: WordPickerRepository) {
		this.repository = repository
	}

	async getWordPicker(): Promise<string> {
		return (await this.repository.getLast()).word
	}

	async updateGeneric(word: string): Promise<void> {
		return this.repository.updateGeneric(word)
	}
}
