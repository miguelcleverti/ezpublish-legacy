{let search=false()}
{section show=$use_template_search}
    {set page_limit=10}
    {set search=fetch(content,search,
                      hash(text,$search_text,
                           section_id,$search_section_id,
                           subtree_array,$search_subtree_array,
                           offset,$view_parameters.offset,
                           limit,$page_limit))}
    {set search_result=$search['SearchResult']}
    {set search_count=$search['SearchCount']}
    {set stop_word_array=$search['StopWordArray']}
    {set search_data=$search}
{/section}

<form action={"/content/search/"|ezurl} method="get">

<div class="maincontentheader">
<h1>{"Search"|i18n("design/standard/content/search")}</h1>
</div>

<div class="block">
    <input class="halfbox" type="text" size="20" name="SearchText" id="Search" value="{$search_text|wash}" />
    <input class="button" name="SearchButton" type="submit" value="{'Search'|i18n('design/standard/layout')}" />
</div>

<div class="block">
    {let adv_url=concat('/content/advancedsearch/',$search_text|gt(0)|choose('',concat('?SearchText=',$search_text|urlencode)))|ezurl}
    <label>{"For more options try the %1Advanced search%2"|i18n("design/standard/content/search","The parameters are link start and end tags.",array(concat("<a href=",$adv_url,">"),"</a>"))}</label>
    {/let}
</div>

{section show=$stop_word_array}
<p>
{"The following words were excluded from the search:"|i18n("design/standard/content/search")} 
{section name=StopWord loop=$stop_word_array}
{$StopWord:item.word|wash}
{delimiter}, {/delimiter}

{/section}
</p>

{/section}

{switch name=Sw match=$search_count}
  {case match=0}
  <div class="warning">
  <h2>{'No results were found when searching for "%1"'|i18n("design/standard/content/search",,array($search_text|wash))}</h2>
  </div>
    <p>Search tips</p>
    <ul>
        <li>Check spelling of keywords.</li>
        <li>Try changing some keywords eg. car instead of cars.</li>
        <li>Try more general keywords.</li>
        <li>Fewer keywords gives more results, try reducing keywords until you get a result.</li>
    </ul>
  {/case}
  {case}
  <div class="feedback">
  <h2>{'Search for "%1" returned %2 matches'|i18n("design/standard/content/search",,array($search_text|wash,$search_count))}</h2>
  </div>
  {/case}
{/switch}

{include name=Result
         uri='design:content/searchresult.tpl'
         search_result=$search_result}

{include name=Navigator
         uri='design:navigator/google.tpl'
         page_uri=concat('/content/search')
         page_uri_suffix=concat('?SearchText=',$search_text|urlencode)
         item_count=$search_count
         view_parameters=$view_parameters
         item_limit=$page_limit}

</form>
{/let}
