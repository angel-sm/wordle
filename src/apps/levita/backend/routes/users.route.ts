import { Router, Request, Response } from 'express'
import container from '../dependency-injection'

export const register = (router: Router) => {
	const userAuthController = container.get('Apps.levita.controllers.UserAuthController')
	router.post('/auth/sign-in', (req: Request, res: Response) => userAuthController.run(req, res))
}
