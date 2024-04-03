<?php


$pdo = new PDO('mysql:host=localhost;dbname=testdb', 'root', '');
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$infodata = json_decode(file_get_contents("php://input"), true); // Get JSON data from POST request

$records = array();
foreach ($infodata as $d) {
    $userId = $d['userId'];
    $punchTime = $d['punchTime'];
    $punchType = $d['punchType'];
    $punchMode = $d['punchMode'];
    $deviceId = $d['deviceId'];
    $createdAt = date('Y-m-d H:i:s'); 
    $updatedAt = date('Y-m-d H:i:s'); 

    $records[] = [
        'userId' => $userId,
        'punchTime' => $punchTime,
        'punchType' => $punchType,
        'punchMode' => $punchMode,
        'deviceId' => $deviceId,
        'created_at' => $createdAt,
        'updated_at' => $updatedAt,
    ];
}

$sql = "INSERT INTO punch_records (userId, punchTime, punchType, punchMode, deviceId, created_at, updated_at) VALUES (:userId, :punchTime, :punchType, :punchMode, :deviceId, :created_at, :updated_at)";

foreach ($records as $record) {
    $stmt = $pdo->prepare($sql);
    $stmt->execute($record);
}

$pdo = null;


$response = [
    'status' => 'success',
    'message' => 'Punch records saved successfully',
];
echo json_encode($response);

?>
