import { Router, Request, Response } from 'express'
import container from '../dependency-injection'

import { verifyToken } from '../../../../Contexts/shared/infrastructure/auth/authMiddleware'

export const register = (router: Router) => {
	const gamePlayController = container.get('Apps.levita.controllers.GamePlayController')
	router.post('/game', verifyToken, (req: Request, res: Response) => gamePlayController.run(req, res))
}
