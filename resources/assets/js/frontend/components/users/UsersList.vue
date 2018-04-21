<template>
    <div>
        <div class="col-sm-12 col-md-12">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <user v-for="user in users" :key="user.id" :user="user"></user>
                    </div>
                </div>
                <div class="card-footer">Toti utilizatorii</div>
            </div>
        </div>

    </div>
</template>
<script>
    import User from './User.vue';
    export default {
        name: 'UsersList',
        props: ['users'],
        components: {
            User
        },
        created() {
            console.log(this.users, 'users');

        }
    }
</script>