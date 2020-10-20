Q1.
- systemctl list-unit-files --type service
- systemctl --failed; journalctl -u service-name.service -b;
- `w`, `lastlog`, `aureport`, [other commands](https://www.xplg.com/linux-security-investigate-suspected-break-in/)
- use `cron` as scheduler and `sendmail` for sending emails.

Q2.
ERNET India provides all `.ac.in` domains in India. So, it was bought from them.

Q3.
```
$ nmap iitmandi.co.in -p 1-2000
PORT		STATE	SERVICE
22/tcp	open	ssh
53/tcp	open	domain
80/tcp	open	http
443/tcp	open	https
```
