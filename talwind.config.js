module.exports = {
  mode: 'jit',
  purge: ['./index.html', './src/**/*.{vue,js,ts,jsx,tsx}'],
  theme: {
    extend: {
      fontFamily: {
        genos: ['Genos', 'sans-serif'],
        productSans: ['Product Sans', 'sans-serif'],

      },
      colors: {
        primary: '#007bff',
        secondary: '#6c757d',
        success: '#28a745',
        danger: '#dc2626',
        warning: '#ffc107',
        info: '#17a2b8',
        light: '#f8f9fa',
        dark: '#343a40',
        white: '#ffffff',
        black: '#000000',
        gray: '#6c757d',
        grayDark: '#343a40',
        grayLight: '#f8f9fa',
        gray100: '#f8f9fa',
        gray200: '#e9ecef',

    },
  },
  variants: {},
  plugins: [],
}
