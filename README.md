<p align="center">
    <h2 align="center">Indigo Minimalist Jekyll Template - <a href="https://sergiokopplin.github.io/indigo/">Demo</a></h2>
</p>

<p align="center">This is a simple and minimalist template for Jekyll for those who likes to eat noodles.</p>

***

<p align="center">
    <b><a href="README.md#what-has-inside">What has inside</a></b>
    |
    <b><a href="README.md#setup">Setup</a></b>
    |
    <b><a href="README.md#settings">Settings</a></b>
    |
    <b><a href="README.md#how-to">How to</a></b>
</p>

<p align="center">
    Light and Dark themes.
</p>

<p align="center">
    <img src="https://raw.githubusercontent.com/sergiokopplin/indigo/gh-pages/assets/screen-shot.png" />
</p>

## What has inside

- [Jekyll](https://jekyllrb.com/), [Sass](https://sass-lang.com/) ~[RSCSS](https://rscss.io/)~ and [SVG](https://www.w3.org/Graphics/SVG/);
- Page Speed: [99~Desktop](https://pagespeed.web.dev/analysis/https-sergiokopplin-github-io-indigo/41axptm3as?utm_source=psi&utm_medium=redirect&form_factor=desktop);

## Setup

0. :star: to the project. :metal:
1. Fork the project [Indigo](https://github.com/sergiokopplin/indigo/fork)
2. Edit `_config.yml` with your data
3. Write some posts :bowtie:

## Local development & preview

### Running on macOS

#### Option 1: Using Ruby/Bundler (Recommended)

1. **Install Xcode Command Line Tools** (includes C compiler and make):
   ```sh
   xcode-select --install
   ```

2. **Install Ruby** (macOS comes with Ruby, but you may want a newer version):
   - Check your Ruby version: `ruby --version`
   - If you need Ruby 2.7+, consider using [rbenv](https://github.com/rbenv/rbenv) or [Homebrew](https://brew.sh/):
     ```sh
     # Using Homebrew
     brew install ruby
     ```

3. **Install Bundler**:
   ```sh
   gem install bundler
   ```

4. **Navigate to the project directory**:
   ```sh
   cd /path/to/thomas-ferraz.github.io
   ```

5. **Install dependencies**:
   ```sh
   bundle install
   ```
   If you encounter permission issues, you may need to use `sudo` or install gems to a local path:
   ```sh
   bundle config set --local path vendor/bundle
   bundle install
   ```

6. **Start the local Jekyll server**:
   ```sh
   bundle exec jekyll serve --livereload --drafts
   ```

7. **Open your browser** and visit [http://localhost:4000](http://localhost:4000)

8. **Stop the server** by pressing `Ctrl+C` in the terminal

#### Option 2: Using Docker (No Ruby installation needed)

1. **Install Docker Desktop for Mac**:
   - Download from [docker.com/products/docker-desktop](https://www.docker.com/products/docker-desktop/)
   - Install and start Docker Desktop

2. **Navigate to the project directory**:
   ```sh
   cd /path/to/thomas-ferraz.github.io
   ```

3. **Start the Docker container**:
   ```sh
   docker-compose up
   ```
   The first run will download the Jekyll image and may take a few minutes.

4. **Open your browser** and visit [http://localhost:4000](http://localhost:4000)

5. **Stop the container**:
   - Press `Ctrl+C` to stop
   - Run `docker-compose down` to remove the container

### Prerequisites

The site is a standard [Jekyll](https://jekyllrb.com/) project. To run it locally you will need:

- [Ruby](https://www.ruby-lang.org/en/) 2.7 or newer with development headers.
- [Bundler](https://bundler.io/) (`gem install bundler`).
- [Jekyll](https://jekyllrb.com/) (`gem install jekyll`) – the `github-pages` gem supplied in the `Gemfile` includes the right version, so installing Bundler is usually enough.
- A working C compiler and `make` (these ship with Xcode Command Line Tools on macOS and `build-essential` on Debian/Ubuntu).

Optional but recommended:

- [Docker](https://www.docker.com/) and [Docker Compose](https://docs.docker.com/compose/) if you prefer to run the site without installing Ruby locally.

### Run with Ruby/Bundler

1. Clone the repository and install dependencies:
   ```sh
   bundle install
   ```
   If you prefer to keep gems isolated, set a local path first: `bundle config set --local path vendor/bundle`.
2. Start the local server with live reload and draft support:
   ```sh
   bundle exec jekyll serve --livereload --drafts
   ```
3. Open [http://localhost:4000](http://localhost:4000) in your browser to preview the site.
4. When you are finished, press `Ctrl+C` in the terminal to stop the server.

### Run with Docker

1. Ensure Docker and Docker Compose are running.
2. Start the development container (the first run will pull the images and install gems):
   ```sh
   docker-compose up
   ```
   Add `--build` if you change dependencies inside the image.
3. Visit [http://localhost:4000](http://localhost:4000) to view the generated site.
4. Stop the stack with `Ctrl+C`, then `docker-compose down` to free resources.

Changes you make to the source files will trigger an automatic rebuild in both workflows, making it easy to test content or layout tweaks before deploying. For a production-style check you can also run `bundle exec jekyll build` to generate the static site into the `_site` directory.

## Settings

You can customize your site on `_config.yml` file.

## How To?

Check the [FAQ](./FAQ.md).

---
## License

[MIT](https://kopplin.mit-license.org/) License © Sérgio Kopplin

---

[![Star History Chart](https://api.star-history.com/svg?repos=sergiokopplin/indigo&type=Date)](https://star-history.com/#sergiokopplin/indigo&Date)
