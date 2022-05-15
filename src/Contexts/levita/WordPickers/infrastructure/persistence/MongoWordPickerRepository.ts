import { MongoRepository } from '../../../../shared/infrastructure/persistence/mongo/MongoRepository'
import { WordPicker } from '../../domain/WordPicker'
import { WordPickerRepository } from '../../domain/WordPickerRepository'

interface WordPickerDocument {
	word: string
}
export class MongoWordPickerRepository extends MongoRepository<WordPicker> implements WordPickerRepository {
	public async guessWord(word: string): Promise<void> {
		const collection = await this.collection()
		const result = await collection.findOne({ word })

		if (result) {
			await collection.updateOne({ word }, { $set: { guessed: result.guessed + 1 } })
		}
	}

	public async getLast(): Promise<WordPicker> {
		const collection = await this.collection()
		const result = await collection.findOne<WordPickerDocument>({ isCurrent: true })

		return result && WordPicker.fromPrimitives({ ...result }).toPrimitives()
	}

	async updateGeneric(word: string): Promise<void> {
		const collection = await this.collection()

		const result = await collection.findOne<WordPickerDocument>({ word })

		if (result) {
			await collection.updateOne({ isCurrent: true }, { $set: { isCurrent: false } })
			await collection.updateOne({ word }, { $set: { isCurrent: true } })
			return
		}

		await collection.updateOne({ isCurrent: true }, { $set: { isCurrent: false } })
		await collection.insertOne({ word, isCurrent: true, guessed: 0 })
	}

	protected collectionName(): string {
		return 'wordPickers'
	}
}
