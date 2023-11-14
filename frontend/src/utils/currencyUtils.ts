export const formatCurrency = (amount?: number, locale = 'es-ES', currency = 'EUR') => {
  if (amount === undefined) return "-"
  return new Intl.NumberFormat(locale, {
    style: 'currency',
    currency: currency,
  }).format(amount)
}
