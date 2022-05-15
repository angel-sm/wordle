import { Request, Response } from 'express'
import httpStatus from 'http-status'
import { GameCreator } from '../../../../../contexts/levita/Games/application/GameCreator'
import { Controller } from '../Controller'

type GamePostRequest = Request & {
	body: {
		word: string
	}
}
export class GamePlayController implements Controller {
	constructor(private gameCreator: GameCreator) {}

	async run(req: GamePostRequest, res: Response) {
		try {
			await this.gameCreator.play(req.body)
			res.status(httpStatus.OK).send()
		} catch (error: Error | unknown | any) {
			res.status(httpStatus.BAD_REQUEST).send(error?.message || 'Invalid request')
		}
	}
}
