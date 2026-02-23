/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./src/**/*.{html,ts}",
  ],
  theme: {
    extend: {
      colors: {
        'cnss-primary': '#1E40AF',
        'cnss-secondary': '#1E3A8A',
        'cnss-accent': '#3B82F6',
        'cnss-light': '#EFF6FF',
        'cnss-dark': '#1F2937',
      },
      fontFamily: {
        'sans': ['Inter', 'system-ui', 'sans-serif'],
      },
    },
  },
  plugins: [],
}
