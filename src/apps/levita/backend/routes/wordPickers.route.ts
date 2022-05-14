import { Router, Request, Response } from 'express'
import container from '../dependency-injection'

export const register = (router: Router) => {
	const wordPickerGetOneController = container.get('Apps.levita.controllers.WordPickerGetOneController')
	router.get('/wordPickers', (req: Request, res: Response) => wordPickerGetOneController.run(req, res))
}
