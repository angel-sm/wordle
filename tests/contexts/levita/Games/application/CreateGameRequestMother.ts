import { WordUserRequest } from '../../../../../src/Contexts/levita/Games/application/WordUserRequest'
import { GameWordMother } from '../domain/GameWordMother'

export class CreateGameRequestMother {
	static create(/* todo: agrega los campos de tu entidad */): WordUserRequest {
		return {
			/* todo: agrega los campos de tu entidad */
		}
	}

	static generate(): WordUserRequest {
		return this.create(/* todo: agrega los campos de tu entidad */)
	}
}
