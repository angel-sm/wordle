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

	public getGlues(guessWord: string, word: string) {
		const wordArray = word.split('')
		const guessWordArray = guessWord.split('')

		const glues = wordArray.map((letter, letterIndex) => {
			if (letter === guessWordArray[letterIndex]) {
				return {
					letter,
					value: 1,
				}
			}

			if (guessWordArray.includes(letter) && letterIndex !== guessWordArray.indexOf(letter)) {
				return {
					letter,
					value: 2,
				}
			}

			if (!guessWordArray.includes(letter)) {
				return {
					letter,
					value: 3,
				}
			}
		})

		return glues
	}

	public validateWin(glues: any): boolean {
		return glues.reduce((acc: any, glue: any) => acc && glue.value === 1, true)
	}
}
