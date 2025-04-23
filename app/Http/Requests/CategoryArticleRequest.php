<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
/**
 * CategoryRequest lớp có nhiều nhiệm vụ, một trong số đó là Validate dữ liệu
 */
class CategoryArticleRequest extends FormRequest
{
    protected $table = "category_article";
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize() // Ủy quyền, phải return true mới được validate, mục đích ngằm ngăn chặn ip của một cá nhân hay khu vực là hacker
    {
        return true;
    }

    protected function prepareForValidation()
    {
        /* Tiền sử lý */
        $this->merge([
            'name' => $this->input('name-vi'),
            'slug' => $this->input('slug-vi')
        ]);
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        $task = 'add';
        $id         = $this->id;
        $condName   = "bail|required|between:3,100|unique:$this->table,name";
        if(!empty($id)) {
            $condName   = "bail|required|between:3,100|unique:$this->table,name,$id";
        }
        $condSlug   = "bail|required";

        $condNameEn   = "bail|required|between:3,100|unique:category_article_translations,name";
        $condSlugEn   = "bail|required";
        return [
            'name-vi'       => $condName,
            'slug-vi'       => $condSlug,
            'name-en'       => $condNameEn,
            'slug-en'       => $condSlugEn,
            'status'        => 'bail|in:active,inactive'
        ];
    }

    public function messages()  // Định nghĩa lại url
    {
        return [
            'name-vi.required'      => 'Name tiếng việt không được rỗng',
            'name-vi.min'           => 'Name tiếng việt :input chiều dài phải có ít nhất phải có :min ký tự',
            'name-vi.unique'        => 'Name tiếng việt này đã tồn tại',
            'slug-vi.required'      => 'Link tiếng việt không được rỗng, hãy điền vào ô name để slug tự nhập',
            'name-en.required'      => 'Name tiếng anh không được rỗng',
            'name-en.min'           => 'Name tiếng anh :input chiều dài phải có ít nhất phải có :min ký tự',
            'name-en.unique'        => 'Name Tiếng anh này đã tồn tại',
            'slug-en.required'      => 'Link tiếng anh không được rỗng, hãy điền vào ô name để slug tự nhập',
            'status.in'             => 'Hãy chon status có giá trị là active hoặc inactive'
        ];
    }

    public function attributes()
    {
        return [
            //'description' => 'Field Description: '
        ];
    }

}
