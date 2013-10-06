from django.conf.urls import patterns, include, url


urlpatterns = patterns('news.views',
                    url(r'^post/$', 'new_post', name='new_post'),
                    url(r'^edit_post/(?P<post_id>\w+)/$', 'edit_post', name='edit_post'),
)



