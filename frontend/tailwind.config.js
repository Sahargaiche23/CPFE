/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./src/**/*.{html,ts}",
  ],
  theme: {
    extend: {
      colors: {
        'cnss-primary': '#8B1538',
        'cnss-secondary': '#2E7D32',
        'cnss-accent': '#00695C',
        'cnss-light': '#F5F5F5',
        'cnss-dark': '#212121',
      },
      fontFamily: {
        'sans': ['Inter', 'system-ui', 'sans-serif'],
      },
    },
  },
  plugins: [],
}
