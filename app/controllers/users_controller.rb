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

    logger.info 'Busca no BD completa...'

    @sameID = []
    Benchmark.bmbm do |x|
      @users.each do |u|

        logger.info 'User ' + u.id.to_s

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
          @sameID.push(u.id => @temp)
        end
        
      end
    end

  end

end
