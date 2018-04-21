<template>
    <div @click="goToUser()" class="user col-md-3 card">
        <div class="card-body">
            <img :src="url" :alt="user.first_name">
            <div class="box about-box">
                <p class="preferinte">Preferinte</p>
                <ul class="list-group">
                    <li class="list-item">Matematica</li>
                    <li class="list-item">Fizica </li>
                </ul>
            </div>

        </div>
        <div class="card-footer user-footer">
            <a class="pretty"> {{ user.first_name }} {{ user.last_name }} </a>
            <div class="ratio pull-right"><i class="icon-star icons font-2xl d-block mt-4"></i> <strong>120</strong></div>
        </div>
    </div>
</template>
<script>
    export default {
        name: 'User',
        props: ['user'],
        computed: {
            url() {
                return `https://avatar.tobi.sh/Vega-Brown.svg?text=${this.user.first_name[0]}${this.user.last_name[0]}`
            }
        },
        methods: {
            goToUser() {
                location.href = '/users-view/' + this.user.id;
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