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
        subtitle: 'Liste des paiements enregistrés et leur statut',
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
        partial: 'Partiel',
        totalAmount: 'Montant Total',
        receipt: 'Reçu',
        generateReceipt: 'Générer Reçu',
        downloadReceipt: 'Télécharger Reçu',
        noPayments: 'Aucun paiement trouvé'
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
      },
      // Debits
      debit: {
        title: 'Gestion des Débits Trimestriels',
        subtitle: 'Liste des débits générés et leur statut',
        generate: 'Générer un Débit',
        number: 'Numéro',
        employer: 'Employeur',
        period: 'Période',
        dateGeneration: 'Date Génération',
        amount: 'Montant (TND)',
        status: 'Statut',
        validated: 'Validé',
        pending: 'En attente'
      },
      // Table & Actions
      table: {
        actions: 'Actions',
        search: 'Rechercher',
        reset: 'Réinitialiser',
        exportPdf: 'Exporter PDF',
        noData: 'Aucune donnée disponible',
        showing: 'Affichage de',
        to: 'à',
        of: 'sur',
        results: 'résultats',
        next: 'Suivant',
        previous: 'Précédent'
      },
      // Quick actions
      quickActions: {
        newEmployer: 'Nouvel Employeur',
        newAffiliation: 'Nouvelle Affiliation',
        generateDebit: 'Générer Débit',
        newPayment: 'Nouveau Paiement',
        convertSalary: 'Convertir Salaire'
      },
      // Activities
      activities: {
        affiliations: 'affiliation(s) enregistrée(s)',
        totalPayments: 'Total paiements',
        activeEmployers: 'employeur(s) actif(s)',
        pendingDebits: 'débit(s) en attente',
        recent: 'Récent',
        current: 'Actuel',
        toProcess: 'À traiter'
      },
      // Forms
      forms: {
        backToList: 'Retour à la liste',
        save: 'Enregistrer',
        cancel: 'Annuler',
        required: 'Obligatoire',
        selectOption: 'Sélectionner',
        // Payment form
        registerPayment: 'Enregistrer un Paiement',
        registerPaymentDesc: 'Enregistrement d\'un nouveau paiement de cotisations',
        selectDebit: 'Sélection du Débit',
        debitToPay: 'Débit à Payer',
        selectDebitPlaceholder: 'Sélectionner un débit',
        paymentInfo: 'Informations du Paiement',
        paymentDate: 'Date de Paiement',
        paymentMode: 'Mode de Paiement',
        bankTransfer: 'Virement Bancaire',
        cash: 'Espèces',
        check: 'Chèque',
        transactionRef: 'Référence de Transaction',
        notes: 'Notes / Commentaires',
        registerPaymentBtn: 'Enregistrer le Paiement',
        // Debit form
        generateDebit: 'Générer un Débit Trimestriel',
        generateDebitDesc: 'Création d\'un nouveau débit pour un employeur',
        debitInfo: 'Informations du Débit',
        selectEmployer: 'Sélectionner un employeur',
        trimester: 'Trimestre',
        year: 'Année',
        generateDebitBtn: 'Générer le Débit',
        // Employer form
        newEmployer: 'Nouvel Employeur',
        newEmployerDesc: 'Enregistrement d\'un nouvel employeur régime 500 ou 510',
        regimeType: 'Type de Régime',
        regime500: 'Régime 500',
        regime500Desc: 'Employeurs tunisiens',
        regime510: 'Régime 510',
        regime510Desc: 'Employeurs étrangers',
        companyInfo: 'Informations de l\'Entreprise',
        legalName: 'Raison Sociale',
        tradeName: 'Nom Commercial',
        country: 'Pays',
        legalForm: 'Forme Juridique',
        coordinates: 'Coordonnées',
        address: 'Adresse',
        phone: 'Téléphone',
        email: 'Email',
        // Affiliation form
        newAffiliation: 'Nouvelle Affiliation',
        newAffiliationDesc: 'Enregistrement d\'une nouvelle affiliation employé',
        employerSelection: 'Sélection de l\'Employeur',
        employeeInfo: 'Informations de l\'Employé',
        firstName: 'Prénom',
        lastName: 'Nom',
        birthPlace: 'Lieu de Naissance',
        birthDate: 'Date de Naissance',
        gender: 'Sexe',
        nationality: 'Nationalité',
        socialSecurityNumber: 'Numéro Sécurité Sociale (pays d\'origine)',
        passportNumber: 'Numéro Passeport',
        employmentInfo: 'Informations d\'Emploi',
        startDate: 'Date de Début',
        endDate: 'Date de Fin (si CDD)',
        contractType: 'Type de Contrat',
        position: 'Poste',
        grossSalary: 'Salaire Mensuel Brut',
        residenceCountry: 'Pays de Résidence',
        city: 'Ville',
        registerAffiliation: 'Enregistrer l\'Affiliation'
      },
      // Salary converter
      salary: {
        title: 'Convertisseur de Salaire',
        subtitle: 'Convertir un salaire étranger en Dinar Tunisien et calculer les cotisations',
        conversionSection: 'Conversion de Devise',
        sourceCurrency: 'Devise Source',
        selectCurrency: 'Sélectionner une devise',
        exchangeRate: 'Taux de Change',
        sourceAmount: 'Montant Source',
        convert: 'Convertir',
        conversionResult: 'Résultat de Conversion',
        convertedAmount: 'Montant Converti',
        contributionDetails: 'Détail des Cotisations CNSS',
        grossSalary: 'Salaire Brut',
        employeeContribution: 'Cotisation Salariale',
        employerContribution: 'Cotisation Patronale',
        totalContribution: 'Total Cotisations',
        netSalary: 'Salaire Net',
        totalCost: 'Coût Total Employeur'
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
        subtitle: 'قائمة المدفوعات المسجلة وحالتها',
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
        partial: 'جزئي',
        totalAmount: 'المبلغ الإجمالي',
        receipt: 'الإيصال',
        generateReceipt: 'إنشاء إيصال',
        downloadReceipt: 'تحميل الإيصال',
        noPayments: 'لم يتم العثور على مدفوعات'
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
      },
      // Debits
      debit: {
        title: 'إدارة الديون الفصلية',
        subtitle: 'قائمة الديون المنشأة وحالتها',
        generate: 'إنشاء دين',
        number: 'الرقم',
        employer: 'صاحب العمل',
        period: 'الفترة',
        dateGeneration: 'تاريخ الإنشاء',
        amount: 'المبلغ (دينار)',
        status: 'الحالة',
        validated: 'تم التحقق',
        pending: 'قيد الانتظار'
      },
      // Table & Actions
      table: {
        actions: 'الإجراءات',
        search: 'بحث',
        reset: 'إعادة تعيين',
        exportPdf: 'تصدير PDF',
        noData: 'لا توجد بيانات متاحة',
        showing: 'عرض',
        to: 'إلى',
        of: 'من',
        results: 'نتائج',
        next: 'التالي',
        previous: 'السابق'
      },
      // Quick actions
      quickActions: {
        newEmployer: 'صاحب عمل جديد',
        newAffiliation: 'انتماء جديد',
        generateDebit: 'إنشاء دين',
        newPayment: 'دفعة جديدة',
        convertSalary: 'تحويل الراتب'
      },
      // Activities
      activities: {
        affiliations: 'انتماء(ات) مسجلة',
        totalPayments: 'إجمالي المدفوعات',
        activeEmployers: 'صاحب(ة) عمل نشط',
        pendingDebits: 'دين(ديون) معلقة',
        recent: 'حديث',
        current: 'حالي',
        toProcess: 'للمعالجة'
      },
      // Forms
      forms: {
        backToList: 'العودة إلى القائمة',
        save: 'حفظ',
        cancel: 'إلغاء',
        required: 'مطلوب',
        selectOption: 'اختيار',
        // Payment form
        registerPayment: 'تسجيل دفعة',
        registerPaymentDesc: 'تسجيل دفعة اشتراكات جديدة',
        selectDebit: 'اختيار الدين',
        debitToPay: 'الدين المراد دفعه',
        selectDebitPlaceholder: 'اختر دين',
        paymentInfo: 'معلومات الدفع',
        paymentDate: 'تاريخ الدفع',
        paymentMode: 'طريقة الدفع',
        bankTransfer: 'تحويل بنكي',
        cash: 'نقدي',
        check: 'شيك',
        transactionRef: 'مرجع المعاملة',
        notes: 'ملاحظات / تعليقات',
        registerPaymentBtn: 'تسجيل الدفعة',
        // Debit form
        generateDebit: 'إنشاء دين فصلي',
        generateDebitDesc: 'إنشاء دين جديد لصاحب عمل',
        debitInfo: 'معلومات الدين',
        selectEmployer: 'اختر صاحب عمل',
        trimester: 'الفصل',
        year: 'السنة',
        generateDebitBtn: 'إنشاء الدين',
        // Employer form
        newEmployer: 'صاحب عمل جديد',
        newEmployerDesc: 'تسجيل صاحب عمل جديد نظام 500 أو 510',
        regimeType: 'نوع النظام',
        regime500: 'النظام 500',
        regime500Desc: 'أصحاب العمل التونسيون',
        regime510: 'النظام 510',
        regime510Desc: 'أصحاب العمل الأجانب',
        companyInfo: 'معلومات الشركة',
        legalName: 'الاسم القانوني',
        tradeName: 'الاسم التجاري',
        country: 'البلد',
        legalForm: 'الشكل القانوني',
        coordinates: 'بيانات الاتصال',
        address: 'العنوان',
        phone: 'الهاتف',
        email: 'البريد الإلكتروني',
        // Affiliation form
        newAffiliation: 'انتماء جديد',
        newAffiliationDesc: 'تسجيل انتماء موظف جديد',
        employerSelection: 'اختيار صاحب العمل',
        employeeInfo: 'معلومات الموظف',
        firstName: 'الاسم الأول',
        lastName: 'اسم العائلة',
        birthPlace: 'مكان الولادة',
        birthDate: 'تاريخ الولادة',
        gender: 'الجنس',
        nationality: 'الجنسية',
        socialSecurityNumber: 'رقم الضمان الاجتماعي (بلد المنشأ)',
        passportNumber: 'رقم جواز السفر',
        employmentInfo: 'معلومات التوظيف',
        startDate: 'تاريخ البدء',
        endDate: 'تاريخ الانتهاء (إذا كان عقد محدد المدة)',
        contractType: 'نوع العقد',
        position: 'المنصب',
        grossSalary: 'الراتب الشهري الإجمالي',
        residenceCountry: 'بلد الإقامة',
        city: 'المدينة',
        registerAffiliation: 'تسجيل الانتماء'
      },
      // Salary converter
      salary: {
        title: 'محول الرواتب',
        subtitle: 'تحويل راتب أجنبي إلى الدينار التونسي وحساب الاشتراكات',
        conversionSection: 'تحويل العملات',
        sourceCurrency: 'العملة المصدر',
        selectCurrency: 'اختر عملة',
        exchangeRate: 'سعر الصرف',
        sourceAmount: 'المبلغ المصدر',
        convert: 'تحويل',
        conversionResult: 'نتيجة التحويل',
        convertedAmount: 'المبلغ المحول',
        contributionDetails: 'تفاصيل اشتراكات CNSS',
        grossSalary: 'الراتب الإجمالي',
        employeeContribution: 'اشتراك الموظف',
        employerContribution: 'اشتراك صاحب العمل',
        totalContribution: 'إجمالي الاشتراكات',
        netSalary: 'الراتب الصافي',
        totalCost: 'التكلفة الإجمالية لصاحب العمل'
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
