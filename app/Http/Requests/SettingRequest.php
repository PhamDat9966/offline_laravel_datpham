<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
/**
 * CategoryRequest lớp có nhiều nhiệm vụ, một trong số đó là Validate dữ liệu
 */
class SettingRequest extends FormRequest
{
    protected $table = "setting";
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
        $task = "";
        if(isset($this->taskGeneral))   $task = "general";
        if(isset($this->taskEmail))     $task = "email";
        if(isset($this->taskSocial))    $task = "social";

        switch ($task) {
            case 'general':
                $condLogo           = 'bail|required';          // required ở đây nghĩa là không được rỗng
                $condHotline        = 'bail|required|numeric';
                $condTimeword       = 'bail|required';
                $condCopyright      = 'bail|required';
                $condAddress        = 'bail|required';
                $condIntroduction   = 'bail|required';
                break;
            case 'email':
                break;
            case 'social':
                break;
        }

        return [
            'filepath'      => $condLogo,
            'hotline'       => $condHotline,
            'timeword'      => $condTimeword,
            'copyright'     => $condCopyright,
            'address'       => $condAddress,
            'introduction'  => $condIntroduction
        ];
    }

    public function messages()  // Định nghĩa lại url
    {
        return [
            'filepath.required'         => 'Đường dẫn Logo không được rỗng, hãy chọn một hình ảnh có sẵn hoặc tải lên.',
            'hotline.required'          => 'Hotline không được rỗng.',
            'hotline.numeric'           => 'Hotline chỉ nhập ký tự số.',
            'timeword.required'         => 'Timeword không được rỗng',
            'copyright.required'        => 'Copyright không được rỗng.',
            'address.required'          => 'Địa chỉ không được rỗng.',
            'introduction.required'     => 'Hãy viết vài dòng giới thiệu'
        ];
    }

    public function attributes()
    {
        return [
            //'description' => 'Field Description: '
        ];
    }

}
