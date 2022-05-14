import { AggregateRoot } from '../../../shared/domain/AggregateRoot'

export class Game extends AggregateRoot {
	constructor(/* todo: agrega los campos de tu entidad */) {
		super()
	}

	static fromPrimitives(): Game {
		return new Game()
	}

	toPrimitives(): any {
		return {}
	}

  public checkLetterPositions(guessWord: string, word: string) {
    
  }
}
