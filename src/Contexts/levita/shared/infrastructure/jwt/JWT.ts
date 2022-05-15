import jwt from 'jsonwebtoken'
import config from '../config'

export class JWT {
	private readonly secret: any

	constructor() {
		this.secret = config.get('jwt_access.secret')
	}

	public sign = (payload: any, options?: any) => {
		return jwt.sign(payload, this.secret, { expiresIn: '1h', ...options })
	}
}
