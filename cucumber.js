const common = [
	'--require-module ts-node/register', // Load TypeScript module
]

const levita_backend = [
	...common,
	'tests/apps/levita/backend/features/**/*.feature',
	'--require tests/apps/levita/backend/features/step_definitions/*.steps.ts',
].join(' ')

module.exports = {
	levita_backend,
}
