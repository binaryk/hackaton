<template>
    <div>
        <form-wizard title="Sistem de cautare inteligent" subtitle="Folosim algoritmi inteligenti ca sa te ajutam" @on-complete="onComplete">
            <tab-content title="Domeniul de cautare?">
                <select id="select2" name="select2" v-model="discipline" class="form-control form-control-lg">
                    <option v-for="d in disciplines" :value="d.name">
                        {{ d.name }}
                    </option>
                </select>
            </tab-content>
            <tab-content title="Directie">
                <select v-model="direction" class="form-control form-control-lg">
                    <option value="mecanica fluidelor">Mecanica Fluidelor</option>
                    <option value="mecanica solidelor">Mecanica Solidelor</option>
                    <option value="dinamica">Dinamica</option>
                </select>
            </tab-content>
            <tab-content title="Detalii">
                <p> Ce anume nu intelegi din disciplina <strong>{{ discipline }}</strong> si domeniul <strong>{{direction}}</strong> ? </p>
                <textarea name="" id="" cols="70" rows="10" v-model="q"></textarea>
            </tab-content>
            <tab-content title="Rezultat">
                <p>Cu ajutorului motorului de cautare inteligent am depistat urmatorul rezultat:</p>
                <iframe width="560" height="315" src="https://www.youtube.com/embed/iAid_eh-eTA?rel=0&amp;controls=0&amp;showinfo=0" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
            </tab-content>
        </form-wizard>
    </div>
</template>
<script>
    import API from '../../../api';
    export default {
        name: 'Wizard',
        data() {
            return {
                disciplines: [],
                discipline: 0,
                direction: '',
                q: ''
            }
        },
        async created() {
            const res = await API.Discipline.list();
            this.disciplines = res.data;
            console.log(res.data);
        },
        methods: {
            onComplete() {
                console.log(this.direction, this.q);
            },

            search() {
            }

        }
    }
</script>