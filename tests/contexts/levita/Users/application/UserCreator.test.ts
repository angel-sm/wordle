import { UserCreator } from '../../../../../src/contexts/levita/Users/application/UserCreator'
import { UserMother } from '../domain/UserMother'
import { UserRepositoryMock } from '../__mocks__/UserRepositoryMock'
import { CreateUserRequestMother } from './CreateUserRequestMother'

let repository: UserRepositoryMock
let creator: UserCreator

beforeEach(() => {
	repository = new UserRepositoryMock()
	creator = new UserCreator(repository)
})

describe('UserCreator', () => {
	it('should create a valid User', async () => {
		const request = CreateUserRequestMother.generate()

		const User = UserMother.fromRequest(request)

		await creator.insertUser(request)

		repository.findOne(User.id)
	})
})
