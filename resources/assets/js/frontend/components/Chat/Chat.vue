<template>
    <div>
        <h1 class="text-center">Chat Application</h1>
        <message :messages="messages"></message>
        <sent-message v-on:messagesent="addMessage" :user="user"></sent-message>
    </div>
</template>

<script>

    Vue.component('message', require('./Message.vue'));
    Vue.component('sent-message', require('./Sent.vue'));

    export default {
        props: ['user'],
        data() {
            return {
                messages: []
            }
        },
        mounted(){
            this.fetchMessages();
            Echo.private('chat')
                .listen('MessageSentEvent', (e) => {
                    this.messages.push({
                        message: e.message.message,
                        user: e.user
                    })
                })
        },
        methods: {
            addMessage(message) {
                this.messages.push(message)
                axios.post('/messages', message).then(response => {
                    //console.log(response)
                })
            },
            fetchMessages() {
                axios.get('/messages').then(response => {
                    this.messages = response.data
                })
            }
        }
    }
</script>
