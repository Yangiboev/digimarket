import axios from 'axios';

export default
    axios.create({
        baseURL: 'https://migration.track.uz/v1'
    });