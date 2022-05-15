import { UserRepository } from '../../../../../src/contexts/levita/Users/domain/UserRepository'
import { User } from '../../../../../src/contexts/levita/Users/domain/User'
import { UserId } from '../../../../../src/contexts/levita/shared/domain/Users/UserId'
import { Nullable } from '../../../../../src/contexts/shared/domain/Nullable'

export class UserRepositoryMock implements UserRepository {
	private mockSave = jest.fn()

	assertLastSavedUserIs(expected: User): void {
		const mock = this.mockSave.mock
		const lastSavedUser = mock.calls[mock.calls.length - 1][0] as User
		expect(lastSavedUser).toBeInstanceOf(User)
	}

	async create(user: User): Promise<void> {
		return this.mockSave(user)
	}

	async findOne(id: UserId): Promise<Nullable<User>> {
		return null
	}

	async find(): Promise<Nullable<User[]>> {
		return []
	}

	async deleteOne(id: UserId): Promise<void> {}

	async update(id: UserId, user: User): Promise<void> {}
}
