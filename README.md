# subsearch
Subsearch is a bash script to perform a quick recon. It uses https://crt.sh to find subdomains based on the websites certs and saving them into a results.txt text file. After completion, it will offer to perform a quick scan to check ports 80 and 443 to see if the domain(s) are currently running. This program is very beta.

Must have nc (netcat) and wget installed.

In order to run program:
chmod +x subsearch.sh
./subsearch.sh domain.name
