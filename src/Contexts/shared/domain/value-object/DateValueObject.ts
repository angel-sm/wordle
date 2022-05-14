import { ValueObject } from './ValueObject'

export class DateValueObject extends ValueObject<Date> {
	readonly value: Date

	constructor(value: Date) {
		super(value)
		this.value = value
	}

	format(): string {
		return this.value.toJSON()
	}

	toString(): string {
		return this.value.toJSON()
	}

	equals(other: DateValueObject): boolean {
		return other.constructor.name === this.constructor.name && other.toString() === this.value.toString()
	}
}
