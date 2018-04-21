<template>
    <div @click="goToUser()" class="user col-md-3 card">
        <div class="card-body">
            <img :src="url" :alt="user.first_name">
            <div class="box about-box" v-if="user.disciplines.length > 0">
                <p class="preferinte">Preferinte</p>
                <ul class="list-group">
                    <li class="list-item" v-for="discipline in user.disciplines">{{discipline.name}}</li>
                </ul>
            </div>

        </div>
        <div class="card-footer user-footer">
            <a class="pretty"> {{ user.first_name }} {{ user.last_name }} </a>
            <p><i class="fa fa-star"></i>  &nbsp; {{ user.user.reputation }}</p>
        </div>
    </div>
</template>
<script>
    export default {
        name: 'User',
        props: ['user'],
        computed: {
            url() {
                return `https://avatar.tobi.sh/Vega-Brown.svg?text=${this.user.user.first_name}${this.user.user.last_name}`
            }
        },
        methods: {
            goToUser() {
                location.href = '/user-view/' + this.user.user.id;
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
</style>