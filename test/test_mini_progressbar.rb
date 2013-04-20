require "minitest/unit"
require "mini_progressbar"
MiniTest::Unit.autorun

class TestMiniProgressbar < MiniTest::Unit::TestCase
	def setup
		# このテストには不必要なので標準出力を抑える
		$stdout, @orig_stdout = open("/dev/null", "w"), $stdout
		@progressbar = MiniProgressbar.new 100
	end

	def teardown
		$stdout = @orig_stdout
	end

	def test_goal_set_100
		assert_equal @progressbar.goal, 100
	end

	def test_now_set_0_on_init
		assert_equal @progressbar.now, 0
	end

	def test_now_succeeds
		@progressbar.succeed
		assert_equal @progressbar.now, 1
	end
end
