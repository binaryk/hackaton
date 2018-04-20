<template>
    <div class="col-sm-12 col-xl-12">
        <div class="card">
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
                list: []
            }
        },
        async created() {
            const list = await API.Question.list();
            this.list = list.data;
            console.log(list, 'list form');
        }

    }
</script>