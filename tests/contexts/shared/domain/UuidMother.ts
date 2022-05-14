import { MotherCreator } from './MotherCreator'

export class UuidMother {
	static generate(): string {
		return MotherCreator.generate().datatype.uuid()
	}
}
