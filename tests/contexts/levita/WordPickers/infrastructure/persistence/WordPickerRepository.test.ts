import container from '../../../../../../src/apps/levita/backend/dependency-injection'
import { WordPickerRepository } from '../../../../../../src/contexts/levita/WordPickers/domain/WordPickerRepository'
import { EnvironmentArranger } from '../../../../shared/infrastructure/arranger/EnvironmentArranger'
import { WordPickerMother } from '../../domain/WordPickerMother'

const repository: WordPickerRepository = container.get('Levita.WordPickers.domain.WordPickerRepository')
const environmentArranger: Promise<EnvironmentArranger> = container.get('Levita.EnvironmentArranger')

beforeEach(async () => {
	await (await environmentArranger).arrange()
})

afterAll(async () => {
	await (await environmentArranger).arrange()
	await (await environmentArranger).close()
})

describe('WordPickerRepository', () => {
	describe('#save', () => {
		it('should save a WordPicker', async () => {
			const wordPicker = WordPickerMother.generate()

			await repository.create(wordPicker)
		})
	})
})
