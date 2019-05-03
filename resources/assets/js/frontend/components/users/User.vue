<template>
    <div class="col-md-4 col-sm-1 mb-1 col-sm-1">
        <div class="card" @click="goToUser()" v-if="user.user">
            <div class="card-header">
                <a :href="'/privateChat/' + user.user.id">{{ user.user.full_name }}</a>
                <span class="badge badge-success" v-if="checkOnline(user.user.last_activity)">Online</span>
                <span class="badge badge-danger" v-if="!checkOnline(user.user.last_activity)">Offline</span>
            </div>
            <div class="card-body chat-body">
                <p class="user-avatar">
                    <img src="images/avatar.png" alt="" >
                    <!--<img :src="url" :alt="user.user.full_name" style="width: 100%;">-->
                </p>

                <div class="box about-box" v-if="user.disciplines.length > 0">
                    <p>
                        Interese: <br />
                        <span class="badge badge-primary" v-for="discipline in user.disciplines">{{discipline.name}}</span>
                    </p>
                </div>
            </div>
            <div class="card-footer">
                <span><i class="fa fa-star"></i>  &nbsp; {{ user.user.reputation }}</span>
            </div>
        </div>
    </div>
</template>
<script>
    export default {
        name: 'User',
        props: ['user'],
        computed: {
            url() {
                return `https://avatar.tobi.sh/yellow-darkred.svg?text=${this.user.user.first_name}%20${this.user.user.last_name}`
            }
        },
        methods: {
            goToUser() {
                location.href = '/users-view/' + this.user.user.id;
            },

            checkOnline(date) {
                const ONE_MIN = 1*60*1000;
                return (new Date() - new Date(date)) < ONE_MIN;
            }
        }
    }
</script>
<style lang="scss">
   .user {
       margin: 5px;
       border-radius: 20px;
       &:hover {
           border-bottom: 1px solid #ccc;
           cursor: pointer;

           -webkit-box-shadow: -1px -4px 61px -9px rgba(61,196,28,1);
           -moz-box-shadow: -1px -4px 61px -9px rgba(61,196,28,1);
           box-shadow: -1px -4px 61px -9px rgba(61,196,28,1);
       }

       img {
           float: left;

           with: 100px;
           height: 100px;
           border-radius: 100%;


       }

       .about-box {
           float: right;
           .preferinte {
               font-style: italic;
               color: #1ebb6e;
           }
       }

       .user-footer {
           background: transparent;
           .ratio {
               i {
                   color: #159e6e;
               }
           }
       }

   }

   .user-avatar{
       text-align: center;
   }
</style>
