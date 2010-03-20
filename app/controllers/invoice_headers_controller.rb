class InvoiceHeadersController < ApplicationController
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
end
