export interface WordPickerRepository {
	getLast(): Promise<string>
	updateGeneric(word: string): Promise<void>
}
