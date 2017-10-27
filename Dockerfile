FROM ubuntu:17.04
RUN apt-get update && apt-get -y install git python-pip libffi-dev libaugeas0 augeas-lenses
RUN pip install 'setuptools>=0.6rc11' 'pip>=6' wheel
RUN pip install ajenti-panel ajenti.plugin.dashboard pyroute2
RUN pip install ajenti.plugin.augeas
RUN sed -i "s/{{customization.plugins.core.title || 'Ajenti'}}/{{customization.plugins.core.title || 'COACH'}}"/g /usr/local/lib/python2.7/dist-packages/ajenti_plugin_core/content/pages/index.html
RUN rm -r /usr/local/lib/python2.7/dist-packages/ajenti_plugin_core/resources/vendor/fontawesome && cd /usr/local/lib/python2.7/dist-packages/ajenti_plugin_core/resources/vendor && git clone https://github.com/FortAwesome/Font-Awesome.git && mv /usr/local/lib/python2.7/dist-packages/ajenti_plugin_core/resources/vendor/Font-Awesome /usr/local/lib/python2.7/dist-packages/ajenti_plugin_core/resources/vendor/fontawesome
COPY /entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh", "/usr/local/bin/ajenti-panel"]
