import { Request, Response } from 'express'
import httpStatus from 'http-status'
import { UserCreator } from '../../../../../contexts/levita/Users/application/UserCreator'
import { Controller } from '../Controller'

type UserPostRequest = Request & {
	body: {
		password: string
		email: string
	}
}
export class UserAuthController implements Controller {
	constructor(private userCreator: UserCreator) {}

	async run(req: UserPostRequest, res: Response) {
		const { password, email } = req.body
		try {
			const token = await this.userCreator.auth({ password, email })
			res.status(httpStatus.OK).send({ email, token })
		} catch (error: Error | unknown | any) {
			res.status(httpStatus.BAD_REQUEST).send(error?.message)
		}
	}
}
