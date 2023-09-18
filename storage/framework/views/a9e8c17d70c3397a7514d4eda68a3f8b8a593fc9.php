
<?php ($listErrorKey = "$column.values"); ?>

<div class="<?php echo e($viewClass['form-group'], false); ?> <?php echo e($errors->has($listErrorKey) ? 'has-error' : '', false); ?>">

    <label class="<?php echo e($viewClass['label'], false); ?> control-label"><?php echo e($label, false); ?></label>

    <div class="<?php echo e($viewClass['field'], false); ?>">

        <?php if($errors->has($listErrorKey)): ?>
            <?php $__currentLoopData = $errors->get($listErrorKey); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $message): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i> <?php echo e($message, false); ?></label><br/>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        <?php endif; ?>

        <table class="table table-hover">

            <tbody class="list-<?php echo e($column, false); ?>-table">

            <?php $__currentLoopData = old("{$column}.values", ($value ?: [])); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $k => $v): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>

                <?php ($itemErrorKey = "{$column}.values.{$loop->index}"); ?>

                <tr>
                    <td>
                        <div class="form-group <?php echo e($errors->has($itemErrorKey) ? 'has-error' : '', false); ?>">
                            <div class="col-sm-12">
                                <input name="<?php echo e($column, false); ?>[values][]" value="<?php echo e(old("{$column}.values.{$k}", $v), false); ?>" class="form-control" />
                                <?php if($errors->has($itemErrorKey)): ?>
                                    <?php $__currentLoopData = $errors->get($itemErrorKey); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $message): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i> <?php echo e($message, false); ?></label><br/>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                <?php endif; ?>
                            </div>
                        </div>
                    </td>

                    <td style="width: 75px;">
                        <div class="<?php echo e($column, false); ?>-remove btn btn-warning btn-sm pull-right">
                            <i class="fa fa-trash">&nbsp;</i><?php echo e(__('admin.remove'), false); ?>

                        </div>
                    </td>
                </tr>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </tbody>
            <tfoot>
                <tr>
                    <td></td>
                    <td>
                        <div class="<?php echo e($column, false); ?>-add btn btn-success btn-sm pull-right">
                            <i class="fa fa-save"></i>&nbsp;<?php echo e(__('admin.new'), false); ?>

                        </div>
                    </td>
                </tr>
            </tfoot>
        </table>
    </div>
    <template class="<?php echo e($column, false); ?>-tpl">
        <tr>
            <td>
                <div class="form-group">
                    <div class="col-sm-12">
                        <input name="<?php echo e($column, false); ?>[values][]" class="form-control" />
                    </div>
                </div>
            </td>

            <td style="width: 75px;">
                <div class="<?php echo e($column, false); ?>-remove btn btn-warning btn-sm pull-right">
                    <i class="fa fa-trash">&nbsp;</i><?php echo e(__('admin.remove'), false); ?>

                </div>
            </td>
        </tr>
    </template>
</div>
<?php /**PATH C:\xampp\htdocs\ham\vendor\encore\laravel-admin\src/../resources/views/form/listfield.blade.php ENDPATH**/ ?>