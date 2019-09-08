<?php

require_once dirname(__DIR__) . '/vendor/autoload.php';

use Datto\JsonRpc\Client;
//use Datto\JsonRpc\Responses\ErrorResponse;
//use Datto\JsonRpc\Responses\ResultResponse;

$rpc = new Client();
$rpc->query(1, 'add', array(1, 2));
$message = $client->encode();
echo "Query example:\n",
"   \$client = new Client();\n",
"   \$client->query(1, 'add', array(1, 2));\n",
"   \$message = \$client->encode();\n",
"   // message: {$message}\n\n";
