export interface GameRepository {
	setTrie(userId: string): Promise<void>
	setWinn(userId: string): Promise<void>
}
