import { MongoRepository } from '../../../../shared/infrastructure/persistence/mongo/MongoRepository'
import { Game } from '../../domain/Game'
import { GameRepository } from '../../domain/GameRepository'

export class MongoGameRepository extends MongoRepository<Game> implements GameRepository {
	public async play(): Promise<any> {
		throw new Error('Method not implemented.')
	}

	protected collectionName(): string {
		return 'games'
	}
}
