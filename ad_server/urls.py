"""ad_server URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.9/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url
from django.contrib import admin

from ad_server.views import BannerView, CampaignListView, CampaignCreateView, CampaignUpdateView, CampaignDeleteView,\
                            BannerListView, BannerCreateView, BannerUpdateView, BannerDeleteView,\
                            CampaignBannerListView, CampaignBannerCreateView, CampaignBannerUpdateView,\
                            CampaignBannerDeleteView

admin.autodiscover()

urlpatterns = [
    url(r'^admin/', admin.site.urls),

    url(r'(?P<width>^\d+)x(?P<height>\d+)$', BannerView.as_view(), name='home'),

    url(r'^campaign/list$', CampaignListView.as_view(), name='campaign_list'),
    url(r'^campaign/new$', CampaignCreateView.as_view(), name='campaign_new'),
    url(r'^campaign/edit/(?P<pk>\d+)$', CampaignUpdateView.as_view(), name='campaign_edit'),
    url(r'^campaign/delete/(?P<pk>\d+)$', CampaignDeleteView.as_view(), name='campaign_delete'),

    url(r'^banner/list$', BannerListView.as_view(), name='banner_list'),
    url(r'^banner/new$', BannerCreateView.as_view(), name='banner_new'),
    url(r'^banner/edit/(?P<pk>\d+)$', BannerUpdateView.as_view(), name='banner_edit'),
    url(r'^banner/delete/(?P<pk>\d+)$', BannerDeleteView.as_view(), name='banner_delete'),

    url(r'^campaign_banner/list$', CampaignBannerListView.as_view(), name='campaign_banner_list'),
    url(r'^campaign_banner/new$', CampaignBannerCreateView.as_view(), name='campaign_banner_new'),
    url(r'^campaign_banner/edit/(?P<pk>\d+)$', CampaignBannerUpdateView.as_view(), name='campaign_banner_edit'),
    url(r'^campaign_banner/delete/(?P<pk>\d+)$', CampaignBannerDeleteView.as_view(), name='campaign_banner_delete')
]

