<template>
    <a :href="url" class="list-group-item list-group-item-action flex-column align-items-start" v-bind:class="{active: false}">
        <div class="d-flex w-100 justify-content-between">
            <small>{{ question.created_at }}</small>
        </div>
        <p class="mb-1" v-html="question.content"></p>

        <button type="button" class="btn btn-sm btn-primary">
            <i class="fa fa-eye"></i> &nbsp;
            <span class="badge badge-light">{{question.views}}</span>
        </button>

        <button type="button" class="btn btn-sm btn-danger" @click="dislike($event); return false;">
            <i class="fa fa-thumbs-down"></i> &nbsp;
            <span class="badge badge-light">{{question.dislikes}}</span>
        </button>

        <button type="button" class="btn  btn-sm btn-success" @click="like($event); return false;">
            <i class="fa fa-thumbs-up"></i> &nbsp;
            <span class="badge badge-light">{{question.likes}}</span>
        </button>
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