import { Game } from '../../../../../src/contexts/levita/Games/domain/Game'
import { GameWordMother } from './GameWordMother'
import { CreateGameRequest } from '../../../../../src/Contexts/levita/Games/application/WordUserRequest'

export class GameMother {
	static create(/* todo: agrega los campos de tu entidad */): Game {
		return new Game() // todo: agrega los campos de tu entidad
	}

	static fromRequest(request: CreateGameRequest): Game {
		return this.create() // todo: agrega los campos de tu entidad
	}

	static generate(): Game {
		return this.create() // todo: agrega los campos de tu entidad
	}
}
