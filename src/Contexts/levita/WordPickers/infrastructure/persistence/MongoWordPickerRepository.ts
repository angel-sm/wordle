import { MongoRepository } from '../../../../shared/infrastructure/persistence/mongo/MongoRepository'
import { WordPicker } from '../../domain/WordPicker'
import { WordPickerRepository } from '../../domain/WordPickerRepository'

// interface WordPickerDocument {

// 	/* todo: agrega los campos de tu entidad */
// }

export class MongoWordPickerRepository extends MongoRepository<WordPicker> implements WordPickerRepository {
	public async getLast(): Promise<string> {
		const collection = await this.collection()
		const words = await collection.find({}).toArray()

		const currentWord = words[0].word

		return currentWord
	}

	async updateGeneric(word: string): Promise<void> {
		const collection = await this.collection()
		const words = await collection.find({}).toArray()

		const currentWord = words[0]

		if (!currentWord) {
			await collection.insertOne({ word })
		}

		collection.updateOne({ _id: currentWord._id }, { $set: { word: word } }, { upsert: false })
	}

	protected collectionName(): string {
		return 'wordPickers'
	}
}
