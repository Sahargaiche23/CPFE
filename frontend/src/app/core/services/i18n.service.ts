import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';

export type Language = 'fr' | 'ar' | 'en';

export interface Translations {
  [key: string]: string | Translations;
}

@Injectable({
  providedIn: 'root'
})
export class I18nService {
  private currentLang = new BehaviorSubject<Language>('fr');
  public currentLang$ = this.currentLang.asObservable();
  
  private translations: { [lang: string]: Translations } = {
    fr: {
      // Header
      header: {
        republic: 'République Tunisienne',
        cnss: 'Caisse Nationale de Sécurité Sociale',
        system: 'Système de Gestion - Coopération Technique'
      },
      // Navigation
      nav: {
        dashboard: 'Tableau de bord',
        employers: 'Employeurs',
        affiliations: 'Affiliations',
        debits: 'Débits',
        payments: 'Paiements',
        profile: 'Mon profil',
        settings: 'Paramètres',
        logout: 'Déconnexion'
      },
      // Dashboard
      dashboard: {
        title: 'Tableau de Bord',
        welcome: 'Bienvenue dans le système de gestion de la coopération technique',
        totalEmployers: 'Total Employeurs',
        totalAffiliations: 'Total Affiliations',
        pendingDebits: 'Débits en attente',
        totalPayments: 'Total Paiements',
        recentActivities: 'Activités récentes',
        quickActions: 'Actions rapides',
        viewDetails: 'Voir détails'
      },
      // Employers
      employer: {
        title: 'Gestion des Employeurs',
        subtitle: 'Liste des employeurs régime 500 et 510',
        new: 'Nouvel Employeur',
        edit: 'Modifier Employeur',
        details: 'Détails Employeur',
        number: 'Numéro',
        tradeName: 'Nom Commercial',
        legalName: 'Raison Sociale',
        regime: 'Régime',
        country: 'Pays',
        address: 'Adresse',
        phone: 'Téléphone',
        email: 'Email',
        status: 'Statut',
        active: 'Actif',
        inactive: 'Inactif',
        affiliationsCount: 'Affiliations',
        actions: 'Actions',
        search: 'Rechercher',
        filter: 'Filtrer',
        all: 'Tous',
        noResults: 'Aucun employeur trouvé',
        confirmDelete: 'Êtes-vous sûr de vouloir supprimer cet employeur ?'
      },
      // Affiliations
      affiliation: {
        title: 'Gestion des Affiliations',
        new: 'Nouvelle Affiliation',
        number: 'Numéro Affiliation',
        employer: 'Employeur',
        startDate: 'Date Début',
        endDate: 'Date Fin',
        status: 'Statut',
        generateAttestation: 'Générer Attestation',
        downloadPdf: 'Télécharger PDF'
      },
      // Payments
      payment: {
        title: 'Gestion des Paiements',
        new: 'Nouveau Paiement',
        reference: 'Référence',
        employer: 'Employeur',
        debit: 'Débit',
        date: 'Date Paiement',
        amount: 'Montant (TND)',
        mode: 'Mode',
        status: 'Statut',
        validated: 'Validé',
        pending: 'En attente',
        receipt: 'Reçu',
        generateReceipt: 'Générer Reçu',
        downloadReceipt: 'Télécharger Reçu'
      },
      // Settings
      settings: {
        title: 'Paramètres',
        display: 'Affichage',
        darkMode: 'Thème sombre',
        darkModeDesc: 'Activer le mode sombre pour l\'interface',
        language: 'Langue',
        languageDesc: 'Langue de l\'interface',
        notifications: 'Notifications',
        emailNotif: 'Notifications par email',
        emailNotifDesc: 'Recevoir des notifications par email',
        pushNotif: 'Notifications push',
        pushNotifDesc: 'Recevoir des notifications dans le navigateur',
        security: 'Sécurité',
        twoFactor: 'Authentification à deux facteurs',
        twoFactorDesc: 'Ajouter une couche de sécurité supplémentaire',
        sessions: 'Sessions actives',
        viewSessions: 'Voir les sessions',
        save: 'Enregistrer les modifications',
        cancel: 'Annuler',
        saved: 'Paramètres enregistrés avec succès !'
      },
      // Profile
      profile: {
        title: 'Mon Profil',
        username: 'Nom d\'utilisateur',
        role: 'Profil',
        officeCode: 'Code Bureau',
        identity: 'Identité',
        connectedSince: 'Connecté depuis',
        changePassword: 'Changer le mot de passe',
        currentPassword: 'Mot de passe actuel',
        newPassword: 'Nouveau mot de passe',
        confirmPassword: 'Confirmer le mot de passe',
        update: 'Mettre à jour'
      },
      // Common
      common: {
        loading: 'Chargement...',
        save: 'Enregistrer',
        cancel: 'Annuler',
        delete: 'Supprimer',
        edit: 'Modifier',
        view: 'Voir',
        back: 'Retour',
        next: 'Suivant',
        previous: 'Précédent',
        yes: 'Oui',
        no: 'Non',
        confirm: 'Confirmer',
        error: 'Erreur',
        success: 'Succès',
        warning: 'Attention',
        required: 'Obligatoire'
      },
      // Auth
      auth: {
        login: 'Connexion',
        username: 'Nom d\'utilisateur',
        password: 'Mot de passe',
        submit: 'Se connecter',
        invalidCredentials: 'Identifiants incorrects. Veuillez réessayer.',
        logout: 'Déconnexion'
      }
    },
    ar: {
      // Header
      header: {
        republic: 'الجمهورية التونسية',
        cnss: 'الصندوق الوطني للضمان الاجتماعي',
        system: 'نظام إدارة التعاون التقني'
      },
      // Navigation
      nav: {
        dashboard: 'لوحة القيادة',
        employers: 'أصحاب العمل',
        affiliations: 'الانتماءات',
        debits: 'الديون',
        payments: 'المدفوعات',
        profile: 'ملفي الشخصي',
        settings: 'الإعدادات',
        logout: 'تسجيل الخروج'
      },
      // Dashboard
      dashboard: {
        title: 'لوحة القيادة',
        welcome: 'مرحباً بكم في نظام إدارة التعاون التقني',
        totalEmployers: 'إجمالي أصحاب العمل',
        totalAffiliations: 'إجمالي الانتماءات',
        pendingDebits: 'الديون المعلقة',
        totalPayments: 'إجمالي المدفوعات',
        recentActivities: 'الأنشطة الأخيرة',
        quickActions: 'إجراءات سريعة',
        viewDetails: 'عرض التفاصيل'
      },
      // Employers
      employer: {
        title: 'إدارة أصحاب العمل',
        subtitle: 'قائمة أصحاب العمل نظام 500 و 510',
        new: 'صاحب عمل جديد',
        edit: 'تعديل صاحب العمل',
        details: 'تفاصيل صاحب العمل',
        number: 'الرقم',
        tradeName: 'الاسم التجاري',
        legalName: 'الاسم القانوني',
        regime: 'النظام',
        country: 'البلد',
        address: 'العنوان',
        phone: 'الهاتف',
        email: 'البريد الإلكتروني',
        status: 'الحالة',
        active: 'نشط',
        inactive: 'غير نشط',
        affiliationsCount: 'الانتماءات',
        actions: 'الإجراءات',
        search: 'بحث',
        filter: 'تصفية',
        all: 'الكل',
        noResults: 'لم يتم العثور على أصحاب عمل',
        confirmDelete: 'هل أنت متأكد من حذف صاحب العمل هذا؟'
      },
      // Affiliations
      affiliation: {
        title: 'إدارة الانتماءات',
        new: 'انتماء جديد',
        number: 'رقم الانتماء',
        employer: 'صاحب العمل',
        startDate: 'تاريخ البداية',
        endDate: 'تاريخ النهاية',
        status: 'الحالة',
        generateAttestation: 'إنشاء شهادة',
        downloadPdf: 'تحميل PDF'
      },
      // Payments
      payment: {
        title: 'إدارة المدفوعات',
        new: 'دفعة جديدة',
        reference: 'المرجع',
        employer: 'صاحب العمل',
        debit: 'الدين',
        date: 'تاريخ الدفع',
        amount: 'المبلغ (دينار)',
        mode: 'طريقة الدفع',
        status: 'الحالة',
        validated: 'تم التحقق',
        pending: 'قيد الانتظار',
        receipt: 'الإيصال',
        generateReceipt: 'إنشاء إيصال',
        downloadReceipt: 'تحميل الإيصال'
      },
      // Settings
      settings: {
        title: 'الإعدادات',
        display: 'العرض',
        darkMode: 'الوضع الداكن',
        darkModeDesc: 'تفعيل الوضع الداكن للواجهة',
        language: 'اللغة',
        languageDesc: 'لغة الواجهة',
        notifications: 'الإشعارات',
        emailNotif: 'إشعارات البريد الإلكتروني',
        emailNotifDesc: 'تلقي الإشعارات عبر البريد الإلكتروني',
        pushNotif: 'إشعارات الدفع',
        pushNotifDesc: 'تلقي الإشعارات في المتصفح',
        security: 'الأمان',
        twoFactor: 'المصادقة الثنائية',
        twoFactorDesc: 'إضافة طبقة أمان إضافية',
        sessions: 'الجلسات النشطة',
        viewSessions: 'عرض الجلسات',
        save: 'حفظ التغييرات',
        cancel: 'إلغاء',
        saved: 'تم حفظ الإعدادات بنجاح!'
      },
      // Profile
      profile: {
        title: 'ملفي الشخصي',
        username: 'اسم المستخدم',
        role: 'الدور',
        officeCode: 'رمز المكتب',
        identity: 'الهوية',
        connectedSince: 'متصل منذ',
        changePassword: 'تغيير كلمة المرور',
        currentPassword: 'كلمة المرور الحالية',
        newPassword: 'كلمة المرور الجديدة',
        confirmPassword: 'تأكيد كلمة المرور',
        update: 'تحديث'
      },
      // Common
      common: {
        loading: 'جاري التحميل...',
        save: 'حفظ',
        cancel: 'إلغاء',
        delete: 'حذف',
        edit: 'تعديل',
        view: 'عرض',
        back: 'رجوع',
        next: 'التالي',
        previous: 'السابق',
        yes: 'نعم',
        no: 'لا',
        confirm: 'تأكيد',
        error: 'خطأ',
        success: 'نجاح',
        warning: 'تحذير',
        required: 'مطلوب'
      },
      // Auth
      auth: {
        login: 'تسجيل الدخول',
        username: 'اسم المستخدم',
        password: 'كلمة المرور',
        submit: 'دخول',
        invalidCredentials: 'بيانات الاعتماد غير صحيحة. يرجى المحاولة مرة أخرى.',
        logout: 'تسجيل الخروج'
      }
    },
    en: {
      // Header
      header: {
        republic: 'Tunisian Republic',
        cnss: 'National Social Security Fund',
        system: 'Technical Cooperation Management System'
      },
      // Navigation
      nav: {
        dashboard: 'Dashboard',
        employers: 'Employers',
        affiliations: 'Affiliations',
        debits: 'Debits',
        payments: 'Payments',
        profile: 'My Profile',
        settings: 'Settings',
        logout: 'Logout'
      },
      // Dashboard
      dashboard: {
        title: 'Dashboard',
        welcome: 'Welcome to the Technical Cooperation Management System',
        totalEmployers: 'Total Employers',
        totalAffiliations: 'Total Affiliations',
        pendingDebits: 'Pending Debits',
        totalPayments: 'Total Payments',
        recentActivities: 'Recent Activities',
        quickActions: 'Quick Actions',
        viewDetails: 'View Details'
      },
      // Employers
      employer: {
        title: 'Employer Management',
        subtitle: 'List of regime 500 and 510 employers',
        new: 'New Employer',
        edit: 'Edit Employer',
        details: 'Employer Details',
        number: 'Number',
        tradeName: 'Trade Name',
        legalName: 'Legal Name',
        regime: 'Regime',
        country: 'Country',
        address: 'Address',
        phone: 'Phone',
        email: 'Email',
        status: 'Status',
        active: 'Active',
        inactive: 'Inactive',
        affiliationsCount: 'Affiliations',
        actions: 'Actions',
        search: 'Search',
        filter: 'Filter',
        all: 'All',
        noResults: 'No employers found',
        confirmDelete: 'Are you sure you want to delete this employer?'
      },
      // Affiliations
      affiliation: {
        title: 'Affiliation Management',
        new: 'New Affiliation',
        number: 'Affiliation Number',
        employer: 'Employer',
        startDate: 'Start Date',
        endDate: 'End Date',
        status: 'Status',
        generateAttestation: 'Generate Attestation',
        downloadPdf: 'Download PDF'
      },
      // Payments
      payment: {
        title: 'Payment Management',
        new: 'New Payment',
        reference: 'Reference',
        employer: 'Employer',
        debit: 'Debit',
        date: 'Payment Date',
        amount: 'Amount (TND)',
        mode: 'Mode',
        status: 'Status',
        validated: 'Validated',
        pending: 'Pending',
        receipt: 'Receipt',
        generateReceipt: 'Generate Receipt',
        downloadReceipt: 'Download Receipt'
      },
      // Settings
      settings: {
        title: 'Settings',
        display: 'Display',
        darkMode: 'Dark Mode',
        darkModeDesc: 'Enable dark mode for the interface',
        language: 'Language',
        languageDesc: 'Interface language',
        notifications: 'Notifications',
        emailNotif: 'Email Notifications',
        emailNotifDesc: 'Receive notifications by email',
        pushNotif: 'Push Notifications',
        pushNotifDesc: 'Receive browser notifications',
        security: 'Security',
        twoFactor: 'Two-Factor Authentication',
        twoFactorDesc: 'Add an extra layer of security',
        sessions: 'Active Sessions',
        viewSessions: 'View Sessions',
        save: 'Save Changes',
        cancel: 'Cancel',
        saved: 'Settings saved successfully!'
      },
      // Profile
      profile: {
        title: 'My Profile',
        username: 'Username',
        role: 'Role',
        officeCode: 'Office Code',
        identity: 'Identity',
        connectedSince: 'Connected since',
        changePassword: 'Change Password',
        currentPassword: 'Current Password',
        newPassword: 'New Password',
        confirmPassword: 'Confirm Password',
        update: 'Update'
      },
      // Common
      common: {
        loading: 'Loading...',
        save: 'Save',
        cancel: 'Cancel',
        delete: 'Delete',
        edit: 'Edit',
        view: 'View',
        back: 'Back',
        next: 'Next',
        previous: 'Previous',
        yes: 'Yes',
        no: 'No',
        confirm: 'Confirm',
        error: 'Error',
        success: 'Success',
        warning: 'Warning',
        required: 'Required'
      },
      // Auth
      auth: {
        login: 'Login',
        username: 'Username',
        password: 'Password',
        submit: 'Sign In',
        invalidCredentials: 'Invalid credentials. Please try again.',
        logout: 'Logout'
      }
    }
  };

  constructor() {
    const savedLang = localStorage.getItem('language') as Language;
    if (savedLang && ['fr', 'ar', 'en'].includes(savedLang)) {
      this.currentLang.next(savedLang);
    }
  }

  setLanguage(lang: Language) {
    localStorage.setItem('language', lang);
    this.currentLang.next(lang);
    
    // Set document direction for RTL
    if (lang === 'ar') {
      document.documentElement.setAttribute('dir', 'rtl');
      document.documentElement.setAttribute('lang', 'ar');
    } else {
      document.documentElement.setAttribute('dir', 'ltr');
      document.documentElement.setAttribute('lang', lang);
    }
  }

  getLanguage(): Language {
    return this.currentLang.value;
  }

  isRTL(): boolean {
    return this.currentLang.value === 'ar';
  }

  translate(key: string): string {
    const keys = key.split('.');
    let value: any = this.translations[this.currentLang.value];
    
    for (const k of keys) {
      if (value && typeof value === 'object' && k in value) {
        value = value[k];
      } else {
        return key; // Return key if translation not found
      }
    }
    
    return typeof value === 'string' ? value : key;
  }

  t(key: string): string {
    return this.translate(key);
  }
}
