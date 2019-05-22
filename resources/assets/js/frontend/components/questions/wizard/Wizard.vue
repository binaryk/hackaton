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
            <tab-content title="Detalii" :before-change="beforeSearch">
                <p> Ce anume nu intelegi din disciplina <strong>{{ discipline }}</strong> si domeniul <strong>{{direction}}</strong> ? </p>
                <textarea name="" id="" style="width: 100%;" rows="5" v-model="q"></textarea>
            </tab-content>
            <tab-content title="Cautare" :before-change="beforeEnd" style="min-height: 400px;">
                <p>Cu ajutorului motorului de cautare inteligent am depistat urmatorul rezultat:</p>
                <div v-if="steps[0] === 'youtube'">
                    <iframe width="560" height="315" :src="youtube" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
                </div>
                <div v-if="steps[0] === 'simulation' && simulationURL" >
                    <iframe width="100%" height="400" :src="simulationURL"></iframe>
                </div>
                <div v-if="steps[0] === 'wolphram' && wolphramURL">
                    <div style="overflow: hidden; height: 350px;">
                        <iframe width="100%" id="wolphram"  :src="wolphramURL" style="height: 700px; margin-top: -370px; "></iframe>
                    </div>
                </div>
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
                q: '',
                videoId: null,
                simulationURL: null,
                wolphramURL: null,
                steps: ['youtube', 'simulation', 'wolphram']
            }
        },
        created() {
            API.Discipline.list().then(res => this.disciplines = res.data);
        },
        computed: {
            youtube() {
               return `https://www.youtube.com/embed/${this.videoId}?rel=0&amp;controls=0&amp;showinfo=0`;
            }
        },
        methods: {
            onComplete() {
                console.log('complete')
            },
            beforeSearch() {
                if (this.discipline === 'Matematica') {
                    this.searchWolphram();
                } else if(this.discipline === 'Fizica') {
                    this.searchSimulation();
                } else {
                    this.searchYoutube();
                }

                return true;
            },
            searchYoutube() {
                let str = `${this.discipline} ${this.direction} ${this.q}`;
                API.Question.youtube({q: str}).then(res => {
                    let data = res.data;
                    let first = data.items[0];
                    let video = first.id.videoId;
                    this.videoId = video;
                });

            },
            searchSimulation() {
                // search for simulation
                const simulations = {
                    'echilibrul': 'https://phet.colorado.edu/sims/html/balancing-act/latest/balancing-act_ro.html',
                    'frecarea': 'https://phet.colorado.edu/sims/html/friction/latest/friction_ro.html',
                    'faraday': 'https://phet.colorado.edu/sims/html/faradays-law/latest/faradays-law_ro.html',
                    'hooke': 'https://phet.colorado.edu/sims/html/hookes-law/latest/hookes-law_ro.html',
                    'refractia': 'https://phet.colorado.edu/sims/html/bending-light/latest/bending-light_ro.html'
                };

                Object.keys(simulations).map((keyword) => {
                    if(this.q.indexOf(keyword) !== -1) {
                        this.simulationURL = simulations[keyword];
                    }
                });
                if(!this.simulationURL) {
                    this.steps = this.steps.filter(step => step !== 'simulation');
                    return;
                }
                this.steps = ['simulation', 'youtube', 'wolphram'];
            },
            searchWolphram() {
                const url = 'http://www.wolframalpha.com/input/?i=';
                this.wolphramURL = url + encodeURI(this.q);
                this.steps = ['wolphram', 'simulation', 'youtube'];
            },

            beforeEnd() {
                if(this.steps.length) {
                    let goNext = confirm('Ai aflat raspunsul?');
                    if(!goNext) {
                        this.steps.shift();
                        if(this.steps.length === 0) {
                            window.location.href = '/dashboard';
                        }
                    } else {
                        window.location.href = '/dashboard';
                    }
                } else {
                    window.location.href = '/dashboard';
                }
            }
        }
    }
</script>
