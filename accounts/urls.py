from django.conf.urls import patterns, include, url

urlpatterns = patterns('accounts.views',

                    url(r'^login/$', 'login', name='login'),
                    url(r'^logout/$', 'logout', name='logout'),

                    url(r'^register/investisseur/$', 'register', {'user_type': 'I'}, name='register-investisseur'),
                    url(r'^register/entrepreneur/$', 'register', {'user_type': 'E'}, name='register-entrepreneur'),
                    url(r'^profile/$', 'update_profile', name='update_profile'),
                    url(r'^profile/(?P<user_id>\w+)/$', 'view_profile', name='view_profile'),

                    url(r'^like/(?P<entrepreneur_id>\w+)/$', 'like', name='like'),
                    url(r'^mentor/(?P<entrepreneur_id>\w+)/$', 'mentor', name='mentor'),
)



