<!-- Main Footer -->
<footer class="main-footer">
    <!-- To the right -->
    <div class="pull-right hidden-xs">
        <?php if(config('admin.show_environment')): ?>
            <strong>Env</strong>&nbsp;&nbsp; <?php echo config('app.env'); ?>

        <?php endif; ?>

        &nbsp;&nbsp;&nbsp;&nbsp;

        <?php if(config('admin.show_version')): ?>
        <strong>Version</strong>&nbsp;&nbsp; <?php echo \Encore\Admin\Admin::VERSION; ?>

        <?php endif; ?>

    </div>
    <!-- Default to the left -->
    <p class="nav d-block    text-md-start pb-2 pb-lg-0 mb-0">
        Hand-made with ❤️ by
        <b><a class="nav-link d-inline-block p-0 text-primary" href="https://twitter.com/mubahood360"
            target="_blank" rel="noopener">Sumayya Swaib 🥰</a></b>
    </p>
</footer><?php /**PATH C:\xampp\htdocs\ham\vendor\encore\laravel-admin\src/../resources/views/partials/footer.blade.php ENDPATH**/ ?>