import { MongoRepository } from '../../../../shared/infrastructure/persistence/mongo/MongoRepository'
import { Game } from '../../domain/Game'
import { GameRepository } from '../../domain/GameRepository'

export class MongoGameRepository extends MongoRepository<Game> implements GameRepository {
	public async setWinn(userId: string): Promise<void> {
		const collection = await this.collection()

		const games = await collection.findOne({ userId })

		await collection.updateOne({ userId }, { $set: { winn: games?.winn + 1 || 1 } })
	}

	public async setTrie(userId: string): Promise<void> {
		let tries = 1
		const collection = await this.collection()
		const game = await collection.findOne({ userId })

		if (game && game.tries && game.tries === 1) {
			await collection.updateOne({ userId }, { $set: { games: game.games + 1, tries: game.tries + 1 } })
			return
		}

		if (game && game?.tries + 1 > 5) {
			throw new Error('You have already reached the maximum number of tires')
		}

		if (game) {
			tries = game?.tries + 1
		}

		await collection.updateOne({ userId }, { $set: { userId, tries } }, { upsert: true })
	}

	public async reset(): Promise<void> {
		const collection = await this.collection()
		collection.updateMany({ tries: { $ne: 0 } }, { $set: { tries: 0 } })
	}

	protected collectionName(): string {
		return 'games'
	}
}
