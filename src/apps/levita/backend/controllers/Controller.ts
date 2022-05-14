import { Request, Response } from 'express'

export interface Controller {
	run(req: Request, res: Response): Promise<void>
	map?: (input: any) => any
}
