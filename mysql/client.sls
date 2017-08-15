{% from "mysql/map.jinja" import mysql_settings with context %}

{%- set os         = salt['grains.get']('os') %}
{%- set osrelease  = salt['grains.get']('osrelease') %}
{%- set oscodename = salt['grains.get']('oscodename') %}

include:
  - mysql.repo
  - mysql.config

mysql_client_pkg:
  pkg.installed:
    - name: {{ mysql_settings.client_pkg }}
    {%- if mysql_settings.manage_repo %}
    - require:
      - pkgrepo: mysql_repo
    {%- endif %}