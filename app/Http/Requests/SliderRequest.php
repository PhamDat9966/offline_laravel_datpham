<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class SliderRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize() // Ủy quyền, phải return true mới được validate
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
        return [
            'name'          => 'required|min:3',           //'title' => 'required|unique:posts|max:255',
            'description'   => 'required',
            'link'          => 'bail|required|min:5|url',
        ];
    }

    public function messages()  // Định nghĩa lại url
    {
        return [
            'name.required'         => 'Name không được rỗng',
            'name.min'              => 'Name :input chiều dài phải có ít nhất phải có :min ký tự',
            //'description.required'  => 'Description không được rỗng',
            'link.required'         => 'Link không được rỗng',
            'link.min'              => 'Link chiều dài phải có ít nhất phải có :min ký tự',
            'link.url'              => 'Link phải là một url',
        ];
    }

    public function attributes()
    {
        return [
            'description' => 'Field Description: '
        ];
    }

}
