<template>
    <a :href="url" class="list-group-item list-group-item-action flex-column align-items-start" v-bind:class="{active: false}">
        <div class="d-flex w-100 justify-content-between">
            <small>{{ question.created_at }}</small>
        </div>
        <p class="mb-1" v-html="question.content"></p>
        <small>Views <span class="badge badge-primary badge-pill">{{question.views}}</span></small>
        <button class="btn btn-sm  btn-danger" @click="dislike()">
            <i class="fa fa-thumbs-down"></i> Dislike
        </button>
        <span class="badge badge-primary badge-pill">{{question.likes}}</span>
        <button class="btn  btn-sm btn-success" @click="like()">
            <i class="fa fa-thumbs-up"></i> Like
        </button>
        <span class="badge badge-primary badge-pill">{{question.likes}}</span>
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
            async like() {
                await API.Question.like(this.question.id).then(res => {
                    this.question.likes +=1;
                    console.log('increment')
                });

            },
            async dislike() {
                await API.Question.dislike(this.question.id).then(res => {
                    this.question.dislikes +=1;
                });

            },
        }
    }
</script>