import Vue from 'vue'
import App from './App'
import store from "./store"
import axios from 'axios'
axios.defaults.baseURL = '/host'
Vue.config.productionTip = false
Vue.prototype.$store = store
App.mpType = 'app'
// axios.defaults.withCredentials=true;
const app = new Vue({
    ...App,
	store
})
app.$mount()
