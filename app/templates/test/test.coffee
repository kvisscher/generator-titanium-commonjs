chai = require "chai"

describe("Math should still be OK", () ->
  it("1 + 1 should equal 2", () ->
    chai.expect(1 + 1).to.eq(2)
  )
)