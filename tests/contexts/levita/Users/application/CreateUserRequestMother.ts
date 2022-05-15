import { CreateUserRequest } from '../../../../../src/Contexts/levita/Users/application/AuthUserRequest'
import { UserWordMother } from '../domain/UserWordMother'

export class CreateUserRequestMother {
	static create(/* todo: agrega los campos de tu entidad */): CreateUserRequest {
		return {
			/* todo: agrega los campos de tu entidad */
		}
	}

	static generate(): CreateUserRequest {
		return this.create(/* todo: agrega los campos de tu entidad */)
	}
}
