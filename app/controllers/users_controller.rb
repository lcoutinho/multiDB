class UsersController < ApplicationController

  def index
    require 'benchmark'
    #array = (1..1000000).map { rand }

    #Benchmark.bmbm do |x|
    #  x.report("sort!") { array.dup.sort! }
    #  x.report("sort")  { array.dup.sort  }
    #end

    #@users = User.on_db(:users).all
    #@users2 = User.on_db(:users2).all
    #@users3 = User.on_db(:users3).all
    #@users4 = User.on_db(:users4).all
    #@users5 = User.on_db(:users5).all
    @users = User.on_db(:users).limit(800)
    @users2 = User.on_db(:users2).limit(800)
    @users3 = User.on_db(:users3).limit(800)
    @users4 = User.on_db(:users4).limit(800)
    @users5 = User.on_db(:users5).limit(800)

    Benchmark.bmbm do |x|
      x.report("CreateHash!") { @users_hash = Hash[*@users.map{ |p| [p.id, p] }.flatten] }
      @users2_hash = Hash[*@users2.map{ |p| [p.id, p] }.flatten]
      @users3_hash = Hash[*@users3.map{ |p| [p.id, p] }.flatten]
      @users4_hash = Hash[*@users4.map{ |p| [p.id, p] }.flatten]
      @users5_hash = Hash[*@users5.map{ |p| [p.id, p] }.flatten]
    

      logger.info 'Busca no BD completa...'

    

      @sameID_hash = {}

      x.report("WithHash"){
      @users_hash.keys.each do |k|
        #logger.info u

        @temp = ''

        if @users2_hash.has_key?(k) then
          @temp = @temp + @users2_hash[k].name
        end

        if @users3_hash.has_key?(k) then
          @temp = @temp + @users3_hash[k].name
        end

        if @users4_hash.has_key?(k) then
          @temp = @temp + @users4_hash[k].name
        end

        if @users5_hash.has_key?(k) then
          @temp = @temp + @users5_hash[k].name
        end

        unless @temp.nil? || @temp == ''
          @sameID_hash[k] = @users_hash[k].name + @temp
        end

      end }


      @sameID = []

      x.report('WithArrayLentoBagarai') {
      @users.each do |u|

        #logger.info 'User ' + u.id.to_s

        @temp = ''
        @u2 = (@users2.detect {|a| a.id == u.id})
        @u3 = (@users3.detect {|a| a.id == u.id})
        @u4 = (@users4.detect {|a| a.id == u.id})
        @u5 = (@users5.detect {|a| a.id == u.id})

        unless @u2.nil?
          @temp = @temp + @u2.name
        end

        unless @u3.nil?
          @temp = @temp + @u3.name
        end

        unless @u4.nil?
          @temp = @temp + @u4.name
        end

        unless @u5.nil?
          @temp = @temp + @u5.name
        end

        unless @temp.nil? || @temp == ''
          @sameID.push(u.id => u.name + @temp)
        end
        
      end }
      
    end #end benchmarck

  end

end
