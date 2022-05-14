import { GameCreator } from '../../../../../src/contexts/levita/Games/application/GameCreator'
import { GameMother } from '../domain/GameMother'
import { GameRepositoryMock } from '../__mocks__/GameRepositoryMock'
import { CreateGameRequestMother } from './CreateGameRequestMother'

let repository: GameRepositoryMock
let creator: GameCreator

beforeEach(() => {
	repository = new GameRepositoryMock()
	creator = new GameCreator(repository)
})

describe('GameCreator', () => {
	it('should create a valid Game', async () => {
		const request = CreateGameRequestMother.generate()

		const Game = GameMother.fromRequest(request)

		await creator.insertGame(request)

		repository.findOne(Game.id)
	})
})
