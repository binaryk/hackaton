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

};
