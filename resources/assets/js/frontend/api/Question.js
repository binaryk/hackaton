import axios from 'axios';

export default new class {
    list() {
        return axios.get(`questions`);
    }
};
