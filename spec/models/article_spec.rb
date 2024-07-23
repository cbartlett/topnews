require 'rails_helper'

RSpec.describe Article, type: :model do
  context "validations" do
    let(:attrs) {
      { external_id: 1, by: "Jane Doe", time: Time.at(1), title: "Test Article", url: 'https://www.example.com', kind: 'story', data: { foo: :bar } }
    }
    it 'should require title, external_id, by, time, url, and kind' do
      expect(Article.new(attrs.except(:external_id)).valid?).to eq false
      expect(Article.new(attrs.except(:by)).valid?).to eq false
      expect(Article.new(attrs.except(:time)).valid?).to eq false
      expect(Article.new(attrs.except(:title)).valid?).to eq false
      expect(Article.new(attrs.except(:url)).valid?).to eq false
      expect(Article.new(attrs.except(:kind)).valid?).to eq false
      expect(Article.new(attrs.except(:data)).valid?).to eq false
      expect(Article.new(attrs).valid?).to eq true
    end
  end
end
