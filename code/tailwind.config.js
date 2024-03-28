/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./src/**/*.{html,js}"],
  theme: {
    extend: {
      colors: {
        // primary: "#EC6932",
        // secondary: "#081F50",

        primary: {
          50: "#F5B498",
          100: "#F3A584",
          200: "#F1966F",
          300: "#EF875B",
          400: "#ED7846",
          500: "#EC6932",
          600: "#D45E2D",
          700: "#BC5428",
          800: "#A54923",
          900: "#8D3F1E",
        },
        secondary: {
          50: "#838FA7",
          100: "#6A7896",
          200: "#526284",
          300: "#394B73",
          400: "#203561",
          500: "#081F50",
          600: "#071B48",
          700: "#061840",
          800: "#051538",
          900: "#041230",
        },
      },
    },
  },
  plugins: [],
};
