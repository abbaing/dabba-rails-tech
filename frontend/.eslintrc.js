module.exports = {
    plugins: ['@typescript-eslint', 'react', 'prettier'],
    extends: [
        'eslint:recommended',
        'plugin:@typescript-eslint/recommended',
        'plugin:react/recommended',
        'prettier',
    ],
    rules: {
        'prettier/prettier': 'error',
    },
};
