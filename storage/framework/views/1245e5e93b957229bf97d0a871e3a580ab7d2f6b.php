<?php
$link = public_path('css/bootstrap-print.css');
use App\Models\Utils;
use App\Models\Quotation;

$c = Quotation::find($_GET['id']);

//$logo_link = public_path('/storage/' . $c->photo);
$logo_link = public_path('/logo-1.jpg' . $c->photo);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="<?php echo e(public_path('css/bootstrap-print.css'), false); ?>">
    <title>Quotation - <?php echo e($c->id, false); ?></title>
    
    <style>
        /*  @font-face {
            font-family: Arial;
            src: {public_path('assets/arial.ttf')};
        }
 */
        .data td,
        .data tbody th {
            padding: 2px !important;
            padding-left: 3px !important;
            margin: 0px !important;
        }

        .arab {
            font-family: dejavu sans;
            font-size: 13px
        }

        thead tr th {
            background-color: rgb(26, 9, 94);
            color: white;
            padding: 4px !important;
            text-align: center;
            font-size: 16px;
        }
    </style>

</head>

<body>

    <table class="w-100 ">
        <tbody>
            <tr>
                <td style="width: 30%;">
                    <img class="img-fluid" src="<?php echo e($logo_link, false); ?>">
                    <br>
                    <br>
                </td>

                <td class=" text-center">

                </td>


                <td style="width: 25%;" class="">
                    <b style="font-size: 25px;">PRO-INVOICE</b>

                </td>
            </tr>
            <tr>
                <td style="width: 15%;" class="">
                    <p>P.O.Box <b><i>36580, Kampala</i></b></p>
                    <p>Tel: <b><i>+256 772-544 263,<br>+256 702-544 263</i></b></p>
                </td>


            </tr>
        </tbody>
    </table>

    <hr style="background-color: rgb(31, 94, 9); height: 3px;" class="p-0 m-0 mt-4">
    <hr style="background-color: rgb(255, 255, 255); height: 3px;" class="p-0 m-0 mt-0">
    <hr style="background-color: rgb(26, 9, 94); height: 3px;" class="p-0 m-0 mt-0 mb-4">

    <b>QUOTATION TO</b>
    <p><?php echo e($c->customer_name, false); ?>,</p>
    <p><?php echo e($c->customer_address, false); ?>,</p>
    <p><?php echo e($c->customer_contact, false); ?>.</p>


    <table class="table table-bordered data mt-4 mb-2">
        <thead>
            <tr>
                <th style="width: 5%;">S/n</th>
                <th>PARTICULARS</th>
                <th style="width: 8%;">QTY</th>
                <th style="width: 15%;">RATE</th>
                <th style="width: 20%;">AMOUNT</th>
            </tr>
        </thead>
        <tbody>
            <?php $i = 0;
            $tot = 0; ?>
            <?php $__currentLoopData = $c->items; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <?php $i++;
                $tot += $item->pro->price * $item->quantity;
                ?>
                <tr>
                    <th><?php echo e($i, false); ?></th>
                    <td class="p-0"><?php echo e($item->pro->name, false); ?></td>
                    <td class="text-center p-0"><?php echo e($item->quantity, false); ?></td>
                    <td class="text-center p-0"> <?php echo e(number_format($item->pro->price), false); ?></td>
                    <td class="text-right p-0"> <?php echo e(number_format($item->pro->price * $item->quantity), false); ?></td>
                </tr>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

            <tr>
                <th><b></b></th>
                <th colspan="3"><b>TOTAL</b></th>
                <td class="text-right p-0">UGX <b><?php echo e(number_format($tot), false); ?></b> </td>
            </tr>

        </tbody>
        
    </table>
    <p class="text-center p-0 m-0"><i>Accounts are due on demand</i></p>
    <br>
    <p class=""><b>IN WORDS:</b> <?php echo e(Utils::convert_number_to_words($tot), false); ?>.</p>
    <br>
    <p class=""><b>SIGNATURE:</b></p>
    <p class="mt-2">................................................................</p>


    

</body>

</html>
<?php /**PATH C:\github\InvoiceNinja\resources\views/print/quotation.blade.php ENDPATH**/ ?>