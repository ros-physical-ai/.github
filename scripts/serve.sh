#!/bin/bash
# Local development server script
# Uses Gemfile.local to avoid github-pages API issues

# Use local Gemfile that excludes github-pages gem
BUNDLE_GEMFILE=Gemfile.local bundle install --quiet 2>/dev/null || bundle install --gemfile=Gemfile.local

# Change to docs directory and run Jekyll from there (where _config.yml is)
cd docs
BUNDLE_GEMFILE=../Gemfile.local bundle exec jekyll serve "$@"
