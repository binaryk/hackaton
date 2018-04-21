<template>
    <div class="list-group-item list-group-item-action flex-column align-items-start">
        <div class="d-flex w-100 justify-content-between">
            <small>{{ comment.created_at }}</small>
        </div>
        <p class="mb-1">{{ comment.content }}</p>
        <small>Views <span class="badge badge-primary badge-pill">{{comment.views}}</span></small>
        <button class="btn btn-sm  btn-danger" @click="dislike()">
            <i class="fa fa-thumbs-down"></i> Dislike
        </button>
        <span class="badge badge-primary badge-pill">{{comment.likes}}</span>
        <button class="btn  btn-sm btn-success" @click="like()">
            <i class="fa fa-thumbs-up"></i> Like
        </button>
        <span class="badge badge-primary badge-pill">{{comment.likes}}</span>
    </div>
</template>
<script>
    import API from '../../api';
    export default {
        name: 'comment',
        props: ['comment'],
        methods: {
            async like() {
                await API.Comment.like(this.comment.id);

            },
            async dislike() {
                await API.Comment.dislike(this.comment.id);
            },
        }
    }
</script>