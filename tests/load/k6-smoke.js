import http from 'k6/http'; import { check, sleep } from 'k6';
export const options={vus:10,duration:'30s',thresholds:{http_req_failed:['rate<0.01'],http_req_duration:['p(95)<500']}};
export default function(){const r=http.get(`${__ENV.BASE_URL}/healthz`);check(r,{'200':x=>x.status===200});sleep(1)}
