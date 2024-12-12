<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
/**
 * CategoryRequest lớp có nhiều nhiệm vụ, một trong số đó là Validate dữ liệu
 */
class CouponRequest extends FormRequest
{
    protected $table = "coupon";
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize() // Ủy quyền, phải return true mới được validate, mục đích ngằm ngăn chặn ip của một cá nhân hay khu vực là hacker
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        //dd($this->toArray());
        $id             = $this->id;
        $type           = implode(',',array_keys(config('zvn.template.type_coupon_discount')));

        $condCode       = "bail|required|min:6|max:6|unique:$this->table,code";
        $condType       = "bail|in:$type";
        $condValue      = "bail|numeric|min:1";
        $condEndTime    = "after_or_equal:" . date("Y-m-d");
        $condStartPrice = "bail|numeric|min:1";
        $condEndPrice   = "bail|numeric|min:1|gt:start_price";
        $condTotal      = "bail|numeric|min:1";
        $condStatus     = "bail|in:active,inactive";

        if($this->type == 'percent') $condValue = "|max:100";
        if(!empty($id)) $condCode = "";

        return [
            'code'          => $condCode,
            'type'          => $condType,
            'value'         => $condValue,
            'end_time'      => $condEndTime,
            'start_price'   => $condStartPrice,
            'end_price'     => $condEndPrice,
            'total'         => $condTotal,
            'status'        => $condStatus,
        ];
    }

    public function messages()  // Định nghĩa lại url
    {
        return [
            'name.required'         => 'Tên bài viết không được rỗng',
            'name.between'          => 'Tên bài viết có độ dài từ 5 đển 100 ký tự',
            'name.unique'           => 'Tên bài viết không được trùng với những bài viết sẵn có',
            'status.in'             => 'Status nên chọn active hoặc inactive',
            'thumb.required'        => 'Ảnh không được rỗng',
            'thumb.mimes'           => 'Hãy chọn ảnh có đuôi là : jpeg,jpg,png,gif',
            'thumb.max'             => 'Hãy chọn ảnh có độ lớn nhỏ hơn 10000kb',
            'category_id.numeric'   => 'Hãy chọn một category'
        ];
    }

    public function attributes()
    {
        return [
            //'description' => 'Field Description: '
        ];
    }

}
