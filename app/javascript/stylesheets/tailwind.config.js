module.exports = {
  purge: [
    './app/views/**/*.html.*',
    './app/javascript/**/*.js',
    './app/helpers/*.rb'
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {},
  },
  variants: {
    extend: {},
  },
  plugins: [
    require('@tailwindcss/forms'),
  ],
}
