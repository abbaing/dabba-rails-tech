describe('product catalog is visible spec', () => {
  it('passes', () => {
    cy.visit('http://localhost:8080')
    cy.get(':nth-child(1) > .card > .card-body > .card-title').should(
      'have.text',
      'Green Tea'
    )
    cy.get(':nth-child(2) > .card > .card-body > .card-title').should(
      'have.text',
      'Strawberries'
    )
    cy.get(':nth-child(3) > .card > .card-body > .card-title').should(
      'have.text',
      'Coffee'
    )
  })
})
