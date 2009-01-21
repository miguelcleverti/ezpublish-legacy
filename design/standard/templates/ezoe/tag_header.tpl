{set scope=global persistent_variable=hash('title', 'New %tag_name tag'|i18n('design/standard/ezoe', '', hash( '%tag_name', concat('&lt;', $tag_name_alias, '&gt;') )),
                                           'scripts', array('javascript/ezoe/ez_core.js',
                                                            'javascript/ezoe/ez_core_animation.js',
                                                            'javascript/ezoe/ez_core_accordion.js',
                                                            'javascript/ezoe/popup_utils.js'),
                                           'css', array()
                                           )}

<script type="text/javascript">
<!--

tinyMCEPopup.onInit.add( ez.fn.bind( eZOEPopupUtils.init, window, {ldelim}
    tagName: '{$tag_name|wash}',
    form: 'EditForm',
    customAttributeStyleMap: {$custom_attribute_style_map},
    cancelButton: 'CancelButton',
    tagEditTitleText : "{'Edit %tag_name tag'|i18n('design/standard/ezoe', '', hash( '%tag_name', concat('&lt;', $tag_name_alias, '&gt;') ))}"
{rdelim} ) );

// -->
</script>

<div class="tag-view tag-type-{$tag_name}">

    <form action="JavaScript:void(0)" method="post" name="EditForm" id="EditForm" enctype="multipart/form-data">

        <div id="tabs" class="tabs">
        <ul>
            <li class="tab current"><span><a href="JavaScript:void(0);">{'Properties'|i18n('design/standard/ezoe')}</a></span></li>
        </ul>
        </div>

<div class="panel_wrapper">
    <div class="panel current">
        <div class="attribute-title">
            <h2 style="padding: 0 0 4px 0;" id="tag-edit-title">{'New %tag_name tag'|i18n('design/standard/ezoe', '', hash( '%tag_name', concat('&lt;', $tag_name_alias, '&gt;') ))}</h2>
        </div>
        
        {include uri="design:ezoe/generalattributes.tpl" tag_name=$tag_name attributes=hash('class', $class_list )}

        {include uri="design:ezoe/customattributes.tpl" tag_name=$tag_name}

        <div class="block"> 
            <div class="left">
                <input id="SaveButton" name="SaveButton" type="submit" value="{'OK'|i18n('design/standard/ezoe')}" />
                <input id="CancelButton" name="CancelButton" type="reset" value="{'Cancel'|i18n('design/standard/ezoe')}" />
            </div> 
        </div>

    </div>
</div>
    </form>

</div>