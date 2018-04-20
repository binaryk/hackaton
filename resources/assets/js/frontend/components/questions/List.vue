<template>
    <div class="col-sm-12 col-xl-12">
        <div class="card">
            <div class="switch-container col-md-12">
                <button type="button" class="col-md-4 float-left btn btn-outline-secondary btn-md btn-">Recente</button>
                <button type="button" class="col-md-4 float-left btn btn-outline-primary btn-md btn-">Dupa interese</button>
                <div class="btn-group show">
                    <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" @click="showInstitutions = !showInstitutions">
                        Selecteaza institutia
                    </button>
                    <div class="dropdown-menu" v-bind:class="{show: showInstitutions}" x-placement="bottom-start" style="position: absolute; transform: translate3d(0px, 35px, 0px); top: 0px; left: 0px; will-change: transform;">
                        <a class="dropdown-item" href="#" v-for="inst in institutions" :key="institution.id">
                            {{ institution.name }}
                        </a>
                    </div>
                </div>
            </div>
            <div class="card-header">
                <i class="fa fa-align-justify"></i> Intrebari
                <small>cele mai recente</small>
            </div>
            <div class="card-body">
                <div class="list-group">

                    <question v-for="q in list" :question="q" :key="q.id"></question>

                </div>
            </div>
        </div>
    </div>
</template>
<script>
    import Question from './Question.vue';
    import API from '../../api/index.js';
    export default {
        name: 'QuestionsList',
        components: {
            Question
        },
        data() {
            return {
                list: [],
                currentView: 1,
                showInstitutions: false
            }
        },
        async created() {
            const list = await API.Question.list();
            this.list = list.data;
            console.log(list, 'list form');
        }

    }
</script>
<style lang="scss">
    .switch-container {
        margin: 10px;
    }
</style>