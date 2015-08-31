require 'test_helper'

class EquipmentTest < ActiveSupport::TestCase
  def setup
  	@equipment = equipment(:tablet)
  end

  test "should be valid" do
  	assert @equipment.valid?
  end

  #~Name Tests~#
  test "name should be present" do
  	@equipment.name = "     "
  	assert_not @equipment.valid?
  end

  test "name should not be too long" do
  	@equipment.name = "a" * 51
  	assert_not @equipment.valid?
  end

  #~Tag Tests~#
  test "tag should be present" do
  	@equipment.tag = "  "
  	assert_not @equipment.valid?
  end

  test "tag should not be too long" do
  	@equipment.tag = "a" * 9
  	assert_not @equipment.valid?
  end

  test "tag should be saved as lower-case" do
  	upper_case_tag = "AAAA1111"
  	@equipment.tag = upper_case_tag
  	@equipment.save
  	assert_equal upper_case_tag.downcase, @equipment.reload.tag
  end

  test "tag validation should accept valid tags" do
  	valid_tags = %w[raaa223 D2 c21345 Pa10 Laptop20 12345678 1]
  	valid_tags.each do |valid_tag|
  		@equipment.tag = valid_tag
  		assert @equipment.valid?, "#{valid_tag} should be valid"
  	end
  end

  test "tag validation should reject invalid tags" do
  	invalid_tags = %w[,2 -- 2A 0x @# f/ ,,,,,,,,,,,,,,,,]
  	invalid_tags.each do |invalid_tag|
  		@equipment.tag = invalid_tag
  		assert_not @equipment.valid?, "#{invalid_tag} should be invalid"
  	end
  end

  test "tags should be unique" do
  	duplicate_equipment = @equipment.dup
  	@equipment.save
  	assert_not duplicate_equipment.valid?
  end

  #~Status Tests~#
  test "status should be present" do
  	@equipment.status = nil
  	assert_not @equipment.valid?
  end

  test "status should be either true or false" do
  	@equipment.status = true
  	assert @equipment.valid?
  	@equipment.status = false
  	assert_not @equipment.valid?
  end

  #~Other Tests~#
  test "order should be by the tag" do
    assert_equal equipment(:tablet), Equipment.first
  end

  test "associated requests should be destroyed" do
    @equipment.save
    @equipment.requests.create!(name: "Jacob", email: "jacob@example.com", sid: 907666666)
    assert_difference 'Request.count', -1 do
      @equipment.destroy
    end
  end
end
