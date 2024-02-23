const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
    },
    colors: {
      blue: "#1D63B5",
      lightblue: "#EBF2FF",
      darkblue: "#164E8F",
      gray: "#969696",
      white: "#ffffff",
      black: "#04030f",
      red: "#A46167",
      lightred: "#F8D7DA",
      darkred: "#9E2B25",
      green: "#2C693A",
      lightgreen: "#D4EDDA"
    }
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
