import { Collection, MongoClient } from 'mongodb'
import { AggregateRoot } from '../../../domain/AggregateRoot'
export abstract class MongoRepository<T extends AggregateRoot> {
	constructor(private _client: Promise<MongoClient>) {}

	protected abstract collectionName(): string

	protected client(): Promise<MongoClient> {
		return this._client
	}

	protected async collection(): Promise<Collection> {
		return (await this._client).db().collection(this.collectionName())
	}
}
