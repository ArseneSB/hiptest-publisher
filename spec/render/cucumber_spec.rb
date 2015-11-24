require_relative '../spec_helper'
require_relative '../render_shared'

describe 'Cucumber rendering' do
  it_behaves_like 'a BDD renderer' do
    let(:language) {'cucumber'}
    let(:rendered_actionwords) {
      [
        "# encoding: UTF-8",
        "",
        "require_relative 'actionwords'",
        "World(Actionwords)",
        "",
        "Given /^the color \"(.*)\"$/ do |color|",
        "  the_color_color(color)",
        "end",
        "",
        "When /^you mix colors$/ do",
        "  you_mix_colors",
        "end",
        "",
        "Then /^you obtain \"(.*)\"$/ do |color|",
        "  you_obtain_color(color)",
        "end",
        "",
      ].join("\n")
    }
  end
end

describe 'Cucumber/Java rendering' do
  it_behaves_like 'a BDD renderer' do
    let(:language) {'cucumber'}
    let(:framework) {'java'}

    let(:rendered_actionwords) {
      [
        'package com.example;',
        '',
        'public class StepDefinitions {',
        '    @Given("^the color \"(.*)\"$")',
        '    public void theColorColor(String color) {',
        '        theColorColor(color);',
        '    }',
        '',
        '    @Given("^you mix colors$")',
        '    public void youMixColors() {',
        '        youMixColors();',
        '    }',
        '',
        '    @Given("^you obtain \"(.*)\"$")',
        '    public void youObtainColor(String color) {',
        '        youObtainColor(color);',
        '    }',
        '}'
      ].join("\n")
    }
  end
end