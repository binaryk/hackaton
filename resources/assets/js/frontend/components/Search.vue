<template>
    <div class="col-md-10 form-group row">
        <div class="col-md-12">
            <div class="input-group">
<span class="input-group-prepend">
<button @click="search" type="button" class="btn btn-primary"><i class="fa fa-search"></i> Search</button>
</span>
                <input v-model="str" type="text" id="input1-group2" name="input1-group2" class="form-control col-md-8" placeholder="Username" autocomplete="off">
            </div>
        </div>
    </div>
</template>
<script>
    export default {
        name: 'Search',
        data() {
            return {
                str: ''
            }
        },
        methods: {
            search() {
                
                // TODO: Send an event to filter current list
                console.log(this.str);
            }
        }
    }
</script>