import { User } from '../../../../../src/contexts/levita/Users/domain/User'
import { UserWordMother } from './UserWordMother'
import { CreateUserRequest } from '../../../../../src/Contexts/levita/Users/application/AuthUserRequest'

export class UserMother {
	static create(/* todo: agrega los campos de tu entidad */): User {
		return new User() // todo: agrega los campos de tu entidad
	}

	static fromRequest(request: CreateUserRequest): User {
		return this.create() // todo: agrega los campos de tu entidad
	}

	static generate(): User {
		return this.create() // todo: agrega los campos de tu entidad
	}
}
