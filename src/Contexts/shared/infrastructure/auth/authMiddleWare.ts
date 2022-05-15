import { Request, Response, NextFunction } from 'express'
import jwt from 'jsonwebtoken'
import config from '../../../levita/shared/infrastructure/config'

export const verifyToken = (req: Request, res: Response, next: NextFunction) => {
	const token = req.body.token || req.query.token || req.headers['authorization']

	if (!token) {
		return res.status(403).send('A token is required for authentication')
	}

	try {
		const decoded = jwt.verify(token, `${config.get('jwt_access.secret')}`)
		req.body.user = decoded
		delete req.body.user?.iat
		delete req.body.user?.exp
		delete req.body.user?.password
	} catch (err) {
		return res.status(401).send('Invalid Token')
	}

	return next()
}
