import Vue from 'vue'
import Router from 'vue-router'
import App from '@/App'
import { DEFAULT_LANGUAGE, SUPPORTED_LANGUAGES } from '@/constants/languages'
import i18n from '@/i18n'
import Contact from '@/views/Contact'
import Home from '@/views/Home'
import News from '@/views/News'
import Product from '@/views/Product'
import Team from '@/views/Team'

Vue.use(Router)

const getLocaleByLocalStorage = () => {
  let locale = localStorage.getItem('locale')
  if (!SUPPORTED_LANGUAGES.includes(locale)) {
    locale = DEFAULT_LANGUAGE
    localStorage.setItem('locale', locale)
  }
  return `${locale}/`
}

export default new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/:lang',
      component: App,
      beforeEnter (to, from, next) {
        const lang = to.params.lang
        if (!SUPPORTED_LANGUAGES.includes(lang)) {
          i18n.locale = DEFAULT_LANGUAGE
          Vue.config.lang = DEFAULT_LANGUAGE
          localStorage.setItem('locale', DEFAULT_LANGUAGE)
          return next(`${DEFAULT_LANGUAGE}/`)
        }
        if (i18n.locale !== lang) {
          i18n.locale = lang
          Vue.config.lang = lang
          localStorage.setItem('locale', lang)
        }
        return next()
      },
      children: [
        {
          path: '',
          name: 'Home',
          component: Home
        },
        {
          path: 'product',
          name: 'Product',
          component: Product
        },
        {
          path: 'team',
          name: 'Team',
          component: Team
        },
        {
          path: 'news',
          name: 'News',
          component: News
        },
        {
          path: 'contact',
          name: 'Contact',
          component: Contact
        },
        {
          path: '*',
          redirect: '/'
        }
      ]
    },
    {
      path: '*',
      redirect: getLocaleByLocalStorage()
    }
  ]
})
