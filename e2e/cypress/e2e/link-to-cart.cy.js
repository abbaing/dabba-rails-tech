describe('template spec', () => {
  it('passes', () => {
    cy.visit('http://localhost:8080')
    cy.get('#navbarsExample04 > .btn').click()
    cy.get('.display-5').should(
      'have.text',
      'My cart'
    )
  })
})