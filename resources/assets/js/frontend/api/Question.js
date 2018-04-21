import axios from 'axios';

export default new class {
    list() {
        return axios.get(`/questions`);
    }

    like(id) {
        return axios.get(`/questions/${id}/like`);
    }

    dislike(id) {
        return axios.get(`/questions/${id}/dislike`);
    }
    view(id) {
        return axios.get(`/questions/${id}/view`);
    }

    store(data){
        return axios.post('/questions', data);
    }

};
