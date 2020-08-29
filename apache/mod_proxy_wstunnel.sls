{% if grains['os_family']=="Debian" %}

include:
  - apache

a2enmod proxy_wstunnel:
  cmd.run:
    - unless: ls /etc/apache2/mods-enabled/proxy_wstunnel.load
    - order: 255
    - require:
      - pkg: apache
    - watch_in:
      - module: apache-restart
    - require_in:
      - module: apache-restart
      - module: apache-reload
      - service: apache

{% endif %}
