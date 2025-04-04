from django.contrib import admin
from .models import Company, Vacancy

@admin.register(Company)
class CompanyAdmin(admin.ModelAdmin):
    list_display = ('id', 'name', 'city')
    search_fields = ('name', 'city')

@admin.register(Vacancy)
class VacancyAdmin(admin.ModelAdmin):
    list_display = ('id', 'name', 'company', 'salary')
    list_filter = ('company',)
    search_fields = ('name', 'company__name')