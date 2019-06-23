<template>
    <div class="card">
        <div class="card-header">
            <i class="fa fa-align-justify"></i> Utilizatori
        </div>
        <div class="card-body">
            {{  }}
            <ul class="list-group">
                <li v-for="user in users" class="list-group-item" :key="user.id"
                    v-bind:class="{ active: user.id == currentUser.id }">
                    <a :href="'/privateChat/' + user.id">{{ user.full_name }}</a>
<!--                    <span class="badge badge-light">{{ user.roles[0].name }}</span>-->
                    <span class="float-right" v-bind:class="{ online: checkOnline(user.last_activity), offline: !checkOnline(user.last_activity) }">&#9679;</span>
                </li>
            </ul>
        </div>
    </div>
</template>


<style scoped>
    .list-group-item.active a {
        color: white;
    }
    .online {
        color: lightgreen;
    }
    .offline {
        color: black;
    }
    .card-body {
        height: 528px;
        overflow: scroll;
    }
</style>

<script>

    export default {
        props: ['users', 'chatWithUser'],
        data() {
            return {
                currentUser: this.chatWithUser,

            }
        },
        mounted(){

        },
        methods: {
            checkOnline(date) {
                const ONE_MIN = 1*60*1000;
                return (new Date() - new Date(date)) < ONE_MIN;
            }
        }
    }
</script>
