from django.http import HttpResponse, Http404
from django.views.generic import View, ListView
from django.views.generic.edit import CreateView, UpdateView, DeleteView
from django.core.urlresolvers import reverse_lazy
from django.core.exceptions import ValidationError
from django.conf import settings
from django.template.response import TemplateResponse

from ad_server.models import Campaign, Banner, CampaignBanner
from ad_server.utils import weighted_choice


class BannerView(View):
    """
    Displays a banner.
    """
    cache = {}

    def validate_banner_size(self):
        """
        Validate the banner size.
        """
        if self.height > settings.MAX_BANNER_HEIGHT_SIZE or self.width > settings.MAX_BANNER_WIDTH_SIZE:
            raise ValidationError('Invalid banner size')

    def matching_campaigns_banners(self):
        """
        Returns the matched campaign banner from the cache if available.
        If not exist, takes the fitting campaign banners from the DB and caches them.
        """
        if (self.width, self.height) in BannerView.cache:
            campaigns_banners = BannerView.cache[(self.width, self.height)]
        else:
            campaigns_banners = CampaignBanner.matching_campaigns_banners(self.height, self.width)
            BannerView.cache[(self.width, self.height)] = campaigns_banners

        return campaigns_banners

    def get(self, request, width, height):
        """
        Returns a response with the banner according to the size.
        """
        self.height = int(height)
        self.width = int(width)

        try:
            self.validate_banner_size()
        except ValidationError:
            raise Http404

        campaigns_banners = self.matching_campaigns_banners()
        if campaigns_banners:
            chosen_campaign_banner = weighted_choice([(c, c.campaign.e_cpm) for c in campaigns_banners])

            return TemplateResponse(request, 'ad_server/banner_image.html', {
                'landing_page': chosen_campaign_banner.campaign.landing_page,
                'file_location': chosen_campaign_banner.banner.file_location
            })

        raise Http404


class CampaignListView(ListView):
    model = Campaign


class CampaignCreateView(CreateView):
    model = Campaign
    fields = '__all__'
    success_url = reverse_lazy('campaign_list')

    def post(self, request, *args, **kwargs):
        """
        Creates a campaign and cleans the cache.
        """
        res = super(CampaignCreateView, self).post(request, **kwargs)
        BannerView.cache.clear()
        return res


class CampaignUpdateView(UpdateView):
    model = Campaign
    fields = '__all__'
    success_url = reverse_lazy('campaign_list')

    def post(self, request, *args, **kwargs):
        """
        Updates a campaign and cleans the cache.
        """
        res = super(UpdateView, self).post(request, **kwargs)
        BannerView.cache.clear()
        return res


class CampaignDeleteView(DeleteView):
    model = Campaign
    success_url = reverse_lazy('campaign_list')

    def post(self, request, *args, **kwargs):
        """
        Deletes a campaign and cleans the cache.
        """
        res = super(CampaignDeleteView, self).post(request, **kwargs)
        BannerView.cache.clear()
        return res


class BannerListView(ListView):
    model = Banner


class BannerCreateView(CreateView):
    model = Banner
    fields = '__all__'
    success_url = reverse_lazy('banner_list')

    def post(self, request, *args, **kwargs):
        """
        Creates a banner and cleans the cache.
        """
        res = super(BannerCreateView, self).post(request, **kwargs)
        BannerView.cache.clear()
        return res


class BannerUpdateView(UpdateView):
    model = Banner
    fields = '__all__'
    success_url = reverse_lazy('banner_list')

    def post(self, request, *args, **kwargs):
        """
        Updates a banner and cleans the cache.
        """
        res = super(UpdateView, self).post(request, **kwargs)
        BannerView.cache.clear()
        return res


class BannerDeleteView(DeleteView):
    model = Banner
    success_url = reverse_lazy('banner_list')

    def post(self, request, *args, **kwargs):
        """
        Deleted a banner and cleans the cache.
        """
        res = super(BannerDeleteView, self).post(request, **kwargs)
        BannerView.cache.clear()
        return res


class CampaignBannerListView(ListView):
    model = CampaignBanner


class CampaignBannerCreateView(CreateView):
    model = CampaignBanner
    fields = '__all__'
    success_url = reverse_lazy('campaign_banner_list')

    def post(self, request, *args, **kwargs):
        """
        Creates a campaign banner and cleans the cache.
        """
        res = super(CampaignBannerCreateView, self).post(request, **kwargs)
        BannerView.cache.clear()
        return res


class CampaignBannerUpdateView(UpdateView):
    model = CampaignBanner
    fields = '__all__'
    success_url = reverse_lazy('campaign_banner_list')

    def post(self, request, *args, **kwargs):
        """
        Updates a campaign banner and cleans the cache.
        """
        res = super(UpdateView, self).post(request, **kwargs)
        BannerView.cache.clear()
        return res


class CampaignBannerDeleteView(DeleteView):
    model = CampaignBanner
    success_url = reverse_lazy('campaign_banner_list')

    def post(self, request, *args, **kwargs):
        """
        Deletes a campaign banner and cleans the cache.
        """
        res = super(CampaignBannerDeleteView, self).post(request, **kwargs)
        BannerView.cache.clear()
        return res
