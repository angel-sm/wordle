import { Nullable } from '../../../shared/domain/Nullable'
import { User } from './User'

export interface UserRepository {
	findOne(email: string): Promise<Nullable<User>>
	save(user: User): Promise<void>
}
