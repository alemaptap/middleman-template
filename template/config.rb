activate :aria_current
activate :inline_svg

set :markdown,
  autolink: true,
  fenced_code_blocks: true,
  footnotes: true,
  highlight: true,
  smartypants: true,
  strikethrough: true,
  tables: true,
  with_toc_data: true
set :markdown_engine, :redcarpet

activate :external_pipeline, {
  name: :parcel,
  command: build? ? "npm run build --scripts-prepend-node-path" : "npm run development --scripts-prepend-node-path",
  source: "dist",
}

# page "/*.json", layout: false
# page "/*.txt", layout: false
# page "/*.xml", layout: false

configure :production do
  activate :asset_hash
  activate :gzip
  # activate :minify_css
  activate :minify_html
  # activate :minify_javascript
end

configure :build do
  ignore "assets/*"
end
