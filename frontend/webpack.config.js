const path = require('path')
const HtmlWebpackPlugin = require('html-webpack-plugin')
const Dotenv = require('dotenv-webpack')

module.exports = {
  entry: './src/index.tsx',
  output: {
    filename: 'bundle.js',
    path: path.resolve(__dirname, 'dist'),
  },
  resolve: {
    extensions: ['.ts', '.tsx', '.js', '.jsx'],
    alias: {
      components: path.join(__dirname, 'src/components'),
      layout: path.join(__dirname, 'src/layout'),
      modules: path.join(__dirname, 'src/modules'),
      utils: path.join(__dirname, 'src/utils'),
      stores: path.join(__dirname, 'src/stores'),
      services: path.join(__dirname, 'src/services'),
      models: path.join(__dirname, 'src/models'),
    },
  },
  module: {
    rules: [
      {
        test: /\.(ts|tsx)$/,
        use: 'ts-loader',
        exclude: /node_modules/,
      },
      {
        test: /\.css$/,
        use: ['style-loader', 'css-loader'],
      },
    ],
  },
  plugins: [
    new HtmlWebpackPlugin({
      template: './public/index.html',
    }),
    new Dotenv({
      path: path.resolve(
        __dirname,
        'config',
        process.env.NODE_ENV === 'production' ? 'prod.env' : 'dev.env'
      ),
    }),
  ],
  devServer: {
    static: {
      directory: path.join(__dirname, 'dist'),
    },
    historyApiFallback: true,
    port: 8080,
  },
}
