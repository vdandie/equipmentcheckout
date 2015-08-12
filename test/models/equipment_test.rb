require 'test_helper'

class EquipmentTest < ActiveSupport::TestCase
  def setup
  	@equipment = Equipment.new(tag: "A1", name: "laptop", status: true)
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
  	@equipment.tag = "a" * 3
  	assert_not @equipment.valid?
  end

  test "tag should be saved as lower-case" do
  	upper_case_tag = "A1"
  	@equipment.tag = upper_case_tag
  	@equipment.save
  	assert_equal upper_case_tag.downcase, @equipment.reload.tag
  end

  test "tag validation should accept valid tags" do
  	valid_tags = %w[r2 D2 c3 P0 L0 L8 b8]
  	valid_tags.each do |valid_tag|
  		@equipment.tag = valid_tag
  		assert @equipment.valid?, "#{valid_tag} should be valid"
  	end
  end

  test "tag validation should reject invalid tags" do
  	invalid_tags = %w[aa 11 ,2 -- 2A 0x @# f/]
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

end
