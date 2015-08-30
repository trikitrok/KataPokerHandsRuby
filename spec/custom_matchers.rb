RSpec::Matchers.define :score do |expected|
  match do |actual|
    actual.score == expected
  end
  failure_message do |actual|
    "expected '#{actual.score}' score but it actually was '#{expected}'"
  end
end
