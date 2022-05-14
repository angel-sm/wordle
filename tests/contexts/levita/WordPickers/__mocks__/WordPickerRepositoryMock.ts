import { WordPickerRepository } from '../../../../../src/contexts/levita/WordPickers/domain/WordPickerRepository'
import { WordPicker } from '../../../../../src/contexts/levita/WordPickers/domain/WordPicker'
import { WordPickerId } from '../../../../../src/contexts/levita/shared/domain/WordPickers/WordPickerId'
import { Nullable } from '../../../../../src/contexts/shared/domain/Nullable'

export class WordPickerRepositoryMock implements WordPickerRepository {
	private mockSave = jest.fn()

	assertLastSavedWordPickerIs(expected: WordPicker): void {
		const mock = this.mockSave.mock
		const lastSavedWordPicker = mock.calls[mock.calls.length - 1][0] as WordPicker
		expect(lastSavedWordPicker).toBeInstanceOf(WordPicker)
	}

	async create(wordPicker: WordPicker): Promise<void> {
		return this.mockSave(wordPicker)
	}

	async findOne(id: WordPickerId): Promise<Nullable<WordPicker>> {
		return null
	}

	async find(): Promise<Nullable<WordPicker[]>> {
		return []
	}

	async deleteOne(id: WordPickerId): Promise<void> {}

	async update(id: WordPickerId, wordPicker: WordPicker): Promise<void> {}
}
