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
        'react/prop-types': 0,
    },
    settings: {
        react: {
            version: 'detect',
        },
    },
};
