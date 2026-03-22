#!/usr/bin/env ruby
# Script to generate tag pages for publications
# Run this before building Jekyll: ruby generate_tag_pages.rb

# -*- coding: utf-8 -*-
require 'yaml'
require 'fileutils'
require 'set'

# Get all publications
publications_dir = '_publications'
publications = []

Dir.glob(File.join(publications_dir, '*.md')).each do |file|
  content = File.read(file, encoding: 'utf-8')
  # Allow EOF immediately after closing --- (missing trailing newline breaks the old pattern)
  if content =~ /\A---\s*\n(.*?)\n---\s*\n?(.*)\z/m
    front_matter = YAML.safe_load($1)
    if front_matter && front_matter['tags'] && front_matter['tags'].is_a?(Array)
      publications << front_matter
    end
  end
end

# Collect all unique tags
all_tags = Set.new
publications.each do |pub|
  pub['tags'].each do |tag|
    all_tags.add(tag)
  end
end

# Read template
template_path = 'publications/tag_template.html'
unless File.exist?(template_path)
  puts "Error: Template not found at #{File.expand_path(template_path)}"
  puts "Current directory: #{Dir.pwd}"
  exit 1
end

template_content = File.read(template_path, encoding: 'utf-8')
if template_content =~ /\A---\s*\n(.*?)\n---\s*\n?(.*)\z/m
  template_body = $2
else
  template_body = template_content
end

# Generate a page for each tag
output_dir = 'publications'
FileUtils.mkdir_p(output_dir)

all_tags.each do |tag|
  tag_slug = tag.downcase.gsub(/\s+/, '-')
  output_file = File.join(output_dir, "#{tag_slug}.html")
  
  # Create front matter
  front_matter = {
    'layout' => 'page',
    'title' => "Publications on \"#{tag}\"",
    'tag' => tag,
    'tag_slug' => tag_slug,
    'permalink' => "/publications/#{tag_slug}/"
  }
  
  # Write the file
  File.open(output_file, 'w', encoding: 'utf-8') do |f|
    f.puts '---'
    # Convert to YAML and write each line manually to avoid extra ---
    f.puts "layout: #{front_matter['layout']}"
    f.puts "title: #{front_matter['title'].inspect}"
    f.puts "tag: #{front_matter['tag'].inspect}"
    f.puts "tag_slug: #{front_matter['tag_slug']}"
    f.puts "permalink: #{front_matter['permalink'].inspect}"
    f.puts '---'
    f.puts template_body.strip
  end
  
  puts "Generated: #{output_file}"
end

puts "\nGenerated #{all_tags.size} tag pages."

