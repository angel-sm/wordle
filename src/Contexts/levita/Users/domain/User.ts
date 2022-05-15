import { AggregateRoot } from '../../../shared/domain/AggregateRoot'

export class User extends AggregateRoot {
	public email: string
	readonly password: string

	constructor(email: string, password: string) {
		super()
		this.email = email
		this.password = password
	}

	static fromPrimitives(plainData: { email: string; password: string }): User {
		return new User(plainData.email, plainData.password)
	}

	toPrimitives(): any {
		return {
			email: this.email,
			password: this.password,
		}
	}
}
