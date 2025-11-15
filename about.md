---
title: About
layout: page
---
{% assign profile = site.data.profile %}
{% assign publications = profile.selected_publications %}
{% assign news_items = site.data.news | sort: 'date' | reverse %}

![Profile Image]({% if site.external-image %}{{ site.picture }}{% else %}{{ site.url }}/{{ site.picture }}{% endif %})

<section class="bio-section" aria-labelledby="short-bio-heading">
    <h2 id="short-bio-heading">👤 Short Bio</h2>
    <p>
        {{ profile.bio.short | markdownify | strip_html }}
    </p>
</section>

<section id="research-interests" class="research-section" aria-labelledby="research-heading">
    <h2 id="research-heading">🔬 Research Interests</h2>
    <ul>
        <li><strong>Low-resource NLP:</strong> Developing techniques to enhance language models for less-represented languages.</li>
        <li><strong>Adversarial Robustness:</strong> Creating methods to make NLP systems more resilient against adversarial inputs.</li>
        <li><strong>Efficient Models:</strong> Optimizing model architectures for better performance with fewer resources.</li>
        <li><strong>Speech Recognition and Translation:</strong> Improving multilingual speech models for accurate transcription and translation in low-resource settings.</li>
    </ul>
</section>

{% if publications %}
<section class="publications-section" aria-labelledby="selected-publications-heading">
    <h2 id="selected-publications-heading">📝 Selected Publications</h2>
    <p>{{ profile.selected_publications_intro }}</p>
    <ul class="publications-list">
        {% for pub in publications %}
        <li class="publication-item">
            <article class="publication-row">
                {% if pub.image %}
                <div class="publication-thumbnail">
                    <a href="{% if pub.pdf %}{{ pub.pdf }}{% elsif pub.arxiv %}{{ pub.arxiv }}{% else %}#{% endif %}" target="_blank" rel="noopener" aria-label="Read {{ pub.title }}">
                        <img src="{{ pub.image | relative_url }}" alt="Illustration for {{ pub.title }}">
                    </a>
                </div>
                {% endif %}
                <div class="publication-content">
                    <h3 class="publication-title">
                        <a href="{% if pub.pdf %}{{ pub.pdf }}{% elsif pub.arxiv %}{{ pub.arxiv }}{% else %}#{% endif %}" target="_blank" rel="noopener">
                            {{ pub.title }}
                        </a>
                    </h3>
                    <p class="publication-authors">{{ pub.authors }}</p>
                    <p class="publication-venue">{{ pub.venue }}</p>
                    {% if pub.summary %}
                    <p class="publication-summary"><strong>TL;DR:</strong> {{ pub.summary }}</p>
                    {% endif %}
                    <div class="publication-buttons">
                        {% if pub.arxiv %}
                        <a href="{{ pub.arxiv }}" target="_blank" rel="noopener" class="pub-button">ARXIV</a>
                        {% endif %}
                        {% if pub.bib %}
                        <a href="{{ pub.bib }}" target="_blank" rel="noopener" class="pub-button">BIB</a>
                        {% endif %}
                        {% if pub.pdf %}
                        <a href="{{ pub.pdf }}" target="_blank" rel="noopener" class="pub-button">PDF</a>
                        {% endif %}
                        {% if pub.code %}
                        <a href="{{ pub.code }}" target="_blank" rel="noopener" class="pub-button">CODE</a>
                        {% endif %}
                        {% if pub.site %}
                        <a href="{{ pub.site }}" target="_blank" rel="noopener" class="pub-button">SITE</a>
                        {% endif %}
                        {% if pub.twitter %}
                        <a href="{{ pub.twitter }}" target="_blank" rel="noopener" class="pub-button">TWITTER</a>
                        {% endif %}
                    </div>
                </div>
            </article>
        </li>
        {% endfor %}
    </ul>
</section>
{% endif %}

{% if news_items and news_items.size > 0 %}
<section class="news-section" aria-labelledby="news-heading">
    <h2 id="news-heading">📰 News</h2>
    <p>Highlights from recent projects, publications, and milestones.</p>
    <ul class="news-list">
        {% for item in news_items %}
        <li>
            <article>
                <p class="news-date">
                    <time datetime="{{ item.date | date_to_xmlschema }}">{{ item.date | date: "%b %Y" }}</time>
                </p>
                <h3>{{ item.title }}</h3>
                <p>{{ item.description }}</p>
                {% if item.link and item.link.url %}
                <p>
                    <a href="{{ item.link.url }}" target="_blank" rel="noopener">
                        {{ item.link.label | default: 'Learn more' }}
                    </a>
                </p>
                {% endif %}
            </article>
        </li>
        {% endfor %}
    </ul>
</section>
{% endif %}
