import { WordPickerCreator } from '../../../../../src/contexts/levita/WordPickers/application/WordPickerCreator'
import { WordPickerMother } from '../domain/WordPickerMother'
import { WordPickerRepositoryMock } from '../__mocks__/WordPickerRepositoryMock'
import { CreateWordPickerRequestMother } from './CreateWordPickerRequestMother'

let repository: WordPickerRepositoryMock
let creator: WordPickerCreator

beforeEach(() => {
	repository = new WordPickerRepositoryMock()
	creator = new WordPickerCreator(repository)
})

describe('WordPickerCreator', () => {
	it('should create a valid WordPicker', async () => {
		const request = CreateWordPickerRequestMother.generate()

		const WordPicker = WordPickerMother.fromRequest(request)

		await creator.insertWordPicker(request)

		repository.findOne(WordPicker.id)
	})
})
