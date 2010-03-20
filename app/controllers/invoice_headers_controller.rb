class InvoiceHeadersController < ApplicationController

  before_filter :setup_combos, :only => [:new, :create, :edit, :update]

  # GET /invoice_headers
  # GET /invoice_headers.xml
  def index
    @invoice_headers = InvoiceHeader.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @invoice_headers }
    end
  end

  # GET /invoice_headers/1
  # GET /invoice_headers/1.xml
  def show
    @invoice_header = InvoiceHeader.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @invoice_header }
    end
  end

  # GET /invoice_headers/new
  # GET /invoice_headers/new.xml
  def new
    @invoice_header = InvoiceHeader.new
    @invoice_header.date = Date.parse "2010-03-05"

    @invoice_header.payment_mode = 1

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @invoice_header }
    end
  end

  # GET /invoice_headers/1/edit
  def edit
    @invoice_header = InvoiceHeader.find(params[:id])
  end

  # POST /invoice_headers
  # POST /invoice_headers.xml
  def create
    @invoice_header = InvoiceHeader.new(params[:invoice_header])
    @invoice_header.client = Client.find(params[:invoice_header][:client_id])

    respond_to do |format|
      if @invoice_header.save
        flash[:notice] = 'InvoiceHeader was successfully created.'
        format.html { redirect_to(@invoice_header) }
        format.xml  { render :xml => @invoice_header, :status => :created, :location => @invoice_header }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @invoice_header.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /invoice_headers/1
  # PUT /invoice_headers/1.xml
  def update
    @invoice_header = InvoiceHeader.find(params[:id])

    respond_to do |format|
      if @invoice_header.update_attributes(params[:invoice_header])
        flash[:notice] = 'InvoiceHeader was successfully updated.'
        format.html { redirect_to(@invoice_header) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @invoice_header.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /invoice_headers/1
  # DELETE /invoice_headers/1.xml
  def destroy
    @invoice_header = InvoiceHeader.find(params[:id])
    @invoice_header.destroy

    respond_to do |format|
      format.html { redirect_to(invoice_headers_url) }
      format.xml  { head :ok }
    end
  end

  def paid
    @invoice_headers = InvoiceHeader.paid_invoices true
    respond_to do |format|
      format.html { render :action => "index" }
    end
  end

  private
  def setup_combos
      @payment_modes = { "Cash" => 1, "Check" => 2, "Credit Card" => 3 }
      @clients = Client.all.collect { |c| [c.nombre, c.id] }
  end
end
