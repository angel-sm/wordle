import * as fs from 'fs'
import cron from 'cron'

import { GenericRepository } from '../../domain/GenericRepository'

export class Reader {
	static initCron(repository: GenericRepository, resetRepository: GenericRepository): void {
		console.log('🚀 cron job init')
		new cron.CronJob({
			cronTime: '10 * * * * *',
			onTick: () => {
				console.log('🚀 cron job call')
				Reader.getWord(repository)
				resetRepository.reset()
			},
			start: true,
		})
	}

	static async getWord(repository: GenericRepository): Promise<void> {
		const data = await fs.readFileSync('src/Contexts/levita/shared/infrastructure/reader/dict.txt', 'utf8')

		const word: string = data
			.split('\n')
			[Math.floor(Math.random() * data.split('\n').length)].substring(0, 5)
			.normalize('NFD')
			.replace(/[\u0300-\u036f]/g, '')

		console.log('🚀new word: ', word)

		repository.updateGeneric(word)
	}
}
