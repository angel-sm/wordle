import { WordPicker } from '../../../../../src/contexts/levita/WordPickers/domain/WordPicker'
import { WordPickerWordMother } from './WordPickerWordMother'
import { CreateWordPickerRequest } from '../../../../../src/contexts/levita/WordPickers/application/CreateWordPickerRequest'

export class WordPickerMother {
	static create(/* todo: agrega los campos de tu entidad */): WordPicker {
		return new WordPicker() // todo: agrega los campos de tu entidad
	}

	static fromRequest(request: CreateWordPickerRequest): WordPicker {
		return this.create() // todo: agrega los campos de tu entidad
	}

	static generate(): WordPicker {
		return this.create() // todo: agrega los campos de tu entidad
	}
}
