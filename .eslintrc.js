module.exports = {
  root: true,
  env: {
    node: true
  },
  'extends': [
    'plugin:vue/essential',
    'eslint:recommended'
  ],
  rules: {
    'no-console': 'off',
    'no-debugger': process.env.NODE_ENV === 'production' ? 'error' : 'off',
    'no-mixed-spaces-and-tabs': 'off',
    'invalid-first-character-of-tag-name': 'off'
  },
  parserOptions: {
    parser: 'babel-eslint'
  }
}
