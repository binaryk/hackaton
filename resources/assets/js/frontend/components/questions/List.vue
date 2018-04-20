<template>
    <div class="col-sm-12 col-xl-6">
        <div class="card">
            <div class="card-header">
                <i class="fa fa-align-justify"></i> List group
                <small>custom content</small>
            </div>
            <div class="card-body">
                <div class="list-group">

                    <question v-for="q in list" :content="q.content" :key="q.id"></question>

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
            this.list = list;
            console.log(list, 'list form');
        }

    }
</script>