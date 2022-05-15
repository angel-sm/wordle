import { Nullable } from '../../../../shared/domain/Nullable'
import { MongoRepository } from '../../../../shared/infrastructure/persistence/mongo/MongoRepository'
import { User } from '../../domain/User'
import { UserRepository } from '../../domain/UserRepository'

interface UserDocument {
	_id: string
	email: string
	password: string
}

export class MongoUserRepository extends MongoRepository<User> implements UserRepository {
	public async findOne(email: string): Promise<Nullable<User>> {
		const collection = await this.collection()
		const document = await collection.findOne<UserDocument>({ email })

		return document ? { ...User.fromPrimitives(document).toPrimitives(), _id: document?._id } : null
	}

	public async save(user: User): Promise<void> {
		const collection = await this.collection()
		await collection.insertOne(user.toPrimitives())
	}

	protected collectionName(): string {
		return 'users'
	}
}
