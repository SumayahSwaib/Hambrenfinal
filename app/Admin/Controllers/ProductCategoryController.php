<?php

namespace App\Admin\Controllers;

use App\Models\ProductCategory;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class ProductCategoryController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'ProductCategory';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new ProductCategory());

        $grid->column('id', __('Id'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));
        $grid->column('category', __('Category'));
        $grid->column('status', __('Status'));
        $grid->column('user', __('User'));
        $grid->column('date_created', __('Date created'));
        $grid->column('date_updated', __('Date updated'));
        $grid->column('url', __('Url'));
        $grid->column('default_amount', __('Default amount'));
        $grid->column('image', __('Image'));
        $grid->column('image_origin', __('Image origin'));
        $grid->column('banner_image', __('Banner image'));
        $grid->column('show_in_banner', __('Show in banner'));
        $grid->column('show_in_categories', __('Show in categories'));

        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(ProductCategory::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('category', __('Category'));
        $show->field('status', __('Status'));
        $show->field('user', __('User'));
        $show->field('date_created', __('Date created'));
        $show->field('date_updated', __('Date updated'));
        $show->field('url', __('Url'));
        $show->field('default_amount', __('Default amount'));
        $show->field('image', __('Image'));
        $show->field('image_origin', __('Image origin'));
        $show->field('banner_image', __('Banner image'));
        $show->field('show_in_banner', __('Show in banner'));
        $show->field('show_in_categories', __('Show in categories'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new ProductCategory());

        $form->text('category', __('Category'));
        $form->switch('status', __('Status'))->default(1);
        $form->number('user', __('User'));
        $form->date('date_created', __('Date created'))->default(date('Y-m-d'));
        $form->datetime('date_updated', __('Date updated'))->default(date('Y-m-d H:i:s'));
        $form->url('url', __('Url'));
        $form->number('default_amount', __('Default amount'))->default(6000);
        $form->image('image', __('Image'))->default('blank.png');
        $form->number('image_origin', __('Image origin'))->default(1);
        $form->textarea('banner_image', __('Banner image'));
        $form->text('show_in_banner', __('Show in banner'));
        $form->text('show_in_categories', __('Show in categories'));

        return $form;
    }
}
