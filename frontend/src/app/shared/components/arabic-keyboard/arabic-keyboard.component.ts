import { Component, EventEmitter, Output } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-arabic-keyboard',
  standalone: true,
  imports: [CommonModule],
  template: `
    <div class="arabic-keyboard bg-gray-100 p-3 rounded-lg shadow-lg border" *ngIf="isOpen">
      <div class="flex justify-between items-center mb-2">
        <span class="text-sm font-semibold text-gray-700">لوحة المفاتيح العربية</span>
        <button type="button" (click)="close()" class="text-gray-500 hover:text-gray-700">
          <span class="material-icons text-sm">close</span>
        </button>
      </div>
      <div class="grid grid-cols-11 gap-1">
        <button *ngFor="let key of keys" type="button"
                (click)="onKeyPress(key)"
                class="p-2 bg-white hover:bg-blue-100 rounded border text-lg font-arabic transition-colors">
          {{ key }}
        </button>
      </div>
      <div class="flex gap-2 mt-2">
        <button type="button" (click)="onKeyPress(' ')" 
                class="flex-1 p-2 bg-white hover:bg-blue-100 rounded border text-sm">
          مسافة
        </button>
        <button type="button" (click)="onBackspace()" 
                class="p-2 bg-red-100 hover:bg-red-200 rounded border text-sm">
          <span class="material-icons text-sm">backspace</span>
        </button>
      </div>
    </div>
  `,
  styles: [`
    .arabic-keyboard {
      direction: rtl;
      max-width: 400px;
    }
    .font-arabic {
      font-family: 'Arial', 'Tahoma', sans-serif;
    }
  `]
})
export class ArabicKeyboardComponent {
  @Output() keyPress = new EventEmitter<string>();
  @Output() backspace = new EventEmitter<void>();
  @Output() closed = new EventEmitter<void>();
  
  isOpen = false;

  keys: string[] = [
    'ض', 'ص', 'ث', 'ق', 'ف', 'غ', 'ع', 'ه', 'خ', 'ح', 'ج',
    'ش', 'س', 'ي', 'ب', 'ل', 'ا', 'ت', 'ن', 'م', 'ك', 'ط',
    'ذ', 'ء', 'ؤ', 'ر', 'لا', 'ى', 'ة', 'و', 'ز', 'ظ', 'د',
    'ئ', 'أ', 'إ', 'آ', 'ـ', '،', '.', '؟', '!', '-', ':'
  ];

  open() {
    this.isOpen = true;
  }

  close() {
    this.isOpen = false;
    this.closed.emit();
  }

  toggle() {
    this.isOpen = !this.isOpen;
  }

  onKeyPress(key: string) {
    this.keyPress.emit(key);
  }

  onBackspace() {
    this.backspace.emit();
  }
}
