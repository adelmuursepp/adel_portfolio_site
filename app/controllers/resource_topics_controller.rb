class ResourceTopicsController < ApplicationController
  def show
    @resource_topic = ResourceTopic.find(params[:id])
  end
end
