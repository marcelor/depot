require 'test_helper'

class CartTest < ActiveSupport::TestCase
  fixtures :products

  test "add product to an empty cart" do
    cart = Cart.create

    current_product = products(:ruby)

    before_count = cart.line_items.count

    cart.add_product(current_product.id)

    after_count = cart.line_items.count

    assert after_count = before_count + 1
  end

  test "add product to a cart that already has that product" do
  end

  test "empty cart" do
  end

  test "remove line item from a cart" do
  end

end
