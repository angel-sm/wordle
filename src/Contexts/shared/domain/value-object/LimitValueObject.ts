import { InvalidArgumentError } from './InvalidArgumentError'
import { ValueObject } from './ValueObject'

export class LimitValueObject extends ValueObject<number> {
	value: number

	constructor(value: number) {
		super(value)
		this.value = value
		this.ensureLimitIsValid(value)
	}

	private ensureLimitIsValid(value: number): void {
		if (!Number.isInteger(value)) {
			throw new InvalidArgumentError('Limit must be an integer')
		}
		if (value < 1) {
			throw new InvalidArgumentError('Limit must be greater than zero')
		}
		if (value > 100) {
			throw new InvalidArgumentError('Limit must be less than one hundred')
		}
	}
}
