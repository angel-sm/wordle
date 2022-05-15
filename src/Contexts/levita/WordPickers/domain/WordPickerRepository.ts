import { WordPicker } from './WordPicker'

export interface WordPickerRepository {
	getLast(): Promise<WordPicker>
	updateGeneric(word: string): Promise<void>
	guessWord(word: string): Promise<void>
}
