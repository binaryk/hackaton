<template>
    <div class="card">
        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolores ducimus earum laborum maiores necessitatibus non sequi suscipit velit. Est illo nisi odit voluptate. Accusamus adipisci cupiditate dolore expedita, fugit temporibus.
        <div class="card-footer">
            ++ {{ this.test }} 00
        </div>
    </div>
</template>
<script>
    export default {
        name: 'TestComponent',
        props: ['test']
    }
</script>