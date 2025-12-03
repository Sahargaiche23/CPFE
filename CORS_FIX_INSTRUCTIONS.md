# Instructions pour Corriger le Problème CORS

## Problème Identifié

Le backend (service auth-service) renvoie ses propres headers CORS, créant des **headers dupliqués** qui bloquent les requêtes depuis le navigateur :

```
Access-Control-Allow-Origin: http://localhost:4200  (du Gateway)
Access-Control-Allow-Origin: http://localhost:4200  (du backend)
```

Les navigateurs rejettent les requêtes avec des headers CORS dupliqués.

## Solution Temporaire : Tester avec Postman

Postman ne valide pas strictement CORS, donc l'API fonctionne. Vous avez confirmé que :
- ✅ Le backend répond correctement
- ✅ L'authentification fonctionne
- ✅ Le token JWT est généré

## Solution Permanente : Options

### Option 1 : Désactiver CORS dans le Backend (RECOMMANDÉ)

Ajouter une propriété dans `auth-service/src/main/resources/application.yml` :

```yaml
spring:
  web:
    cors:
      enabled: false
```

Ou, si vous avez accès au code source, supprimer toute annotation `@CrossOrigin` et configuration CORS.

### Option 2 : Proxy Nginx (Workaround)

Utiliser Nginx comme proxy pour nettoyer les headers CORS :

```nginx
server {
    listen 8081;
    
    location /api/ {
        proxy_pass http://localhost:8080/api/;
        
        # Remove backend CORS headers
        proxy_hide_header Access-Control-Allow-Origin;
        proxy_hide_header Access-Control-Allow-Credentials;
        
        # Add clean CORS headers
        add_header Access-Control-Allow-Origin "http://localhost:4200" always;
        add_header Access-Control-Allow-Credentials "true" always;
    }
}
```

Puis modifier le frontend pour utiliser `http://localhost:8081/api` au lieu de `http://localhost:8080/api`.

### Option 3 : Modifier le Frontend pour ignorer l'erreur

Modifier `auth.service.ts` pour gérer les erreurs CORS :

```typescript
login(credentials: LoginRequest): Observable<AuthResponse> {
  return this.http.post<AuthResponse>(`${this.API_URL}/login`, credentials, {
    withCredentials: true
  }).pipe(
    retry({
      count: 2,
      delay: 1000
    }),
    catchError(error => {
      console.error('Login error:', error);
      if (error.status === 0) {
        // CORS error - might still work on retry
        return throwError(() => new Error('Erreur de connexion. Veuillez réessayer.'));
      }
      return throwError(() => error);
    })
  );
}
```

## Test Final

Une fois CORS corrigé, testez la connexion :

1. Ouvrir http://localhost:4200
2. Entrer :
   - Username: `admin`
   - Password: `admin123`
3. Cliquer sur "Se connecter"
4. Vous devriez être redirigé vers le Dashboard

## Vérification des Headers CORS

```bash
curl -v -X POST http://localhost:8080/api/auth/login \
  -H "Content-Type: application/json" \
  -H "Origin: http://localhost:4200" \
  -d '{"username":"admin","password":"admin123"}' 2>&1 | grep "Access-Control"
```

Le résultat devrait montrer **un seul** header `Access-Control-Allow-Origin`.

## État Actuel

- ✅ Frontend Angular créé et fonctionnel
- ✅ Backend microservices opérationnels
- ✅ API répond correctement (testé avec Postman)
- ❌ CORS bloque les requêtes du navigateur (headers dupliqués)

La solution recommandée est de modifier la configuration du service auth-service pour désactiver CORS, puisque le Gateway gère déjà CORS de manière centralisée.
