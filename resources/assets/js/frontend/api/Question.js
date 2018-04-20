import axios from 'axios';

export default new class {
    list() {
        return axios.get(`questions`);
    }

    store(data){
        return axios.post('questions', data);
    }

};
