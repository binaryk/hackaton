<template>
    <a :href="url" class="list-group-item list-group-item-action flex-column align-items-start" v-bind:class="{active: false}">
        <div class="d-flex w-100 justify-content-between">
            <small>{{ question.created_at }}</small>
        </div>
        <p class="mb-1" v-html="question.content"></p>
        <small>Views <span class="badge badge-primary badge-pill">{{question.views}}</span></small>
        <small>Likes <span class="badge badge-success badge-pill">{{question.likes}}</span></small>
        <small>Dislikes <span class="badge badge-danger badge-pill">{{question.dislikes}}</span></small>
    </a>
</template>
<script>
    import API from '../../api';
    export default {
        name: 'question',
        props: ['question'],
        computed: {
            url() {
                return `question/${this.question.id}/show`;
            }
        },
        methods: {
            async like(e) {
                e.preventDefault();
                await API.Question.like(this.question.id).then(res => {
                    this.question.likes +=1;
                    console.log('increment')
                });

            },
            async dislike(e) {
                e.preventDefault();
                await API.Question.dislike(this.question.id).then(res => {
                    this.question.dislikes +=1;
                });

            },
        }
    }
</script>