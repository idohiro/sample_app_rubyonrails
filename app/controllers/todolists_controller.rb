class TodolistsController < ApplicationController
  def new

    @list = List.new
  end

  def create
    # １. データを新規登録するためのインスタンス作成
    list = list.new(list_params)
    # ２. データをデータベースに保存するためのsaveメソッド実行
    list.save
    # ３. トップ画面へリダイレクト
    redirect_to '/top'
    redirect_to todolist_path(list.id)

       @list = List.new(list_params)
    if @list.save
      redirect_to todolist_path(@list.id)
    else
      render :new
    end

  end

  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body)
    params.require(:list).permit(:title, :body, :image)
  end


  def index
 @lists = List.all
  end

 def show
 @list = List.find(params[:id])
 end

  def edit
    @list = List.find(params[:id])
  end

  def update
     list = List.find(params[:id])
    list.update(list_params)
    redirect_to todolist_path(list.id)
  end

end

