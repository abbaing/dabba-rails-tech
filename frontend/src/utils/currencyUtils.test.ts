import { formatCurrency } from './currencyUtils'

describe('formatCurrency function', () => {
  test('should format currency in euros (EUR)', () => {
    const amount = 1011
    const customLocale = 'es-ES'
    const customCurrency = 'EUR'

    const result = formatCurrency(amount, customLocale, customCurrency)

    expect(result).toEqual('1011,00\xa0€')
  })

  test('should format currency in dollars (USD)', () => {
    const amount = 50
    const customLocale = 'en-US'
    const customCurrency = 'USD'

    const result = formatCurrency(amount, customLocale, customCurrency)

    expect(result).toEqual('$50.00')
  })
})
