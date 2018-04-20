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

                    <a href="#" class="list-group-item list-group-item-action flex-column align-items-start active">
                        <div class="d-flex w-100 justify-content-between">
                            <h5 class="mb-1">List group item heading</h5>
                            <small>3 days ago</small>
                        </div>
                        <p class="mb-1">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
                        <small>Donec id elit non mi porta.</small>
                    </a>
                    <a href="#" class="list-group-item list-group-item-action flex-column align-items-start">
                        <div class="d-flex w-100 justify-content-between">
                            <h5 class="mb-1">List group item heading</h5>
                            <small class="text-muted">3 days ago</small>
                        </div>
                        <p class="mb-1">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
                        <small class="text-muted">Donec id elit non mi porta.</small>
                    </a>
                    <a href="#" class="list-group-item list-group-item-action flex-column align-items-start">
                        <div class="d-flex w-100 justify-content-between">
                            <h5 class="mb-1">List group item heading</h5>
                            <small class="text-muted">3 days ago</small>
                        </div>
                        <p class="mb-1">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
                        <small class="text-muted">Donec id elit non mi porta.</small>
                    </a>
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
                list: [{
                    id: 1,
                    content: 'Content'
                }]
            }
        },
        async created() {
            const list = await API.Question.list();
            console.log(list, 'list form');
        }

    }
</script>