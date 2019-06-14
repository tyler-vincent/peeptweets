import Vue from 'vue'
import App from '../app.vue'
import axios from 'axios'
import VueAxios from 'vue-axios'
import '../css/app.css'

Vue.use(VueAxios, axios)
// Make sure we forward the Rails generated CSRF Token on with each request
axios.defaults.headers.common['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content')


document.addEventListener('DOMContentLoaded', () => {
  const el = document.body.appendChild(document.createElement('app'))
  const app = new Vue({
    el,
    render: h => h(App)
  })
})