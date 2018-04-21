<template>
    <div class="card">
        <div class="card-header">
            <i class="fa fa-align-justify"></i> Users
        </div>
        <div class="card-body">
            {{  }}
            <ul class="list-group">
                <li v-for="user in users" class="list-group-item" :key="user.id"
                    v-bind:class="{ active: user.id == currentUser.id }">
                    <a :href="'/privateChat/' + user.id">{{ user.full_name }}</a>
                    <span class="badge badge-light">{{ user.roles[0].name }}</span>
                </li>
            </ul>
        </div>
    </div>
</template>


<style>
    .list-group-item.active a {
        color: white;
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

        }
    }
</script>
