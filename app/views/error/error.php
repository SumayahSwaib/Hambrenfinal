<?php
/**
 * Created by PhpStorm.
 * User: Ashiraff
 * Company: Boosted Technologies LTD
 * Company Email: office@boostedtechs.com
 * Company Website:https://www.boostedtechs.com
 * Author's website: https://www.tumusii.me
 * Date: 7/19/21
 * Time: 9:29 AM
 */

if ( !defined('APPLICATION_LOADED') || ! APPLICATION_LOADED ) {
    echo json_encode(array("status" => "fail", "code" => "503", "message" => "Invalid request"));
}
?>
<!DOCTYPE html>
<head>
    <!-- Basic Page Needs -->
    <meta name="refresh" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Error document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-secondary">
<div class="card col-md-8 mx-auto mt-5 shadow">
    <div class="card-header bg-transparent border-0 border-bottom">
        <h4 class="card-title"><a href="https://github.com/boosted-techs/boosted-php-library" class="text-decoration-none">Error document</a></h4>
    </div>
    <div class="card-body p-4">
        <h6>ErrorCode: <span class="text-danger"><?=$error->getCode()?></span></h6>
        <h6>Message : <span class="text-danger"><?=$error->getMessage()?></span></h6>
        <h6>Error file : <span class="text-secondary"><?=$error->getFile()?> : <span class="text-dark"> on line <?=$error->getLine()?></span></span></h6>
        <h6>Error trace:<br/> <span class="text-danger"><?=$error->getTraceAsString()?></span></h6>
        <div class="card-footer bg-transparent">
        <a href="https://www.boostedtechs.com" class="text-decoration-none">Boosted Technologies</a>
        | <a href="https://www.tumusii.me" class="text-decoration-none">Tumusiime - Author</a>
        </div>
    </div>
</div>
</body>
</html>