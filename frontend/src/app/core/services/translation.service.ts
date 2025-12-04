import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';

export interface Language {
  code: string;
  name: string;
  direction: 'ltr' | 'rtl';
  flag: string;
}

@Injectable({
  providedIn: 'root'
})
export class TranslationService {
  private currentLangSubject = new BehaviorSubject<string>('fr');
  public currentLang$ = this.currentLangSubject.asObservable();

  languages: Language[] = [
    { code: 'fr', name: 'Français', direction: 'ltr', flag: '🇫🇷' },
    { code: 'ar', name: 'العربية', direction: 'rtl', flag: '🇹🇳' },
    { code: 'en', name: 'English', direction: 'ltr', flag: '🇬🇧' }
  ];

  translations: { [key: string]: { [key: string]: string } } = {
    fr: {
      // Navigation
      'nav.dashboard': 'Tableau de Bord',
      'nav.employers': 'Employeurs',
      'nav.affiliations': 'Affiliations',
      'nav.debits': 'Débits',
      'nav.payments': 'Paiements',
      'nav.logout': 'Déconnexion',
      
      // Dashboard
      'dashboard.welcome': 'Bienvenue',
      'dashboard.total_employers': 'Total Employeurs',
      'dashboard.total_affiliations': 'Total Affiliations',
      'dashboard.debits_pending': 'Débits en attente',
      'dashboard.total_payments': 'Total Paiements',
      'dashboard.recent_activities': 'Activités récentes',
      'dashboard.quick_actions': 'Actions rapides',
      
      // Employers
      'employers.title': 'Gestion des Employeurs',
      'employers.search': 'Rechercher',
      'employers.filter_regime': 'Filtrer par régime',
      'employers.filter_status': 'Filtrer par statut',
      'employers.add': 'Ajouter Employeur',
      'employers.numero': 'Numéro',
      'employers.commercial_name': 'Nom Commercial',
      'employers.regime': 'Régime',
      'employers.country': 'Pays',
      'employers.affiliations': 'Affiliations',
      'employers.status': 'Statut',
      'employers.actions': 'Actions',
      'employers.active': 'Actif',
      'employers.inactive': 'Inactif',
      
      // Affiliations
      'affiliations.title': 'Gestion des Affiliations',
      'affiliations.add': 'Enregistrer une Affiliation',
      'affiliations.matricule': 'Matricule',
      'affiliations.name': 'Nom & Prénom',
      'affiliations.employer': 'Employeur',
      'affiliations.start_date': 'Date Début',
      'affiliations.salary': 'Salaire (TND)',
      
      // Debits
      'debits.title': 'Gestion des Débits Trimestriels',
      'debits.generate': 'Générer un Débit',
      'debits.numero': 'Numéro',
      'debits.period': 'Période',
      'debits.generation_date': 'Date Génération',
      'debits.amount': 'Montant (TND)',
      'debits.validated': 'Validé',
      'debits.paid': 'Payé',
      'debits.pending': 'En attente',
      
      // Buttons
      'btn.search': 'Rechercher',
      'btn.filter': 'Filtrer',
      'btn.add': 'Ajouter',
      'btn.edit': 'Modifier',
      'btn.delete': 'Supprimer',
      'btn.view': 'Voir',
      'btn.save': 'Enregistrer',
      'btn.cancel': 'Annuler',
      'btn.previous': 'Précédent',
      'btn.next': 'Suivant',
      
      // Messages
      'msg.loading': 'Chargement...',
      'msg.no_data': 'Aucune donnée disponible',
      'msg.error': 'Une erreur est survenue',
      'msg.success': 'Opération réussie',
      'msg.confirm_delete': 'Voulez-vous vraiment supprimer cet élément ?'
    },
    ar: {
      // Navigation
      'nav.dashboard': 'لوحة القيادة',
      'nav.employers': 'أصحاب العمل',
      'nav.affiliations': 'الانتسابات',
      'nav.debits': 'الديون',
      'nav.payments': 'المدفوعات',
      'nav.logout': 'تسجيل الخروج',
      
      // Dashboard
      'dashboard.welcome': 'مرحبا',
      'dashboard.total_employers': 'مجموع أصحاب العمل',
      'dashboard.total_affiliations': 'مجموع الانتسابات',
      'dashboard.debits_pending': 'الديون المعلقة',
      'dashboard.total_payments': 'مجموع المدفوعات',
      'dashboard.recent_activities': 'النشاطات الأخيرة',
      'dashboard.quick_actions': 'إجراءات سريعة',
      
      // Employers
      'employers.title': 'إدارة أصحاب العمل',
      'employers.search': 'بحث',
      'employers.filter_regime': 'تصفية حسب النظام',
      'employers.filter_status': 'تصفية حسب الحالة',
      'employers.add': 'إضافة صاحب عمل',
      'employers.numero': 'الرقم',
      'employers.commercial_name': 'الاسم التجاري',
      'employers.regime': 'النظام',
      'employers.country': 'البلد',
      'employers.affiliations': 'الانتسابات',
      'employers.status': 'الحالة',
      'employers.actions': 'الإجراءات',
      'employers.active': 'نشط',
      'employers.inactive': 'غير نشط',
      
      // Affiliations
      'affiliations.title': 'إدارة الانتسابات',
      'affiliations.add': 'تسجيل انتساب',
      'affiliations.matricule': 'رقم الضمان',
      'affiliations.name': 'الاسم واللقب',
      'affiliations.employer': 'صاحب العمل',
      'affiliations.start_date': 'تاريخ البداية',
      'affiliations.salary': 'الأجر (دينار)',
      
      // Debits
      'debits.title': 'إدارة الديون الفصلية',
      'debits.generate': 'إنشاء دين',
      'debits.numero': 'الرقم',
      'debits.period': 'الفترة',
      'debits.generation_date': 'تاريخ الإنشاء',
      'debits.amount': 'المبلغ (دينار)',
      'debits.validated': 'مصادق عليه',
      'debits.paid': 'مدفوع',
      'debits.pending': 'قيد الانتظار',
      
      // Buttons
      'btn.search': 'بحث',
      'btn.filter': 'تصفية',
      'btn.add': 'إضافة',
      'btn.edit': 'تعديل',
      'btn.delete': 'حذف',
      'btn.view': 'عرض',
      'btn.save': 'حفظ',
      'btn.cancel': 'إلغاء',
      'btn.previous': 'السابق',
      'btn.next': 'التالي',
      
      // Messages
      'msg.loading': 'جاري التحميل...',
      'msg.no_data': 'لا توجد بيانات',
      'msg.error': 'حدث خطأ',
      'msg.success': 'نجحت العملية',
      'msg.confirm_delete': 'هل تريد حقا حذف هذا العنصر؟'
    },
    en: {
      // Navigation
      'nav.dashboard': 'Dashboard',
      'nav.employers': 'Employers',
      'nav.affiliations': 'Affiliations',
      'nav.debits': 'Debits',
      'nav.payments': 'Payments',
      'nav.logout': 'Logout',
      
      // Dashboard
      'dashboard.welcome': 'Welcome',
      'dashboard.total_employers': 'Total Employers',
      'dashboard.total_affiliations': 'Total Affiliations',
      'dashboard.debits_pending': 'Pending Debits',
      'dashboard.total_payments': 'Total Payments',
      'dashboard.recent_activities': 'Recent Activities',
      'dashboard.quick_actions': 'Quick Actions',
      
      // Employers
      'employers.title': 'Employers Management',
      'employers.search': 'Search',
      'employers.filter_regime': 'Filter by regime',
      'employers.filter_status': 'Filter by status',
      'employers.add': 'Add Employer',
      'employers.numero': 'Number',
      'employers.commercial_name': 'Commercial Name',
      'employers.regime': 'Regime',
      'employers.country': 'Country',
      'employers.affiliations': 'Affiliations',
      'employers.status': 'Status',
      'employers.actions': 'Actions',
      'employers.active': 'Active',
      'employers.inactive': 'Inactive',
      
      // Affiliations
      'affiliations.title': 'Affiliations Management',
      'affiliations.add': 'Register Affiliation',
      'affiliations.matricule': 'ID Number',
      'affiliations.name': 'Name',
      'affiliations.employer': 'Employer',
      'affiliations.start_date': 'Start Date',
      'affiliations.salary': 'Salary (TND)',
      
      // Debits
      'debits.title': 'Quarterly Debits Management',
      'debits.generate': 'Generate Debit',
      'debits.numero': 'Number',
      'debits.period': 'Period',
      'debits.generation_date': 'Generation Date',
      'debits.amount': 'Amount (TND)',
      'debits.validated': 'Validated',
      'debits.paid': 'Paid',
      'debits.pending': 'Pending',
      
      // Buttons
      'btn.search': 'Search',
      'btn.filter': 'Filter',
      'btn.add': 'Add',
      'btn.edit': 'Edit',
      'btn.delete': 'Delete',
      'btn.view': 'View',
      'btn.save': 'Save',
      'btn.cancel': 'Cancel',
      'btn.previous': 'Previous',
      'btn.next': 'Next',
      
      // Messages
      'msg.loading': 'Loading...',
      'msg.no_data': 'No data available',
      'msg.error': 'An error occurred',
      'msg.success': 'Operation successful',
      'msg.confirm_delete': 'Do you really want to delete this item?'
    }
  };

  constructor() {
    const savedLang = localStorage.getItem('language') || 'fr';
    this.setLanguage(savedLang);
  }

  setLanguage(langCode: string): void {
    this.currentLangSubject.next(langCode);
    localStorage.setItem('language', langCode);
    
    const lang = this.languages.find(l => l.code === langCode);
    if (lang) {
      document.documentElement.setAttribute('dir', lang.direction);
      document.documentElement.setAttribute('lang', langCode);
    }
  }

  getCurrentLanguage(): string {
    return this.currentLangSubject.value;
  }

  translate(key: string): string {
    const lang = this.getCurrentLanguage();
    return this.translations[lang]?.[key] || key;
  }
}
