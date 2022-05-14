import { MotherCreator } from './MotherCreator'

export class WordMother {
	static generate(): string {
		return MotherCreator.generate().lorem.word()
	}
}
