<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
/**
 * SliderRequest lớp có nhiều nhiệm vụ, một trong số đó là Validate dữ liệu
 */
class SliderRequest extends FormRequest
{
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
        $id         = $this->id;
        $condThumb  = 'bail|required|mimes:jpeg,jpg,png,gif|max:1000';
        if(!empty($id)) {
            $condThumb  = 'bail|mimes:jpeg,jpg,png,gif|max:1000'; // required validate ở đây là không được rỗng, nếu có id thì loại điều kiện này ra
        }
        return [
            'name'          => 'bail|required|min:5',           //'title' => 'required|unique:posts|max:255',
            'description'   => 'bail|required|min:5',
            'link'          => 'bail|required|min:5|url',
            'status'        => 'bail|in:active,inactive',
            //'thumb'         => 'bail|required|image|max:200',
            'thumb'         => $condThumb,
        ];
    }

    public function messages()  // Định nghĩa lại url
    {
        return [
            // 'name.required'         => 'Name không được rỗng',
            // 'name.min'              => 'Name :input chiều dài phải có ít nhất phải có :min ký tự',
            // 'link.required'         => 'Link không được rỗng',
            // 'link.min'              => 'Link chiều dài phải có ít nhất phải có :min ký tự',
            // 'link.url'              => 'Link phải là một url',
        ];
    }

    public function attributes()
    {
        return [
            //'description' => 'Field Description: '
        ];
    }

}
