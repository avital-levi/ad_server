from django.contrib import admin

from ad_server.models import Campaign, Banner, CampaignBanner

admin.site.register(Campaign)
admin.site.register(Banner)
admin.site.register(CampaignBanner)
