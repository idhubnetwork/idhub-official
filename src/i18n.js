import Vue from 'vue'
import VueI18n from 'vue-i18n'
import { DEFAULT_LANGUAGE, FALLBACK_LANGUAGE, SUPPORTED_LANGUAGES } from '@/constants/languages'
import messages from '@/locales/lang'

Vue.use(VueI18n)

const getLocale = () => {
  let locale = window.location.pathname.split('/')[1]
  if (!SUPPORTED_LANGUAGES.includes(locale)) {
    const {language, userLanguage} = window.navigator
    locale = (language || userLanguage).replace('-US', '').replace('ko-', '').replace('zh-', '').toLowerCase()
    if (!SUPPORTED_LANGUAGES.includes(locale)) {
      locale = DEFAULT_LANGUAGE
    }
  }
  Vue.config.lang = locale
  localStorage.setItem('locale', locale)
  return locale
}

export default new VueI18n({
  locale: getLocale(),
  fallbackLocale: FALLBACK_LANGUAGE,
  messages
})
