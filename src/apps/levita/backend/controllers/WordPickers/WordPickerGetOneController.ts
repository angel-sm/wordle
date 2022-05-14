import { Request, Response } from 'express'
import httpStatus from 'http-status'
import { WordPickerCreator } from '../../../../../contexts/levita/WordPickers/application/WordPickerCreator'
import { Controller } from '../Controller'

type WordPickerPostRequest = Request & {
	body: {}
}
export class WordPickerGetOneController implements Controller {
	constructor(private wordPickerCreator: WordPickerCreator) {}

	map(input: any) {
		const inmutableObject = { ...input }
		inmutableObject.id = inmutableObject._id
		delete inmutableObject._id
		return inmutableObject
	}

	async run(req: WordPickerPostRequest, res: Response) {
		try {
			const wordPicker = await this.wordPickerCreator.getWordPicker()

			if (wordPicker === null) {
				res.status(httpStatus.NOT_FOUND)
				return
			}
			const wordPickerDTO = await this.map(wordPicker)

			res.status(httpStatus.OK).json(wordPickerDTO)
		} catch (error) {
			res.status(httpStatus.INTERNAL_SERVER_ERROR).send()
		}
	}
}
