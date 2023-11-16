describe('increment product item in the product catalog spec', () => {
  it('passes', () => {
    cy.visit('http://localhost:8080')
    cy.get(':nth-child(1) > .card > .card-footer > .btn').click()
    cy.get('.cart-counter').should('be.visible').and('have.text', '1')
    cy.get('.card-footer > div > :nth-child(3)').click()
    cy.get('.cart-counter').should('be.visible').and('have.text', '2')
    cy.get('.Toastify__toast-body > :nth-child(2)').should('be.visible')
  })
})