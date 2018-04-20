<template>
    <a href="#" class="list-group-item list-group-item-action flex-column align-items-start active">
        <div class="d-flex w-100 justify-content-between">
            <small>{{ time }}</small>
        </div>
        <p class="mb-1">{{ content }}</p>
        <small>Donec id elit non mi porta.</small>
    </a>
</template>
<script>
    export default {
        name: 'Question',
        props: ['title', 'content', 'time']
    }
</script>