import { UserRepository } from '../domain/UserRepository'
import { AuthUserRequest } from './AuthUserRequest'
import { JWT } from '../../shared/infrastructure/jwt/JWT'
import { User } from '../domain/User'

export class UserCreator {
	private repository: UserRepository

	constructor(repository: UserRepository) {
		this.repository = repository
	}

	async auth(request: AuthUserRequest) {
		let userRetrieve = (await this.repository.findOne(request.email)) || null

		let jwt = ''

		if (!userRetrieve) {
			this.repository.save(new User(request.email, request.password))
			userRetrieve = (await this.repository.findOne(request.email)) || null
		}

		if (!(userRetrieve?.password === request.password)) {
			throw new Error('Invalid credentials')
		}

		jwt = new JWT().sign({ ...userRetrieve })

		return jwt
	}
}
