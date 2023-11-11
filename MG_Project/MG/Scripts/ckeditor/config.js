/**
 * @license Copyright (c) 2003-2020, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	 //config.language = 'fa';
	// config.uiColor = '#AADC6E';
    config.contentsLangDirection = 'rtl';
    config.language = 'fa';

    config.contentsCss = '/AdminPanel/dist/css/custom-style.css';
    config.font_names = 'Vazir';

    config.syntaxhighlight_lang = 'csharp';
    config.syntaxhighlight_hideControls = true;
    config.filebrowserBrowseUrl = '/Scripts/ckfinder/ckfinder.html';
    config.filebrowserImageBrowseUrl = '/Scripts/ckfinder/ckfinder.html?Types=Images';
    config.filebrowserFlashBrowseUrl = '/Scripts/ckfinder/ckfinder.html?Types=Flash';
    config.filebrowserUploadUrl = '/Scripts/ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=File';
    config.filebrowserImageUploadUrl = '/Scripts/Data';
    config.filebrowserFlashUploadUrl = '/Scripts/ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Flash';

    CKFinder.setupCKEditor(null, '/Scripts/ckfinder/');
};
