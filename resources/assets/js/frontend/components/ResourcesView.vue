<template>
    <div class="card">
        <div class="card-header">
            <i class="icon-notebook icons font-2xl d- mt-4"></i> Resurse care te pot ajuta in domeniul de studiu
            <button type="button" class="btn btn-outline-info btn-lg btn-block pull-right add-book">Adauga cartea ta</button>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-4">
                    <div class="list-group" id="list-tab" role="tablist">
                        <a @click="setSearch('romane')" class="list-group-item list-group-item-action active show" id="list-home-list" data-toggle="tab" href="#list-home" role="tab" aria-controls="list-home" aria-selected="true">Romana</a>
                        <a @click="setSearch('fizica')" class="list-group-item list-group-item-action" id="list-profile-list" data-toggle="tab" href="#list-profile" role="tab" aria-controls="list-profile" aria-selected="false">Fizica</a>
                        <a @click="setSearch('matematica')" class="list-group-item list-group-item-action" id="list-messages-list" data-toggle="tab" href="#list-messages" role="tab" aria-controls="list-messages">Matematica</a>
                        <a @click="setSearch('mecanic')" class="list-group-item list-group-item-action" id="list-messages-list-2" data-toggle="tab" href="#list-messages" role="tab" aria-controls="list-messages">Mecanica</a>
                        <a @click="setSearch('chimie')" class="list-group-item list-group-item-action" id="list-messages-list-3" data-toggle="tab" href="#list-messages" role="tab" aria-controls="list-messages">Chimie</a>
                        <a class="list-group-item list-group-item-action" id="list-settings-list" data-toggle="tab" href="#list-settings" role="tab" aria-controls="list-settings">Materiale Video</a>
                    </div>
                </div>
                <div class="col-8">
                    <div class="tab-content" id="nav-tabContent">
                        <div class="tab-pane fade active show" id="list-home" role="tabpanel" aria-labelledby="list-home-list">
                            <books :books="books"></books>
                        </div>
                        <div class="tab-pane fade" id="list-profile" role="tabpanel" aria-labelledby="list-profile-list">
                            <books :books="books"></books>
                        </div>
                        <div class="tab-pane fade" id="list-messages" role="tabpanel" aria-labelledby="list-messages-list">
                            <books :books="books"></books>
                        </div>
                        <div class="tab-pane fade" id="list-settings" role="tabpanel" aria-labelledby="list-settings-list">
                            <iframe width="450" height="315" src="https://www.youtube.com/embed/neisO88bTHQ?start=30" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="card-footer">
        </div>
    </div>
</template>

<script>
    import API from '../api';
    import Books from './Books.vue'
    export default {
        name: 'ResourcesView',
        components: {
            Books
        },
        data() {
            return {
                books: []
            }
        },
        async created() {
            const {data} = await API.Question.books('romana');
            this.books = data.items;
            console.log(data);

        },
        mounted() {
            console.log('Component mounted.')
        },
        methods: {
            async setSearch(type) {
                const {data} = await API.Question.books({q: type});
                this.books = data.items;
            }
        }
    }
</script>
<style lang="scss">
    .add-book {
        width: 200px;
        display: inline-block;
        float: right;
        color: #fec030;
        border-color: #fec030;
        border-radius: 10px;
    }

    .book {
        width: 100px;
        height: 200px;
        text-align: center;
        margin-bottom:30px;

        img {
            border-radius: 20px;
            width:100px;
            height: 180px;
            -webkit-box-shadow: 0px 0px 15px 0px rgba(0,0,0,0.75);
            -moz-box-shadow: 0px 0px 15px 0px rgba(0,0,0,0.75);
            box-shadow: 0px 0px 15px 0px rgba(0,0,0,0.75);

            &:hover {
                cursor: pointer;
                -webkit-box-shadow: 0px 2px 67px 0px rgba(0,0,0,0.75);
                -moz-box-shadow: 0px 2px 67px 0px rgba(0,0,0,0.75);
                box-shadow: 0px 2px 67px 0px rgba(0,0,0,0.75);
            }
        }

        .title {
            font-weight: 600;
            font-size: 10px;
            color: #000;
            text-align: center;
            margin: 0;
        }
        .author {
            font-size: 9px;
            color: #ccc;
            text-align: center;
        }
    }

</style>
