import container from '../../../../../../src/apps/levita/backend/dependency-injection'
import { GameRepository } from '../../../../../../src/contexts/levita/Games/domain/GameRepository'
import { EnvironmentArranger } from '../../../../shared/infrastructure/arranger/EnvironmentArranger'
import { GameMother } from '../../domain/GameMother'

const repository: GameRepository = container.get('Levita.Games.domain.GameRepository')
const environmentArranger: Promise<EnvironmentArranger> = container.get('Levita.EnvironmentArranger')

beforeEach(async () => {
	await (await environmentArranger).arrange()
})

afterAll(async () => {
	await (await environmentArranger).arrange()
	await (await environmentArranger).close()
})

describe('GameRepository', () => {
	describe('#save', () => {
		it('should save a Game', async () => {
			const game = GameMother.generate()

			await repository.create(game)
		})
	})
})
