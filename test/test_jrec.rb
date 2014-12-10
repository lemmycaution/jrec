require 'minitest_helper'
require 'jrec'
require 'oj'
ENV['DATABASE_URL']='postgres://localhost:5432/flatcare'

class TestJrec < MiniTest::Unit::TestCase
 
  def setup
    Jrec.exec_func "create_table", "public", "users"
  end
  def teardown
    Jrec.exec_func "drop_table", "public", "users"
  end

  def test_collection
    assert Oj.load(Jrec::Collection['users'].upsert({"name" => "hola"}));
    assert_equal 1, Oj.load(Jrec::Collection['users'].query({"where" => {"name" =>"hola"}})).length;    
  end
  
  class User < Jrec::Model
    data_attr_accessor :name
    self.table = :users
    self.schema = :public
  end
  
  def test_model
    user = User.create(name: "sakir")
    assert user.persisted?
  end
  
end
