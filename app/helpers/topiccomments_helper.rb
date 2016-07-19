module TopiccommentsHelper
    def user_is_authorized_for_topiccomment?(topiccomment)
        current_user && (current_user == topiccomment.user || current_user.admin?)
    end
end
