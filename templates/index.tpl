{% if user.is_authenticated %}
{% include "base.tpl" %}
{% else %}
{% include "base.tpl" %}
{#    include "index_guest.tpl" #}
{% endif %}