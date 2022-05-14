import { Router, Request, Response } from 'express'
import container from '../dependency-injection'

export const register = (router: Router) => {
	const gamePlayController = container.get('Apps.levita.controllers.GamePlayController')
	router.post('/game', (req: Request, res: Response) => gamePlayController.run(req, res))
}
