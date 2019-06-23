<template>
    <div>
        <div class="card">
            <div class="card-header">
                Chat with: <a :href="'/users-view/'+chatWithUser.id">{{ chatWithUser.full_name }}</a>
            </div>
            <div class="card-body chat-body">
                <message :messages="messages"></message>
            </div>
            <div class="card-footer">
                <sent-message v-on:messagesent="addMessage" :user="currentUser"></sent-message>
            </div>
        </div>
    </div>
</template>


<style>
    .chat-body {
        height: 400px;
        overflow: auto;
    }
</style>

<script>

    Vue.component('message', require('./Message.vue'));
    Vue.component('sent-message', require('./Sent.vue'));

    export default {
        props: ['currentUser', 'chatWithUser'],
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
                        sent_by_user: e.sentBy
                    });
                    this.scrollToBottom();
                })
        },
        methods: {
            addMessage(message) {
                axios.post(`/messages/${this.chatWithUser.id}`, message).then(response => {
                    //console.log(response)
                })
            },
            fetchMessages() {
                axios.get(`/messages/${this.chatWithUser.id}`).then(response => {
                    this.messages = response.data;


                    this.scrollToBottom();
                })
            },
            scrollToBottom() {
                setTimeout(() => {
                    const container = document.querySelector(".chat-body");
                    container.scrollTop = container.scrollHeight;
                })
            }
        }
    }
</script>
