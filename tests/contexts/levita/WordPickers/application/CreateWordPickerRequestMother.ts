import { CreateWordPickerRequest } from '../../../../../src/contexts/levita/WordPickers/application/CreateWordPickerRequest'
import { WordPickerWordMother } from '../domain/WordPickerWordMother'

export class CreateWordPickerRequestMother {
	static create(/* todo: agrega los campos de tu entidad */): CreateWordPickerRequest {
		return {
			/* todo: agrega los campos de tu entidad */
		}
	}

	static generate(): CreateWordPickerRequest {
		return this.create(/* todo: agrega los campos de tu entidad */)
	}
}
