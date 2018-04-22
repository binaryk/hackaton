<template>
    <div class="row">
        <div class="col-12">
            <input type="text" class="form-control filter" placeholder="Cautare dupa denumire ..." v-model="search">
        </div>
        <div class="col-3 book" v-for="book in filtered" :key="book.id" @click="goTo(book)">

            <img :src="url(book)" alt="">

            <p class="title">
                {{ book.volumeInfo.title || 'Some' }}
            </p>
            <div class="author">
                {{ book.volumeInfo.authors && book.volumeInfo.authors[0] || 'Vlad Mixin' }}
            </div>
        </div>
    </div>
</template>
<script>
    export default {
        props: ['books'],
        data() {
            return {
                search: '',
                defaultURL: "http://books.google.com/books/content?id=9K7yUWtcb2EC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"
            }
        },
        computed: {
            filtered() {
                return this.books.filter(b => b.volumeInfo.title.toLocaleLowerCase().includes(this.search.toLocaleLowerCase()));
            },
        },
        methods: {
            url(book) {
                return (book.volumeInfo.imageLinks && book.volumeInfo.imageLinks['thumbnail'])  || this.defaultURL;
            },
            goTo(book) {
                if(book.volumeInfo.canonicalVolumeLink) {
                    window.open(book.volumeInfo.canonicalVolumeLink)
                }
            }
        }
    }
</script>
<style>
    .filter {
        width: 100%;
        border-radius: 20px;
        margin-bottom: 40px;
    }
</style>