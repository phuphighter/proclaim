# == Schema Information
#
# Table name: bespoke_comments
#
#  id         :integer          not null, primary key
#  post_id    :integer
#  parent_id  :integer
#  author     :string(255)
#  title      :string(255)
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

module Bespoke
	class CommentTest < ActiveSupport::TestCase
		test "ensure factory is good" do
			comment = FactoryGirl.build(:comment)

			assert comment.save, "Factory needs to be updated to save successfully"
		end

		test "ensure title is required" do
			comment = FactoryGirl.build(:comment, title: "")

			refute comment.save, "Comment should require a title!"
		end

		test "ensure body is required" do
			comment = FactoryGirl.build(:comment, body: "")

			refute comment.save, "Comment should require a body!"
		end
	end
end
