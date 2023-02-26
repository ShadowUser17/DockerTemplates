import http from 'k6/http';
import { sleep } from 'k6';

export default function () {
    http.get('http://whoami.testing.svc:4000/bench/');
    sleep(2);
    http.get('http://whoami.testing.svc:4000/api/');
}
