-- macros/custom_tests.sql
{% macro test_total_sales_above_threshold(threshold) %}
    select
      order_id,
      sum(amount) as total_amount
    from {{ ref('stg_jaffle_shop__orders') }} 
    group by 1
    having sum(amount) < {{ threshold }}  
{% endmacro %}
