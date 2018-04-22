import axios from 'axios';

export default new class {
    list() {
        return axios.get(`/questions`);
    }

    like(id) {
        return axios.get(`/question/${id}/like`);
    }

    dislike(id) {
        return axios.get(`/question/${id}/dislike`);
    }
    view(id) {
        return axios.get(`/question/${id}/view`);
    }

    store(data){
        return axios.post('/questions', data);
    }

    filter(data) {
        return axios.post('/questions/filter', data);
    }

    youtube(params) {
        return axios.get(`https://www.googleapis.com/youtube/v3/search`, {
            params: {
                'maxResults': '25',
                'part': 'snippet',
                'q': params.q,
                'type': '',
                'key': 'AIzaSyAdrWk4INZuSaKFG1h7aakMJSRnbMvoRgo' }
        });
    }

    books({q}) {
        return axios.get('https://www.googleapis.com/books/v1/volumes?q='+q);
    }

};
