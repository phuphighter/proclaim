module Proclaim
	module ApplicationHelper
		def comments_tree_for(comments)
			comments.map do |comment, nested_comments|
				commentHtml = render(partial: "proclaim/comments/comment",
				                     formats: [:html],
				                     locals: {
				                     	comment: comment,
				                     	target: "#comment_#{comment.id}_replies"
				                     })

				nestedComments = ""
				if nested_comments.size > 0
					nestedComments = comments_tree_for(nested_comments)
				end

				repliesHtml = content_tag(:div, nestedComments,
				                          id: "comment_#{comment.id}_replies",
				                          class: "replies")

				content_tag(:div, commentHtml + repliesHtml, class: "discussion")
			end.join.html_safe
		end

		def proclaim_title(page_title)
			content_for :proclaim_title, page_title.to_s
		end
	end
end
