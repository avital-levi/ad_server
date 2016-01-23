from __future__ import unicode_literals

from django.conf import settings
from django.db.models import Model, Q, CharField, TextField, BooleanField, IntegerField, DecimalField, DateTimeField,\
                             URLField, ForeignKey


class Banner(Model):
    """
    Represents a Banner.
    """
    name = CharField(max_length=100, unique=True)
    description = TextField(null=True, blank=True)
    is_active = BooleanField(default=True)
    width = IntegerField(default=0)
    height = IntegerField(default=0)
    file_location = CharField(max_length=100)
    created_on = DateTimeField(auto_now_add=True)
    created_by = CharField(max_length=100)
    updated_on = DateTimeField(auto_now=True)
    updated_by = CharField(max_length=100)

    def __unicode__(self):
        return 'name:{} height:{} width:{}'.format(self.name, self.height, self.width)

    class Meta:
        db_table = 'banner'
        ordering = ('name',)


class Campaign(Model):
    """
    Represents a Campaign.
    """
    CPM = 'pm'
    CPC = 'pc'
    CPA = 'pa'
    PRICING_MODEL = ((CPM, 'CPM'), (CPC, 'CPC'), (CPA, 'CPA'))

    name = CharField(max_length=100, unique=True)
    pricing_model = CharField(max_length=2, choices=PRICING_MODEL,)
    bid_price = DecimalField(max_digits=9, decimal_places=3)
    e_cpm = DecimalField(max_digits=9, decimal_places=3, editable=False)
    landing_page = URLField()

    class Meta:
        db_table = 'campaign'

    def __unicode__(self):
        return 'campaign_name:{} bid_pric:{} eCPM:{}'.format(self.name, self.bid_price, self.e_cpm)

    def get_e_cpm(self):
        """
        Calculates the eCPM from the actual bid price.
        """
        if self.pricing_model == self.CPM:
            return self.bid_price
        elif self.pricing_model == self.CPC:
            return self.bid_price * settings.CPC_ASSUMED_CLICK_RATE * 1000
        elif self.pricing_model == Campaign.CPA:
            return self.bid_price * settings.CPA_ASSUMED_CLICK_RATE * settings.CPA_ASSUMED_CONVERSION_RATE * 1000
        else:
            raise ValueError("Illegal pricing mode")

    def save(self, *args, **kwargs):
        """
        Saves the current instance with the eCPM calculation.
        """
        self.e_cpm = self.get_e_cpm()
        super(Campaign, self).save(*args, **kwargs)


class CampaignBanner(Model):
    """
    Represents a campaign banner.
    """
    campaign = ForeignKey(Campaign)
    banner = ForeignKey(Banner)

    class Meta:
        db_table = 'campaign_banner'
        ordering = ('id',)
        verbose_name_plural = 'Campaign Banners'
        unique_together = ('campaign', 'banner',)

    @classmethod
    def matching_campaigns_banners(cls, height=None, width=None):
        """
        Returns QuerySet of the campaign height and width query.
        """
        return cls.objects.filter(
                Q(banner__is_active=True) &
                Q(banner__height__gte=settings.RANGE_HEIGHT_SIZE[height][0]) &
                Q(banner__height__lte=settings.RANGE_HEIGHT_SIZE[height][1]) &
                Q(banner__width__gte=settings.RANGE_WIDTH_SIZE[width][0]) &
                Q(banner__width__lte=settings.RANGE_WIDTH_SIZE[width][1])
        ).order_by('-campaign__e_cpm')[:5]
