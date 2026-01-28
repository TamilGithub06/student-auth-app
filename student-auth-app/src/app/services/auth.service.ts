import { Injectable } from '@angular/core';
import { Student } from '../models/student.model';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  constructor() {}

  login(email: string, password: string) {
    // Mock login logic
    console.log('Login attempt:', { email, password });
    return { success: true, message: 'Login successful' };
  }

  signup(student: Student, password: string) {
    // Mock signup logic
    console.log('Signup attempt:', { student, password });
    return { success: true, message: 'Account created successfully' };
  }

  logout() {
    // Mock logout logic
    console.log('User logged out');
  }

  isAuthenticated(): boolean {
    // Mock authentication check
    return !!localStorage.getItem('authToken');
  }
}
