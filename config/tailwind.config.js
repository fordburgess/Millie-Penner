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
        kameron: ['Kameron'],
        lexendZetta: ['Lexend Zetta'],
        windowsRegular: ['Windows Regular'],
        orbitron: ['Orbitron'],
        playfair: ['Playfair Display'],
        unifrakturcook: ['UnifrakturCook'],
        questrial: ['Questrial'],
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
