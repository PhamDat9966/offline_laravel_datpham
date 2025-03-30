<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateArticleTranslationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('article_translations', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('article_id');
            $table->string('locale')->index(); // Ngôn ngữ (vi, en, ...)
            $table->string('name'); // Tiêu đề bài viết
            $table->string('slug')->nullable();
            $table->text('content')->nullable();

            $table->unique(['article_id', 'locale']); // Đảm bảo 1 bài viết chỉ có 1 bản dịch/ngôn ngữ
            $table->foreign('article_id')->references('id')->on('article')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('article_translations');
    }
}
