/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./src/**/*.{html,ts}",
  ],
  theme: {
    extend: {
      colors: {
        'cnss-primary': '#BE185D',
        'cnss-secondary': '#9D174D',
        'cnss-accent': '#EC4899',
        'cnss-light': '#FFF1F2',
        'cnss-dark': '#1F2937',
      },
      fontFamily: {
        'sans': ['Inter', 'system-ui', 'sans-serif'],
      },
    },
  },
  plugins: [],
}
