class MemosController < ApplicationController
  def index
    @memos = Memo.all
  end
  
  def show
    @memo = Memo.find(params[:id])
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
    @memo = Memo.find(params[:id])
  end
  
  def update
    @memo = Memo.find(params[:id])
    if @memo.update(memo_params)
      flash[:success] = 'メモを更新しました'
      redirect_to @memo
    else
      flash.now[:danger] = 'メモが更新されませんでした'
      render :edit
    end
  end
  
  def destroy
    @memo = Memo.find(params[:id])
    @memo.destroy
    flash[:success] = 'メモを削除しました'
    redirect_to memos_url
  end
  
  private
  
  def memo_params
    params.require(:memo).permit(:title, :content)
  end
  
end
