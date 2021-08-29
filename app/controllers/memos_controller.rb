class MemosController < ApplicationController
  before_action :set_memo, only: [:show, :edit, :update, :destroy]
  
  def index
    @memos = Memo.all.page(params[:page]).per(10)
  end
  
  def show
  end
  
  def new
    @memo = Memo.new
  end
  
  def create
    @memo = Memo.new(memo_params)
    if @memo.save
      flash[:success] = 'メモが作成されました'
      redirect_to @memo
    else
      flash.now[:danger] = 'メモが作成されませんでした'
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @memo.update(memo_params)
      flash[:success] = 'メモを更新しました'
      redirect_to @memo
    else
      flash.now[:danger] = 'メモが更新されませんでした'
      render :edit
    end
  end
  
  def destroy
    @memo.destroy
    flash[:success] = 'メモを削除しました'
    redirect_to memos_url
  end
  
  private
  
  def set_memo
    @memo = Memo.find(params[:id])
  end
  
  def memo_params
    params.require(:memo).permit(:title, :content)
  end
  
end
