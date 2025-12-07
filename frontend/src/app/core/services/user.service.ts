import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../../environments/environment';

export interface User {
  id: number;
  username: string;
  email?: string;
  firstName?: string;
  lastName?: string;
  profil: string;
  burCod?: string;
  active: number;
  createdAt?: string;
  updatedAt?: string;
}

export interface CreateUserRequest {
  username: string;
  password: string;
  email?: string;
  firstName?: string;
  lastName?: string;
  profil: string;
  burCode?: string;
  govCode?: number;
}

export interface UpdateUserRequest {
  email?: string;
  firstName?: string;
  lastName?: string;
  profil?: string;
  burCode?: string;
  govCode?: number;
  active?: number;
}

export interface ChangePasswordRequest {
  currentPassword: string;
  newPassword: string;
  confirmPassword: string;
}

export interface AuditLog {
  id: number;
  userId: number;
  username: string;
  action: string;
  description: string;
  ipAddress: string;
  userAgent: string;
  location: string;
  burCode: number;
  success: boolean;
  createdAt: string;
}

export interface Governorate {
  code: number;
  name: string;
  nameAr: string;
  region: string;
}

@Injectable({
  providedIn: 'root'
})
export class UserService {
  private apiUrl = `${environment.apiUrl}/users`;

  constructor(private http: HttpClient) {}

  // ========== GESTION DES UTILISATEURS ==========

  getAll(): Observable<User[]> {
    return this.http.get<User[]>(this.apiUrl);
  }

  getById(id: number): Observable<User> {
    return this.http.get<User>(`${this.apiUrl}/${id}`);
  }

  create(request: CreateUserRequest): Observable<User> {
    return this.http.post<User>(this.apiUrl, request);
  }

  update(id: number, request: UpdateUserRequest): Observable<User> {
    return this.http.put<User>(`${this.apiUrl}/${id}`, request);
  }

  delete(id: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/${id}`);
  }

  toggleStatus(id: number): Observable<any> {
    return this.http.put(`${this.apiUrl}/${id}/toggle-status`, {});
  }

  resetPassword(id: number, newPassword: string): Observable<any> {
    return this.http.put(`${this.apiUrl}/${id}/reset-password`, { newPassword });
  }

  // ========== CHANGEMENT MOT DE PASSE ==========

  changePassword(id: number, request: ChangePasswordRequest): Observable<any> {
    return this.http.put(`${this.apiUrl}/${id}/change-password`, request);
  }

  // ========== LOGS D'AUDIT ==========

  getAuditLogs(page: number = 0, size: number = 50): Observable<any> {
    const params = new HttpParams()
      .set('page', page.toString())
      .set('size', size.toString());
    return this.http.get(`${this.apiUrl}/audit-logs`, { params });
  }

  getUserLogs(userId: number): Observable<AuditLog[]> {
    return this.http.get<AuditLog[]>(`${this.apiUrl}/${userId}/logs`);
  }

  getLogsByBureau(burCode: number): Observable<AuditLog[]> {
    return this.http.get<AuditLog[]>(`${this.apiUrl}/audit-logs/bureau/${burCode}`);
  }

  // ========== GOUVERNORATS ==========

  getGovernorates(): Observable<Governorate[]> {
    return this.http.get<Governorate[]>(`${this.apiUrl}/governorates`);
  }

  // ========== STATISTIQUES ==========

  getStats(): Observable<any> {
    return this.http.get(`${this.apiUrl}/stats`);
  }

  // ========== SESSIONS ==========

  getUserSessions(userId: number): Observable<UserSession[]> {
    return this.http.get<UserSession[]>(`${this.apiUrl}/${userId}/sessions`);
  }

  revokeSession(userId: number, sessionId: number): Observable<any> {
    return this.http.delete(`${this.apiUrl}/${userId}/sessions/${sessionId}`);
  }

  revokeAllOtherSessions(userId: number): Observable<any> {
    return this.http.delete(`${this.apiUrl}/${userId}/sessions`);
  }
}

export interface UserSession {
  id: number;
  userId: number;
  username: string;
  deviceType: string;
  browser: string;
  os: string;
  ipAddress: string;
  location: string;
  createdAt: string;
  lastActivity: string;
  active: boolean;
}
