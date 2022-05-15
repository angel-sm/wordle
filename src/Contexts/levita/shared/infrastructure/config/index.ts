import convict from 'convict'

const levitaConfig = convict({
	env: {
		doc: 'The application environment.',
		format: ['production', 'development', 'staging', 'test'],
		default: 'default',
		env: 'NODE_ENV',
	},
	mongo: {
		url: {
			doc: 'The Mongo connection URL',
			format: String,
			env: 'MONGO_URL',
			default: 'mongodb://localhost:27017/dev',
		},
	},
	jwt_access: {
		secret: 'secret',
	},
})

levitaConfig.loadFile([__dirname + '/default.json', __dirname + '/' + levitaConfig.get('env') + '.json'])

export default levitaConfig
