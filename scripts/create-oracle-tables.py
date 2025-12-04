#!/usr/bin/env python3
"""
Script Python pour créer les tables Oracle sans sqlplus
Nécessite: pip install cx_Oracle
"""

import sys

try:
    import cx_Oracle
except ImportError:
    print("❌ Module cx_Oracle non installé!")
    print("   Installez-le avec: pip3 install cx_Oracle")
    sys.exit(1)

def create_tables():
    """Crée les tables Oracle avec des données de test"""
    
    print("🔧 Connexion à Oracle...")
    
    try:
        # Connexion à Oracle
        connection = cx_Oracle.connect(
            user="COPT",
            password="copt123",
            dsn="localhost:1521/XEPDB1"
        )
        
        cursor = connection.cursor()
        print("✅ Connecté à Oracle!")
        
        # Supprimer la table si elle existe
        print("\n1️⃣  Suppression de l'ancienne table EMPLOYEUR...")
        try:
            cursor.execute("DROP TABLE EMPLOYEUR CASCADE CONSTRAINTS")
            print("   Table supprimée")
        except cx_Oracle.DatabaseError:
            print("   Table n'existait pas")
        
        # Créer la table EMPLOYEUR
        print("\n2️⃣  Création de la table EMPLOYEUR...")
        cursor.execute("""
            CREATE TABLE EMPLOYEUR (
                EMP_MAT NUMBER(10) NOT NULL,
                EMP_CLE NUMBER(5) NOT NULL,
                NOM_COMMERCIAL VARCHAR2(200),
                RAISON_SOCIALE VARCHAR2(200),
                REGIME VARCHAR2(10),
                PAYS VARCHAR2(100),
                ADRESSE VARCHAR2(500),
                TELEPHONE VARCHAR2(50),
                EMAIL VARCHAR2(100),
                STATUT VARCHAR2(20),
                DATE_CREATION DATE,
                CONSTRAINT PK_EMPLOYEUR PRIMARY KEY (EMP_MAT, EMP_CLE)
            )
        """)
        print("✅ Table EMPLOYEUR créée")
        
        # Insérer des données de test
        print("\n3️⃣  Insertion des données de test...")
        
        test_data = [
            (500380, 54, 'Test Company France', 'Entreprise Test SARL', '500', 'France', 
             '123 Rue de Paris, 75001 Paris', '+33123456789', 'contact@testcompany.fr', 'Actif'),
            (510245, 2, 'IntCorp Deutschland', 'International Corporation GmbH', '510', 'Allemagne',
             'Berliner Str. 45, 10115 Berlin', '+4930123456', 'info@intcorp.de', 'Actif'),
            (500380, 55, 'TechSol France', 'Tech Solutions SARL', '500', 'France',
             '456 Avenue Tech, 69000 Lyon', '+33987654321', 'contact@techsol.fr', 'Inactif')
        ]
        
        for data in test_data:
            cursor.execute("""
                INSERT INTO EMPLOYEUR (
                    EMP_MAT, EMP_CLE, NOM_COMMERCIAL, RAISON_SOCIALE, REGIME, PAYS,
                    ADRESSE, TELEPHONE, EMAIL, STATUT, DATE_CREATION
                ) VALUES (
                    :1, :2, :3, :4, :5, :6, :7, :8, :9, :10, SYSDATE
                )
            """, data)
            print(f"   ✅ {data[2]} ajouté")
        
        # Commit
        connection.commit()
        print("\n4️⃣  Commit effectué")
        
        # Vérification
        cursor.execute("SELECT COUNT(*) FROM EMPLOYEUR")
        count = cursor.fetchone()[0]
        print(f"\n✅ Table EMPLOYEUR créée avec {count} enregistrements!")
        
        # Afficher les données
        print("\n📊 Données insérées:")
        cursor.execute("""
            SELECT EMP_MAT, EMP_CLE, NOM_COMMERCIAL, STATUT 
            FROM EMPLOYEUR 
            ORDER BY EMP_MAT, EMP_CLE
        """)
        
        for row in cursor.fetchall():
            print(f"   • {row[0]}-{row[1]}: {row[2]} ({row[3]})")
        
        cursor.close()
        connection.close()
        
        return True
        
    except cx_Oracle.Error as error:
        print(f"\n❌ Erreur Oracle: {error}")
        return False

if __name__ == "__main__":
    print("=" * 50)
    print("  Création des tables Oracle pour CNSS")
    print("=" * 50)
    print()
    
    if create_tables():
        print("\n" + "=" * 50)
        print("✅ Configuration Oracle terminée!")
        print("=" * 50)
        sys.exit(0)
    else:
        sys.exit(1)
