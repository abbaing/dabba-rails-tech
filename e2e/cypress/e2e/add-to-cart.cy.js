describe('add item to the cart spec', () => {
  it('passes', () => {
    cy.visit('http://localhost:8080')
    cy.get(':nth-child(1) > .card > .card-footer > .btn').click()
    cy.get('.cart-counter').should('be.visible').and('have.text', '1')
    cy.get('.Toastify__toast-body > :nth-child(2)').should('be.visible')
    cy.get('.Toastify__toast-body > :nth-child(2)').should(
      'have.text',
      'Green Tea added to your cart!'
    )
  })
})
