import { GameRepository } from '../../../../../src/contexts/levita/Games/domain/GameRepository'
import { Game } from '../../../../../src/contexts/levita/Games/domain/Game'
import { GameId } from '../../../../../src/contexts/levita/shared/domain/Games/GameId'
import { Nullable } from '../../../../../src/contexts/shared/domain/Nullable'

export class GameRepositoryMock implements GameRepository {
	private mockSave = jest.fn()

	assertLastSavedGameIs(expected: Game): void {
		const mock = this.mockSave.mock
		const lastSavedGame = mock.calls[mock.calls.length - 1][0] as Game
		expect(lastSavedGame).toBeInstanceOf(Game)
	}

	async create(game: Game): Promise<void> {
		return this.mockSave(game)
	}

	async findOne(id: GameId): Promise<Nullable<Game>> {
		return null
	}

	async find(): Promise<Nullable<Game[]>> {
		return []
	}

	async deleteOne(id: GameId): Promise<void> {}

	async update(id: GameId, game: Game): Promise<void> {}
}
