import { WordPickerRepository } from 'Contexts/levita/WordPickers/domain/WordPickerRepository'
import { GameRepository } from '../domain/GameRepository'
import { WordUserRequest } from './WordUserRequest'
import { Game } from '../domain/Game'

export class GameCreator {
	// private gameRepository: GameRepository;
	private wordPickerRepository: WordPickerRepository

	constructor(repository: GameRepository, wordPickerRepository: WordPickerRepository) {
		// this.gameRepository = repository;
		this.wordPickerRepository = wordPickerRepository
	}

	async play(request: WordUserRequest): Promise<void> {
		const { word } = request

		const guessWord = await this.wordPickerRepository.getLast()

		const gmResults = new Game().checkLetterPositions(guessWord, word)

		console.log('🚀 ~ file: GameCreator.ts ~ line 16 ~ GameCreator ~ play ~ word', gmResults)
	}
}
