---
layout: page
title: Search
---

<style>
    #search-container {
        max-width: 100%;
    }

    input[type=text] {
        font-size: normal;
        outline: none;
        padding: 0.5rem;
        background: #F0F0F0;
        width: 100%;
        -webkit-appearance: none;
        font-family: inherit;
        font-size: 100%;
        color: #606060;
        border: none;
        border-radius: 0.5rem;
    }

    ::placeholder {
        color: #C0C0C0;
    }

    #results-container {
        margin: .5rem 0;
    }
</style>

<!-- Html Elements for Search -->
<div id="search-container">
    <input type="text" id="search-input" placeholder="Search...">
    <ul id="results-container" style="list-style-type: none;"></ul>
</div>

<!-- Script pointing to search-script.js -->
<script src="{{site.baseurl}}/search.js" type="text/javascript"></script>

<!-- Configuration -->
<script type="text/javascript">
    SimpleJekyllSearch({
        searchInput: document.getElementById('search-input'),
        resultsContainer: document.getElementById('results-container'),
        json: '{{site.baseurl}}/search.json',
        searchResultTemplate: '<li><a href="{url}" title="{desc}">{title}</a></li>',
        noResultsText: 'No results found',
        limit: 10,
        fuzzy: false,
        exclude: ['Welcome']
    })
</script>
