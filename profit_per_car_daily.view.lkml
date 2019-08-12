view: profit_per_car_daily {
  sql_table_name: socar_biz.profit_per_car_daily ;;

  dimension: team {
    type: string
    sql: ${TABLE}.team ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  dimension: month {
    type: number
    sql: ${TABLE}.month ;;
  }

  dimension: week {
    type: number
    sql: ${TABLE}.week ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
    drill_fields: [car_id]
  }

  dimension: weekend {
    type: string
    sql: ${TABLE}.weekend ;;
  }

  dimension: region1 {
    type: string
    sql: ${TABLE}.region1 ;;
  }

  dimension: region2 {
    type: string
    sql: ${TABLE}.region2 ;;
  }

  dimension: zone_id {
    type: number
    sql: ${TABLE}.zone_id ;;
  }

  dimension: zone_name {
    type: string
    sql: ${TABLE}.zone_name ;;
  }

  dimension: zone_type {
    type: string
    sql: ${TABLE}.zone_type ;;
  }

  dimension_group: zone_regdate {
    type: time
    convert_tz: no
    datatype: date
    sql: ${TABLE}.zone_regdate ;;
  }

  dimension: car_id {
    type: number
    sql: ${TABLE}.car_id ;;
  }

  dimension: car_num {
    type: string
    sql: ${TABLE}.car_num ;;
  }

  dimension: car_class {
    type: number
    sql: ${TABLE}.car_class ;;
  }

  dimension: car_model {
    type: string
    sql: ${TABLE}.car_model ;;
  }

  dimension: car_name {
    type: string
    sql: ${TABLE}.car_name ;;
  }

  dimension: power_source {
    type: string
    sql: ${TABLE}.power_source ;;
  }

  dimension: insurer {
    type: string
    sql: ${TABLE}.insurer ;;
  }

  dimension_group: car_regdate {
    type: time
    convert_tz: no
    datatype: date
    sql: ${TABLE}.car_regdate ;;
  }

  dimension: opr_day {
    type: number
    sql: ${TABLE}.opr_day ;;
  }

  dimension: avbl_date {
    type: number
    sql: ${TABLE}.avbl_date ;;
  }

  dimension: acc_block {
    type: number
    sql: ${TABLE}.acc_block ;;
  }

  measure: nuse {
    type: sum
    sql: ${TABLE}.nuse ;;
    value_format: "#,##0"
  }

  measure: nuse_21 {
    type: sum
    sql: ${TABLE}.nuse_21 ;;
    value_format: "#,##0"
  }

  measure: nuse_26 {
    type: sum
    sql: ${TABLE}.nuse_26 ;;
    value_format: "#,##0"
  }

  measure: nuse_30 {
    type: sum
    sql: ${TABLE}.nuse_30 ;;
    value_format: "#,##0"
  }

  measure: nuse_round {
    type: sum
    sql: ${TABLE}.nuse_round ;;
    value_format: "#,##0"
  }

  measure: nuse_oneway {
    type: sum
    sql: ${TABLE}.nuse_oneway ;;
    value_format: "#,##0"
  }

  measure: nuse_d2d {
    type: sum
    sql: ${TABLE}.nuse_d2d ;;
    value_format: "#,##0"
  }

  measure: nuse_pass {
    type: sum
    sql: ${TABLE}.nuse_pass ;;
    value_format: "#,##0"
  }

  measure: dist {
    type: sum
    sql: ${TABLE}.dist ;;
    value_format: "#,##0"
  }

  measure: dist_21 {
    type: sum
    sql: ${TABLE}.dist_21 ;;
    value_format: "#,##0"
  }

  measure: dist_26 {
    type: sum
    sql: ${TABLE}.dist_26 ;;
    value_format: "#,##0"
  }

  measure: dist_30 {
    type: sum
    sql: ${TABLE}.dist_30 ;;
    value_format: "#,##0"
  }

  measure: utime {
    type: sum
    sql: ${TABLE}.utime ;;
    value_format: "#,##0"
  }

  measure: utime_21 {
    type: sum
    sql: ${TABLE}.utime_21 ;;
    value_format: "#,##0"
  }

  measure: utime_26 {
    type: sum
    sql: ${TABLE}.utime_26 ;;
    value_format: "#,##0"
  }

  measure: utime_30 {
    type: sum
    sql: ${TABLE}.utime_30 ;;
    value_format: "#,##0"
  }

  measure: acc_21 {
    type: sum
    sql: ${TABLE}.acc_21 ;;
    value_format: "#,##0"
  }

  measure: acc_26 {
    type: sum
    sql: ${TABLE}.acc_26 ;;
    value_format: "#,##0"
  }

  measure: acc_30 {
    type: sum
    sql: ${TABLE}.acc_30 ;;
    value_format: "#,##0"
  }

  measure: rev_total {
    type: sum
    sql: ${TABLE}.rev_total ;;
    value_format: "#,##0"
  }

  measure: rent {
    type: sum
    sql: ${TABLE}.rent ;;
    value_format: "#,##0"
  }

  measure: enuri {
    type: sum
    sql: ${TABLE}.enuri ;;
    value_format: "#,##0"
  }

  measure: rev_pure {
    type: sum
    sql: ${TABLE}.rev_pure ;;
    value_format: "#,##0"
  }

  measure: rev_oil {
    type: sum
    sql: ${TABLE}.rev_oil ;;
    value_format: "#,##0"
  }

  measure: rev_hipass {
    type: sum
    sql: ${TABLE}.rev_hipass ;;
    value_format: "#,##0"
  }

  measure: rev_d2d {
    type: sum
    sql: ${TABLE}.rev_d2d ;;
    value_format: "#,##0"
  }

  measure: rev_etc {
    type: sum
    sql: ${TABLE}.rev_etc ;;
    value_format: "#,##0"
  }

  measure: rev_indemnfication {
    type: sum
    sql: ${TABLE}.rev_indemnfication ;;
    value_format: "#,##0"
  }

  measure: rev_socarpass {
    type: sum
    sql: ${TABLE}.rev_socarpass ;;
    value_format: "#,##0"
  }

  measure: revenue {
    type: sum
    sql: ${TABLE}.revenue ;;
    value_format: "#,##0"
  }

  measure: pg_commission_cost {
    type: sum
    sql: ${TABLE}.pg_commission_cost ;;
    value_format: "#,##0"
  }

  measure: fuel_cost {
    type: sum
    sql: ${TABLE}.fuel_cost ;;
    value_format: "#,##0"
  }

  measure: highway_toll_cost {
    type: sum
    sql: ${TABLE}.highway_toll_cost ;;
    value_format: "#,##0"
  }

  measure: vehicle_communication_cost_poketfi {
    type: sum
    sql: ${TABLE}.vehicle_communication_cost_poketfi ;;
    value_format: "#,##0"
  }

  measure: vehicle_communication_cost_sms {
    type: sum
    sql: ${TABLE}.vehicle_communication_cost_sms ;;
    value_format: "#,##0"
  }

  measure: installation_cost {
    type: sum
    sql: ${TABLE}.installation_cost ;;
    value_format: "#,##0"
  }

  measure: parking_cost_standard {
    type: sum
    sql: ${TABLE}.parking_cost_standard ;;
    value_format: "#,##0"
  }

  measure: parking_cost_oneway {
    type: sum
    sql: ${TABLE}.parking_cost_oneway ;;
    value_format: "#,##0"
  }

  measure: parking_cost_d2d {
    type: sum
    sql: ${TABLE}.parking_cost_d2d ;;
    value_format: "#,##0"
  }

  measure: wash_cost {
    type: sum
    sql: ${TABLE}.wash_cost ;;
    value_format: "#,##0"
  }

  measure: vehicle_maintenance_cost {
    type: sum
    sql: ${TABLE}.vehicle_maintenance_cost ;;
    value_format: "#,##0"
  }

  measure: transport_cost_socar {
    type: sum
    sql: ${TABLE}.transport_cost_socar ;;
    value_format: "#,##0"
  }

  measure: transport_cost_d2d {
    type: sum
    sql: ${TABLE}.transport_cost_d2d ;;
    value_format: "#,##0"
  }

  measure: callcenter_commission_cost_standard {
    type: sum
    sql: ${TABLE}.callcenter_commission_cost_standard ;;
    value_format: "#,##0"
  }

  measure: callcenter_commission_cost_d2d {
    type: sum
    sql: ${TABLE}.callcenter_commission_cost_d2d ;;
    value_format: "#,##0"
  }

  measure: callcenter_commission_cost_acc {
    type: sum
    sql: ${TABLE}.callcenter_commission_cost_acc ;;
    value_format: "#,##0"
  }

  measure: callcenter_communication_cost {
    type: sum
    sql: ${TABLE}.callcenter_communication_cost ;;
    value_format: "#,##0"
  }

  measure: insurance_cost {
    type: sum
    sql: ${TABLE}.insurance_cost ;;
    value_format: "#,##0"
  }

  measure: repair_cost_21 {
    type: sum
    sql: ${TABLE}.repair_cost_21 ;;
    value_format: "#,##0"
  }

  measure: repair_cost_26 {
    type: sum
    sql: ${TABLE}.repair_cost_26 ;;
    value_format: "#,##0"
  }

  measure: repair_cost_30 {
    type: sum
    sql: ${TABLE}.repair_cost_30 ;;
    value_format: "#,##0"
  }

  measure: repair_cost_missing {
    type: sum
    sql: ${TABLE}.repair_cost_missing ;;
    value_format: "#,##0"
  }

  measure: personal_property_cost_21 {
    type: sum
    sql: ${TABLE}.personal_property_cost_21 ;;
    value_format: "#,##0"
  }

  measure: personal_property_cost_26 {
    type: sum
    sql: ${TABLE}.personal_property_cost_26 ;;
    value_format: "#,##0"
  }

  measure: personal_property_cost_30 {
    type: sum
    sql: ${TABLE}.personal_property_cost_30 ;;
    value_format: "#,##0"
  }

  measure: vehicle_deprecation_cost {
    type: sum
    sql: ${TABLE}.vehicle_deprecation_cost ;;
    value_format: "#,##0"
  }

  measure: csa_deprecation_cost {
    type: sum
    sql: ${TABLE}.csa_deprecation_cost ;;
    value_format: "#,##0"
  }

  measure: etc_cost {
    type: sum
    sql: ${TABLE}.etc_cost ;;
    value_format: "#,##0"
  }

  measure: socar_light_cost {
    type: sum
    sql: ${TABLE}.socar_light_cost ;;
    value_format: "#,##0"
  }

  measure: variable_cost {
    type: sum
    sql: ${TABLE}.variable_cost ;;
    value_format: "#,##0"
  }

  measure: fixed_cost {
    type: sum
    sql: ${TABLE}.fixed_cost ;;
    value_format: "#,##0"
  }

  measure: standard_cost {
    type: sum
    sql: ${TABLE}.standard_cost ;;
    value_format: "#,##0"
  }

  measure: standard_profit {
    type: sum
    sql: ${TABLE}.standard_profit ;;
    value_format: "#,##0"
  }
}
