<?php

$data = load_json("https://storage.googleapis.com/dito-questions/events.json");
$data_to_return = array();

foreach($data->events as $key => $event){
  $event->timestamp = $event->timestamp;
  $custom_data = extract_custom_data($event->custom_data);
  $transaction_id = $custom_data["transaction_id"];

  $data_to_return[$transaction_id]["transaction_id"] = $transaction_id;
  $data_to_return[$transaction_id]["timestamp"] = $event->timestamp;

  if($event->event === "comprou-produto"){
    $data_to_return[$transaction_id]["products"][] = $custom_data["product"];
  } elseif($event->event === "comprou"){
    $data_to_return[$transaction_id]["store_name"] = $custom_data["store_name"];
    $data_to_return[$transaction_id]["revenue"] = $event->revenue;
  }
}

$data_to_json = array();

foreach($data_to_return as $key => $data){
  $data_to_json[] = $data;
}

usort($data_to_json, function($a, $b) {
    return strtotime($b['timestamp']) - strtotime($a['timestamp']);
});

print_r(json_encode(array("timeline" => $data_to_json), JSON_UNESCAPED_UNICODE));

function extract_custom_data($custom_data){
  $data_to_return = array();
  foreach($custom_data as $key => $custom){
    if($custom->key === "product_name"){
      $data_to_return["product"]["name"] =  $custom->value;
    } elseif($custom->key === "product_price") {
      $data_to_return["product"]["price"] =  $custom->value;
    }else {
      $data_to_return[$custom->key] =  $custom->value;
    }
  }
  return $data_to_return;
}

function load_json($url) {
  $ch = curl_init();
  curl_setopt($ch, CURLOPT_URL, $url);
  curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
  $output = curl_exec($ch);
  curl_close($ch);

  return json_decode($output);
}


