import { InvalidArgumentError } from './InvalidArgumentError'
import { ValueObject } from './ValueObject'

export class PageValueObject extends ValueObject<number> {
	value: number

	constructor(value: number) {
		super(value)
		this.value = value
		this.ensurePageIsValid(value)
	}

	private ensurePageIsValid(value: number): void {
		if (!Number.isInteger(value)) {
			throw new InvalidArgumentError('Page must be an integer')
		}
		if (value < 1) {
			throw new InvalidArgumentError('Page must be greater than zero')
		}
	}
}
