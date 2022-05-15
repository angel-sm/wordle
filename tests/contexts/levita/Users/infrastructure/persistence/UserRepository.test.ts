import container from '../../../../../../src/apps/levita/backend/dependency-injection'
import { UserRepository } from '../../../../../../src/contexts/levita/Users/domain/UserRepository'
import { EnvironmentArranger } from '../../../../shared/infrastructure/arranger/EnvironmentArranger'
import { UserMother } from '../../domain/UserMother'

const repository: UserRepository = container.get('Levita.Users.domain.UserRepository')
const environmentArranger: Promise<EnvironmentArranger> = container.get('Levita.EnvironmentArranger')

beforeEach(async () => {
	await (await environmentArranger).arrange()
})

afterAll(async () => {
	await (await environmentArranger).arrange()
	await (await environmentArranger).close()
})

describe('UserRepository', () => {
	describe('#save', () => {
		it('should save a User', async () => {
			const user = UserMother.generate()

			await repository.create(user)
		})
	})
})
