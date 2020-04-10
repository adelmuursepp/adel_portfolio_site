class ResourceCommentsController < ApplicationController
  def create
    @resource_comment = current_user.resource_comments.build(comment_params)
  end

  def comment_params
    params.require(:resource_comment).permit(:content)
  end
end
