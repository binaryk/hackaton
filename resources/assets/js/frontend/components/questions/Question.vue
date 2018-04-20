<template>
    <a href="#" class="list-group-item list-group-item-action flex-column align-items-start" v-bind:class="{active: false}">
        <div class="d-flex w-100 justify-content-between">
            <small>{{ question.created_at }}</small>
        </div>
        <p class="mb-1">{{ question.content }}</p>
        <small>Donec id elit non mi porta.</small>
    </a>
</template>
<script>
    export default {
        name: 'Question',
        props: ['question'],
        created() {
            console.log(this.question, 'euasdjsal');
        }
    }
</script>