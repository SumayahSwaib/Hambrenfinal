<?php

namespace App\Admin\Controllers;

use App\Models\Product;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Support\Facades\Auth;

class ProductController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Products';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Product());

        $grid->column('id', __('Id'));
        $grid->column('name', __('Name'));
        $grid->column('metric', __('Metric'));
        $grid->column('currency', __('Currency'));
        $grid->column('description', __('Description'));
        $grid->column('summary', __('Summary'));
        $grid->column('price_1', __('Price 1'));
        $grid->column('price_2', __('Price 2'));
        $grid->column('feature_photo', __('Feature photo'));
        $grid->column('rates', __('Rates'));
        $grid->column('date_added', __('Date added'));
        $grid->column('date_updated', __('Date updated'));
        $grid->column('user', __('User'));
        $grid->column('category', __('Category'));
        $grid->column('sub_category', __('Sub category'));
        $grid->column('supplier', __('Supplier'));
        $grid->column('url', __('Url'));
        $grid->column('status', __('Status'));
        $grid->column('in_stock', __('In stock'));
        $grid->column('keywords', __('Keywords'));
        $grid->column('p_type', __('P type'));
        $grid->column('local_id', __('Local id'));
        $grid->column('updated_at', __('Updated at'));
        $grid->column('created_at', __('Created at'));
        $grid->column('data', __('Data'));

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
        $show = new Show(Product::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('name', __('Name'));
        $show->field('metric', __('Metric'));
        $show->field('currency', __('Currency'));
        $show->field('description', __('Description'));
        $show->field('summary', __('Summary'));
        $show->field('price_1', __('Price 1'));
        $show->field('price_2', __('Price 2'));
        $show->field('feature_photo', __('Feature photo'));
        $show->field('rates', __('Rates'));
        $show->field('date_added', __('Date added'));
        $show->field('date_updated', __('Date updated'));
        $show->field('user', __('User'));
        $show->field('category', __('Category'));
        $show->field('sub_category', __('Sub category'));
        $show->field('supplier', __('Supplier'));
        $show->field('url', __('Url'));
        $show->field('status', __('Status'));
        $show->field('in_stock', __('In stock'));
        $show->field('keywords', __('Keywords'));
        $show->field('p_type', __('P type'));
        $show->field('local_id', __('Local id'));
        $show->field('updated_at', __('Updated at'));
        $show->field('created_at', __('Created at'));
        $show->field('data', __('Data'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Product());


        if ($form->isCreating()) {
            $form->hidden('user', __('Product provider'))->default(Auth::user()->id)->readOnly()->rules('required');
        }

        $form->text('name', __('Name'));
        $form->number('metric', __('Metric'));
        $form->number('currency', __('Currency'));
        $form->textarea('description', __('Description'));
        $form->textarea('summary', __('Summary'));
        $form->number('price_1', __('Price 1'));
        $form->number('price_2', __('Price 2'));
        $form->text('feature_photo', __('Feature photo'));
        $form->decimal('rates', __('Rates'));
        $form->date('date_added', __('Date added'))->default(date('Y-m-d'));
        $form->datetime('date_updated', __('Date updated'))->default(date('Y-m-d H:i:s'));
        $form->number('category', __('Category'));
        $form->number('sub_category', __('Sub category'));
        $form->number('supplier', __('Supplier'));
        /* $form->url('url', __('Url')); */
        $form->switch('status', __('Status'));
        $form->switch('in_stock', __('In stock'));
        $form->textarea('keywords', __('Keywords'));
        $form->number('p_type', __('P type'));
        $form->number('local_id', __('Local id'));
        $form->keyValue('data', __('Data'));

        

        return $form;
    }
}
