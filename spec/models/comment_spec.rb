# 20171112 6.2 Unit Tests

require 'rails_helper'

describe Comment do
  
  context "a user and product exists in the db" do
    let(:product) { Product.create!(name: "race bike") }
    let(:user) { User.create!(email: "test@test.com", password: "123123") }

    it "comment of an existing product valid with rating, user, and body" do
      expect(product.comments.new(rating: 1, user: user, body: "Awful bike!")).to be_valid
    end

    it "comment valid with product, rating, user, and body" do
      expect(Comment.new(product: product, rating: 1, user: user, body: "Awful bike!")).to be_valid
    end
  
    it "comment not valid without a product" do
      expect(Comment.new(rating: 1, user: user, body: "Awful bike!")).not_to be_valid
    end

    it "comment not valid without a rating" do
      expect(product.comments.new(user: user, body: "Awful bike!")).not_to be_valid
    end

    it "comment not valid without a numerical rating" do
      expect(product.comments.new(rating: "one", user: user, body: "Awful bike!")).not_to be_valid
    end

    it "comment not valid without a user" do
      expect(product.comments.new(rating: 1, body: "Awful bike!")).not_to be_valid
    end

    it "comment not valid without a body" do
      expect(product.comments.new(rating: 1, user: user)).not_to be_valid
    end

  end

end