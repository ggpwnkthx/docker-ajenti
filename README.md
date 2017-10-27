# docker-ajenti
## About
This is a Docker container that runs only the basics of Ajenti 2 on Ubuntu:17.04.

http://ajenti.org/
## How To Use
```bash
sudo ./start.sh [password]
```
Example:
```bash
sudo ./start.sh sUPerSecRETpaSsW0rd
```
## Details
Ajenti 2 uses port 8000 by default. The start.sh script has the Docker container using the host network. It is not necessary, but it does allow a more consistent experience with the Settings plugin from the Ajenti GUI.

I may remove the Settings plugin entirely for the sake of a "best practices" approach to Docker.
