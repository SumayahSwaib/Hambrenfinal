<aside class="main-sidebar">

    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

        <!-- Sidebar user panel (optional) -->


        <?php if(config('admin.enable_menu_search')): ?>
        <!-- search form (Optional) -->
        <form class="sidebar-form" style="overflow: initial;" onsubmit="return false;">
            <div class="input-group">
                <input type="text" autocomplete="off" class="form-control autocomplete" placeholder="Search...">
              <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
                <ul class="dropdown-menu" role="menu" style="min-width: 210px;max-height: 300px;overflow: auto;">
                    <?php $__currentLoopData = Admin::menuLinks(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $link): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <li>
                        <a href="<?php echo e(admin_url($link['uri']), false); ?>"><i class="fa <?php echo e($link['icon'], false); ?>"></i><?php echo e(admin_trans($link['title']), false); ?></a>
                    </li>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </ul>
            </div>
        </form>
        <!-- /.search form -->
        <?php endif; ?>

        <!-- Sidebar Menu -->
        <ul class="sidebar-menu">
            <li class="header"><?php echo e(trans('admin.menu'), false); ?></li>

            <?php echo $__env->renderEach('admin::partials.menu', Admin::menu(), 'item'); ?>

        </ul>
        <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
</aside><?php /**PATH C:\github\InvoiceNinja\vendor\encore\laravel-admin\src/../resources/views/partials/sidebar.blade.php ENDPATH**/ ?>