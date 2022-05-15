import { WordPickerRepository } from 'Contexts/levita/WordPickers/domain/WordPickerRepository'
import { GameRepository } from '../domain/GameRepository'
import { WordUserRequest } from './WordUserRequest'
import { Game } from '../domain/Game'

export class GameCreator {
	private gameRepository: GameRepository
	private wordPickerRepository: WordPickerRepository

	constructor(repository: GameRepository, wordPickerRepository: WordPickerRepository) {
		this.gameRepository = repository
		this.wordPickerRepository = wordPickerRepository
	}

	async play(request: WordUserRequest): Promise<void> {
		const { word, user } = request

		await this.gameRepository.setTrie(user._id)

		const guessWord = await this.wordPickerRepository.getLast()
		const glues = new Game().getGlues(guessWord.word, word)

		const isGuessWord = new Game().validateWin(glues)

		if (isGuessWord) {
			await this.gameRepository.setWinn(user._id)
			await this.wordPickerRepository.guessWord(word)
		}

		console.log('🚀 ~ file: GameCreator.ts ~ line 24 ~ GameCreator ~ play ~ isGuessWord', isGuessWord)
		console.log('🚀 ~ file: GameCreator.ts ~ line 16 ~ GameCreator ~ play ~ word', glues)
	}
}
