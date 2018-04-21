<template>
    <div>
        <div class="col-sm-12 col-md-12">
            <div class="card">
                <div class="card-body">
                    <div class="col-md-12 mb-2">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#home" role="tab" aria-controls="home">Studenti</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#profile" role="tab" aria-controls="profile">Profesori</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="home" role="tabpanel">
                                <div class="row">
                                    <user v-for="user in users" :key="user.id" :user="user"></user>
                                </div>
                            </div>
                            <div class="tab-pane" id="profile" role="tabpanel">
                                <div class="row">
                                    <user v-for="user in teachers" :key="user.id" :user="user"></user>
                                </div>
                            </div>
                        </div>
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
        props: ['users', 'teachers'],
        components: {
            User
        },
        created() {
            console.log(this.users, this.teachers, 'users');

        }
    }
</script>