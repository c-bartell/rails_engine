require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'relationships' do
    it { should have_many(:items).dependent(:destroy) }
    it { should have_many(:invoices).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'class methods' do
    describe '::search' do
      it 'name' do
        create_list :merchant, 9
        merchant_params = {
          name: 'The Arasaka Corporation'
        }
        target_id = Merchant.create(merchant_params).id

        name_fragment = {
          name: 'e Ara'
        }
        different_case = {
          name: 'SAKA cORp'
        }
        something_that_isnt_there = {
          name: 'The Guild of Calamitous Intent'
        }
        empty_query = {}
        expect(Merchant.search(merchant_params).id).to eq(target_id)
        expect(Merchant.search(name_fragment).id).to eq(target_id)
        expect(Merchant.search(different_case).id).to eq(target_id)
        expect(Merchant.search(something_that_isnt_there)).to be_nil
        expect(Merchant.search(empty_query)).to be_nil
      end

      it 'created_at/updated_at' do
        
      end
    end

    it '::date' do
      expect(Merchant.date?(:created_at)).to be true
      expect(Merchant.date?(:updated_at)).to be true
      expect(Merchant.date?(:name)).to be false
      expect(Merchant.date?(:id)).to be false
      expect(Merchant.date?("something that isn't an attribute")).to be false
    end
  end
end
