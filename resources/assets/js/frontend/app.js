
/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('../bootstrap');
require('../plugins');

window.Vue = require('vue');

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

Vue.component('example-component', require('./components/ExampleComponent.vue'));
Vue.component('test-component', require('./components/TestComponent.vue'));
Vue.component('add-question', require('./components/questions/AddQuestion.vue'));
Vue.component('search', require('./components/Search.vue'));
Vue.component('questions-list', require('./components/questions/List.vue'));
Vue.component('chat', require('./components/Chat/Chat.vue'));
Vue.component('question-layout', require('./components/questions/single/QuestionLayout.vue'));
Vue.component('add-comment', require('./components/comments/AddComment.vue'));
Vue.component('comments-list', require('./components/comments/List.vue'));
Vue.component('users-list', require('./components/users/UsersList.vue'));
Vue.component('user-page', require('./components/users/UserPage.vue'));
import Vue           from 'vue'
import Notifications from 'vue-notification'

Vue.use(Notifications)

const app = new Vue({
    el: '#app'
});
