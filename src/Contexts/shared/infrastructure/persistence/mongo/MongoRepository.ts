import { Collection, MongoClient } from 'mongodb'
import { AggregateRoot } from '../../../domain/AggregateRoot'
import { DateValueObject } from '../../../domain/value-object/DateValueObject'

export abstract class MongoRepository<T extends AggregateRoot> {
	constructor(private _client: Promise<MongoClient>) {}

	protected abstract collectionName(): string

	protected client(): Promise<MongoClient> {
		return this._client
	}

	protected async collection(): Promise<Collection> {
		return (await this._client).db().collection(this.collectionName())
	}

	protected async updateOne(id: string, aggregateRoot: T): Promise<void> {
		const collection = await this.collection()

		const document = { ...aggregateRoot.toPrimitives(), _id: id }

		await collection.updateOne({ _id: id }, { $set: document }, { upsert: true })
	}

	protected async insert(aggregateRoot: T): Promise<void> {
		const collection = await this.collection()

		const document = { ...aggregateRoot.toPrimitives() }

		await collection.insertOne(document)
	}

	protected async delete(id: string): Promise<void> {
		const collection = await this.collection()

		collection.updateOne({ _id: id }, { $set: { deletedAt: new DateValueObject(new Date()).value } })
	}
}
