view: profit_per_car_daily {
  sql_table_name: socar_biz.profit_per_car_daily ;;

  parameter: measure_type {
    suggestions: ["이용건수","이용시간","순대여매출","표준손익"]
    default_value: "이용건수"
  }

  measure: dynamic_measure_1 {
    type: number
    label_from_parameter: measure_type
    sql: case when  {% condition measure_type %} '이용건수' {% endcondition %}
              then ${nuse}
          when  {% condition measure_type %} '이용시간' {% endcondition %}
              then ${utime}
          when  {% condition measure_type %} '순대여매출' {% endcondition %}
              then ${rev_pure}
          when {% condition measure_type %} '표준손익' {% endcondition %}
              then ${standard_profit}
          else null end;;
    value_format: "#,##0"
  }

  measure: dynamic_measure_2 {
    type: number
    label_from_parameter: measure_type
    sql: case when  {% condition measure_type %} '이용건수' {% endcondition %}
              then ${nuse}/${car_cnt}
          when  {% condition measure_type %} '이용시간' {% endcondition %}
              then ${utime}/${car_cnt}
          when  {% condition measure_type %} '순대여매출' {% endcondition %}
              then ${rev_pure}/${car_cnt}
          when {% condition measure_type %} '표준손익' {% endcondition %}
              then ${standard_profit}/${car_cnt}
          else null end;;
    value_format: "#,##0.0"
  }

  dimension_group: current {
    type: time
    hidden: yes
    timeframes: [date, week, month, quarter, year, week_of_year]
    convert_tz: yes
    sql: current_timestamp() ;;
  }

  dimension: team {
    type: string
    label: "사업팀"
    group_label: "1. 지역"
    sql: ${TABLE}.team ;;
  }

  dimension: year {
    type: number
    label: "ISO 연도"
    group_label: "0. 조회일자"
    sql: ${TABLE}.year ;;
  }

#   dimension: month {
#     type: number
#     label: "월"
#     group_label: "0. 조회일자"
#     sql: ${TABLE}.month ;;
#   }

  dimension: week {
    type: number
    label: "ISO 주차"
    group_label: "0. 조회일자"
    sql: ${TABLE}.week ;;
  }

  dimension_group: date {
    type: time
    label: "일자"
    group_label: "0. 조회일자"
    timeframes: [
      date,
      week,
      month,
      year,
      week_of_year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: region1 {
    type: string
    label: "시/도"
    group_label: "1. 지역"
    sql: ${TABLE}.region1 ;;
  }

  dimension: region2 {
    type: string
    label: "시/군/구"
    group_label: "1. 지역"
    sql: ${TABLE}.region2 ;;
  }

  dimension: zone_id {
    type: number
    label: "쏘카존 ID"
    group_label: "2. 쏘카존"
    sql: ${TABLE}.zone_id ;;
  }

  dimension: zone_name {
    type: string
    label: "쏘카존 이름"
    group_label: "2. 쏘카존"
    sql: ${TABLE}.zone_name ;;
  }

  dimension: zone_location {
    type: location
    label: "쏘카존 위치"
    group_label: "2. 쏘카존"
    sql_latitude: ${TABLE}.zone_lat ;;
    sql_longitude:  ${TABLE}.zone_lng ;;
  }

  dimension: zone_type {
    type: string
    label: "쏘카존 타입"
    group_label: "2. 쏘카존"
    sql: ${TABLE}.zone_type ;;
  }

  dimension: zone_regdate {
    type: date
    label: "쏘카존 등록일"
    group_label: "2. 쏘카존"
    convert_tz: no
    datatype: date
    sql: ${TABLE}.zone_regdate ;;
  }

  dimension: car_id {
    type: number
    label: "차량 ID"
    group_label: "3. 차량"
    sql: ${TABLE}.car_id ;;
  }

  dimension: car_num {
    type: string
    label: "차량 번호"
    group_label: "3. 차량"
    sql: ${TABLE}.car_num ;;
  }

  dimension: car_class {
    type: number
    label: "차량 클래스"
    group_label: "3. 차량"
    sql: ${TABLE}.car_class ;;
  }

  dimension: car_model {
    type: string
    label: "차량 모델"
    group_label: "3. 차량"
    sql: ${TABLE}.car_model ;;
  }

  dimension: car_name {
    type: string
    label: "차량 이름"
    group_label: "3. 차량"
    sql: ${TABLE}.car_name ;;
  }

  dimension: power_source {
    type: string
    label: "차량 동력원"
    group_label: "3. 차량"
    sql: ${TABLE}.power_source ;;
  }

  dimension: insurer {
    type: string
    label: "차량 보험사"
    group_label: "3. 차량"
    sql: ${TABLE}.insurer ;;
  }

  dimension: car_regdate {
    type: date
    label: "차량 등록일"
    group_label: "3. 차량"
    convert_tz: no
    datatype: date
    sql: ${TABLE}.car_regdate ;;
  }

  dimension: opr_day {
    type: number
    label: "차량 운영일"
    group_label: "3. 차량"
    sql: ${TABLE}.opr_day ;;
  }

  dimension: avbl_date {
    type: number
    label: "차량 운영가능일"
    group_label: "3. 차량"
    sql: ${TABLE}.avbl_date ;;
  }

  measure: nuse {
    type: sum
    label: "이용건수(전체)"
    group_label: "1. 이용"
    sql: ${TABLE}.nuse ;;
    value_format: "#,##0"
  }

  measure: nuse_21 {
    type: sum
    label: "이용건수(20대초반)"
    group_label: "1. 이용"
    sql: ${TABLE}.nuse_21 ;;
    value_format: "#,##0"
  }

  measure: nuse_26 {
    type: sum
    label: "이용건수(20대후반)"
    group_label: "1. 이용"
    sql: ${TABLE}.nuse_26 ;;
    value_format: "#,##0"
  }

  measure: nuse_30 {
    type: sum
    label: "이용건수(30대이상)"
    group_label: "1. 이용"
    sql: ${TABLE}.nuse_30 ;;
    value_format: "#,##0"
  }

  measure: nuse_round {
    type: sum
    label: "이용건수(왕복)"
    group_label: "1. 이용"
    sql: ${TABLE}.nuse_round ;;
    value_format: "#,##0"
  }

  measure: nuse_oneway {
    type: sum
    label: "이용건수(편도)"
    group_label: "1. 이용"
    sql: ${TABLE}.nuse_oneway ;;
    value_format: "#,##0"
  }

  measure: nuse_d2d {
    type: sum
    label: "이용건수(부름)"
    group_label: "1. 이용"
    sql: ${TABLE}.nuse_d2d ;;
    value_format: "#,##0"
  }

  measure: nuse_pass {
    type: sum
    label: "이용건수(쏘카패스)"
    group_label: "1. 이용"
    sql: ${TABLE}.nuse_pass ;;
    value_format: "#,##0"
  }

  measure: dist {
    type: sum
    label: "주행거리(전체)"
    group_label: "1. 이용"
    sql: ${TABLE}.dist ;;
    value_format: "#,##0"
  }

  measure: dist_21 {
    type: sum
    label: "주행거리(20대초반)"
    group_label: "1. 이용"
    sql: ${TABLE}.dist_21 ;;
    value_format: "#,##0"
  }

  measure: dist_26 {
    type: sum
    label: "주행거리(20대후반)"
    group_label: "1. 이용"
    sql: ${TABLE}.dist_26 ;;
    value_format: "#,##0"
  }

  measure: dist_30 {
    type: sum
    label: "주행거리(30대이상)"
    group_label: "1. 이용"
    sql: ${TABLE}.dist_30 ;;
    value_format: "#,##0"
  }

  measure: utime {
    type: sum
    label: "이용시간(전체)"
    group_label: "1. 이용"
    sql: ${TABLE}.utime ;;
    value_format: "#,##0"
  }

  measure: utime_21 {
    type: sum
    label: "이용시간(20대초반)"
    group_label: "1. 이용"
    sql: ${TABLE}.utime_21 ;;
    value_format: "#,##0"
  }

  measure: utime_26 {
    type: sum
    label: "이용시간(20대후반)"
    group_label: "1. 이용"
    sql: ${TABLE}.utime_26 ;;
    value_format: "#,##0"
  }

  measure: utime_30 {
    type: sum
    label: "이용시간(30대이상)"
    group_label: "1. 이용"
    sql: ${TABLE}.utime_30 ;;
    value_format: "#,##0"
  }

  measure: acc_21 {
    type: sum
    label: "사고건수(20대초반)"
    group_label: "1. 이용"
    sql: ${TABLE}.acc_21 ;;
    value_format: "#,##0"
  }

  measure: acc_26 {
    type: sum
    label: "사고건수(20대후반)"
    group_label: "1. 이용"
    sql: ${TABLE}.acc_26 ;;
    value_format: "#,##0"
  }

  measure: acc_30 {
    type: sum
    label: "사고건수(30대이상)"
    group_label: "1. 이용"
    sql: ${TABLE}.acc_30 ;;
    value_format: "#,##0"
  }

  measure: rev_total {
    type: sum
    label: "총매출"
    group_label: "2. 매출"
    sql: ${TABLE}.rev_total ;;
    value_format: "#,##0"
  }

  measure: rent {
    type: sum
    label: "대여매출"
    group_label: "2. 매출"
    sql: ${TABLE}.rent ;;
    value_format: "#,##0"
  }

  measure: enuri {
    type: sum
    label: "할인금액"
    group_label: "2. 매출"
    sql: ${TABLE}.enuri ;;
    value_format: "#,##0"
  }

  measure: rev_pure {
    type: sum
    label: "순대여매출"
    group_label: "2. 매출"
    sql: ${TABLE}.rev_pure ;;
    value_format: "#,##0"
  }

  measure: rev_oil {
    type: sum
    label: "주행매출"
    group_label: "2. 매출"
    sql: ${TABLE}.rev_oil ;;
    value_format: "#,##0"
  }

  measure: rev_hipass {
    type: sum
    label: "통행료매출"
    group_label: "2. 매출"
    sql: ${TABLE}.rev_hipass ;;
    value_format: "#,##0"
  }

  measure: rev_d2d {
    type: sum
    label: "부름매출"
    group_label: "2. 매출"
    sql: ${TABLE}.rev_d2d ;;
    value_format: "#,##0"
  }

  measure: rev_etc {
    type: sum
    label: "기타매출"
    group_label: "2. 매출"
    sql: ${TABLE}.rev_etc ;;
    value_format: "#,##0"
  }

  measure: rev_indemnfication {
    type: sum
    label: "면책금수입"
    group_label: "2. 매출"
    sql: ${TABLE}.rev_indemnfication ;;
    value_format: "#,##0"
  }

  measure: rev_socarpass {
    type: sum
    label: "쏘카패스매출"
    group_label: "2. 매출"
    sql: ${TABLE}.rev_socarpass ;;
    value_format: "#,##0"
  }

  measure: revenue {
    type: sum
    label: "회계매출"
    group_label: "0. 손익"
    sql: ${TABLE}.revenue ;;
    value_format: "#,##0"
  }

  measure: pg_commission_cost {
    type: sum
    label: "PG사수수료"
    group_label: "3. 비용"
    sql: ${TABLE}.pg_commission_cost ;;
    value_format: "#,##0"
  }

  measure: fuel_cost {
    type: sum
    label: "유류대"
    group_label: "3. 비용"
    sql: ${TABLE}.fuel_cost ;;
    value_format: "#,##0"
  }

  measure: highway_toll_cost {
    type: sum
    label: "통행료"
    group_label: "3. 비용"
    sql: ${TABLE}.highway_toll_cost ;;
    value_format: "#,##0"
  }

  measure: vehicle_communication_cost_poketfi {
    type: sum
    label: "차량통신비(포켓파이)"
    group_label: "3. 비용"
    sql: ${TABLE}.vehicle_communication_cost_poketfi ;;
    value_format: "#,##0"
  }

  measure: vehicle_communication_cost_sms {
    type: sum
    label: "차량통신비(SMS)"
    group_label: "3. 비용"
    sql: ${TABLE}.vehicle_communication_cost_sms ;;
    value_format: "#,##0"
  }

  measure: installation_cost {
    type: sum
    label: "장착비"
    group_label: "3. 비용"
    sql: ${TABLE}.installation_cost ;;
    value_format: "#,##0"
  }

  measure: parking_cost_standard {
    type: sum
    label: "주차료(일반)"
    group_label: "3. 비용"
    sql: ${TABLE}.parking_cost_standard ;;
    value_format: "#,##0"
  }

  measure: parking_cost_oneway {
    type: sum
    label: "주차료(편도)"
    group_label: "3. 비용"
    sql: ${TABLE}.parking_cost_oneway ;;
    value_format: "#,##0"
  }

  measure: parking_cost_d2d {
    type: sum
    label: "주차료(부름)"
    group_label: "3. 비용"
    sql: ${TABLE}.parking_cost_d2d ;;
    value_format: "#,##0"
  }

  measure: wash_cost {
    type: sum
    label: "세차비"
    group_label: "3. 비용"
    sql: ${TABLE}.wash_cost ;;
    value_format: "#,##0"
  }

  measure: vehicle_maintenance_cost {
    type: sum
    label: "차량유지비"
    group_label: "3. 비용"
    sql: ${TABLE}.vehicle_maintenance_cost ;;
    value_format: "#,##0"
  }

  measure: transport_cost_socar {
    type: sum
    label: "쏘카운반비"
    group_label: "3. 비용"
    sql: ${TABLE}.transport_cost_socar ;;
    value_format: "#,##0"
  }

  measure: transport_cost_d2d {
    type: sum
    label: "부름운반비"
    group_label: "3. 비용"
    sql: ${TABLE}.transport_cost_d2d ;;
    value_format: "#,##0"
  }

  measure: callcenter_commission_cost_standard {
    type: sum
    label: "콜센터수수료(일반)"
    group_label: "3. 비용"
    sql: ${TABLE}.callcenter_commission_cost_standard ;;
    value_format: "#,##0"
  }

  measure: callcenter_commission_cost_d2d {
    type: sum
    label: "콜센터수수료(부름)"
    group_label: "3. 비용"
    sql: ${TABLE}.callcenter_commission_cost_d2d ;;
    value_format: "#,##0"
  }

  measure: callcenter_commission_cost_acc {
    type: sum
    label: "콜센터수수료(사고)"
    group_label: "3. 비용"
    sql: ${TABLE}.callcenter_commission_cost_acc ;;
    value_format: "#,##0"
  }

  measure: callcenter_communication_cost {
    type: sum
    label: "콜센터통신비"
    group_label: "3. 비용"
    sql: ${TABLE}.callcenter_communication_cost ;;
    value_format: "#,##0"
  }

  measure: insurance_cost {
    type: sum
    label: "쏘카보험료"
    group_label: "3. 비용"
    sql: ${TABLE}.insurance_cost ;;
    value_format: "#,##0"
  }

  measure: repair_cost_21 {
    type: sum
    label: "자차수리비(20대초반)"
    group_label: "3. 비용"
    sql: ${TABLE}.repair_cost_21 ;;
    value_format: "#,##0"
  }

  measure: repair_cost_26 {
    type: sum
    label: "자차수리비(20대후반)"
    group_label: "3. 비용"
    sql: ${TABLE}.repair_cost_26 ;;
    value_format: "#,##0"
  }

  measure: repair_cost_30 {
    type: sum
    label: "자차수리비(30대이상)"
    group_label: "3. 비용"
    sql: ${TABLE}.repair_cost_30 ;;
    value_format: "#,##0"
  }

  measure: repair_cost_missing {
    type: sum
    label: "자차수리비(확인불가)"
    group_label: "3. 비용"
    sql: ${TABLE}.repair_cost_missing ;;
    value_format: "#,##0"
  }

  measure: personal_property_cost_21 {
    type: sum
    label: "대인대물비용(20대초반)"
    group_label: "3. 비용"
    sql: ${TABLE}.personal_property_cost_21 ;;
    value_format: "#,##0"
  }

  measure: personal_property_cost_26 {
    type: sum
    label: "대인대물비용(20대후반)"
    group_label: "3. 비용"
    sql: ${TABLE}.personal_property_cost_26 ;;
    value_format: "#,##0"
  }

  measure: personal_property_cost_30 {
    type: sum
    label: "대인대물비용(30대이상)"
    group_label: "3. 비용"
    sql: ${TABLE}.personal_property_cost_30 ;;
    value_format: "#,##0"
  }

  measure: vehicle_deprecation_cost {
    type: sum
    label: "감가상각비(차량)"
    group_label: "3. 비용"
    sql: ${TABLE}.vehicle_deprecation_cost ;;
    value_format: "#,##0"
  }

  measure: csa_deprecation_cost {
    type: sum
    label: "감가상각비(CSA)"
    group_label: "3. 비용"
    sql: ${TABLE}.csa_deprecation_cost ;;
    value_format: "#,##0"
  }

  measure: etc_cost {
    type: sum
    label: "기타비용"
    group_label: "3. 비용"
    sql: ${TABLE}.etc_cost ;;
    value_format: "#,##0"
  }

  measure: socar_light_cost {
    type: sum
    label: "쏘카라이트할인"
    group_label: "0. 손익"
    sql: ${TABLE}.socar_light_cost ;;
    value_format: "#,##0"
  }

  measure: variable_cost {
    type: sum
    label: "변동비"
    group_label: "0. 손익"
    sql: ${TABLE}.variable_cost ;;
    value_format: "#,##0"
  }

  measure: fixed_cost {
    type: sum
    label: "고정비"
    group_label: "0. 손익"
    sql: ${TABLE}.fixed_cost ;;
    value_format: "#,##0"
  }

  measure: standard_cost {
    type: sum
    label: "표준비용"
    group_label: "0. 손익"
    sql: ${TABLE}.standard_cost ;;
    value_format: "#,##0"
  }

  measure: standard_profit {
    type: sum
    label: "표준손익"
    group_label: "0. 손익"
    sql: ${TABLE}.standard_profit ;;
    value_format: "#,##0"
    drill_fields: [team,zone_name,team,power_source]
  }

  measure: car_cnt {
    type:  count_distinct
    label: "운영차량수"
    group_label: "1. 이용"
    sql: ${TABLE}.car_id ;;
    value_format: "#,##0"
  }

  measure: zone_cnt {
    type:  count_distinct
    label: "운영쏘카존수"
    group_label: "1. 이용"
    sql: ${TABLE}.zone_id ;;
    value_format: "#,##0"
  }
}
