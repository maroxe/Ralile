{% if user.is_authenticated %}
{% include "base.tpl" %}
{% else %}
{% include "index_guest.tpl" %}
{% endif %}