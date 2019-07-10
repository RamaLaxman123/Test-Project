{
	"id": "skuid",
	"namespace": "skuid",
	"customLabelNamespace": "skuid",
	"components": [
		{
			"id": "autocomplete"
		},
		{
			"id": "slider"
		},
		{
			"id": "tabContainer",
			"pathsToChildComponents": [
				"tabs"
			]
		},
		{
			"id": "tabSet",
			"pathsToChildComponents": [
				"tabs"
			]
		},
		{
			"id": "tabPanel",
			"pathsToActions": [
				"actions"
			],
			"pathsToChildComponents": [
				"components"
			]
		},
		{
			"id": "buttonSet",
			"pathsToChildComponents": [
				"groups"
			]
		},
		{
			"id": "buttonGroup",
			"pathsToChildComponents": [
				"buttons"
			]
		},
		{
			"id": "button",
			"pathsToActions": [
				"actions"
			]
		},
		{
			"id": "accordion"
		},
		{
			"id": "avatar",
			"pathsToDataSourceAttributes": [
				":datasource"
			]
		},
		{
			"id": "chatbotFullOverlay"
		},
		{
			"id": "badge"
		},
		{
			"id": "deck",
			"pathsToChildComponents": ["components"]
		},
		{
			"id": "dialog",
			"pathsToActions": [
				"actions"
			],
			"pathsToChildComponents": [
				"components"
			]
		},
		{
			"id": "dynamicComponentsContainer"
		},
		{
			"id": "icon"
		},
		{
			"id": "image",
			"pathsToDataSourceAttributes": [
				":datasource"
			]
		},
		{
			"id": "feedbackBlock"
		},
		{
			"id": "field"
		},
		{
			"id": "file",
			"customLabelDependencies": [
				"error_exceeds_max_file_size",
				"error_invalid_file_upload_data_source",
				"error_could_not_find_upload_method"
			],
			"pathsToDataSourceAttributes": [
				":datasource"
			]
		},
		{
			"id": "grid",
			"pathsToChildComponents": [
				"divisions>division>components"
			]
		},
		{
			"id": "heading"
		},
		{
			"id": "header"
		},
		{
			"id": "layoutRegion",
			"pathsToChildComponents": [
				"components"
			]
		},
		{
			"id": "masthead",
			"pathsToChildComponents": [
				"divisions>division>components"
			]
		},
		{
			"id": "header"
		},
		{
			"id": "inputText"
		},
		{
			"id": "inputTextArea"
		},
		{
			"id": "select"
		},
		{
			"id": "checkboxList"
		},
		{
			"id": "checkbox"
		},
		{
			"id": "radioList"
		},
		{
			"id": "list"
		},
		{
			"id": "modal",
			"pathsToActions": [
				"actions"
			],
			"pathsToChildComponents": [
				"components"
			]
		},
		{
			"id": "navigation"
		},
		{
			"id": "verticalNavigation"
		},
		{
			"id": "search",
			"pathsToActions": [
				"selectActions",
				"resultActions>action>actions",
				"objects>object>resultActions>action>actions"
			],
			"pathsToDataSourceAttributes": [
				"objects>object:datasource"
			]
		},
		{
			"id": "slidingPanel",
			"pathsToChildComponents": [
				"components"
			]
		},
		{
			"id": "table",
			"pathsToActions": [
				"actions",
				"massActions",
				"rowActions"
			],
			"customLabelDependencies": [
				"export_data"
			]
		},
		{
			"id": "text"
		},
		{
			"id": "toast"
		},
		{
			"id": "tooltip"
		},
		{
			"id": "pagination"
		},
		{
			"id": "form",
			"pathsToChildComponents": ["sections>section>rows>row>fields"]
		},
		{
			"id": "filter"
		},
		{
			"id": "filterSet",
			"pathsToChildComponents": [
				"filters"
			],
			"customLabelDependencies": [
				"search"
			]
		},
		{
			"id": "chart",
			"js": [
				{ "resource": "js/lib/highcharts.js" },
				{ "resource": "js/skuidvisRuntime.js" },
				{ "resource": "js/skuidvisCharts.js" }
			]
		},
		{
			"id": "chartSet",
			"pathsToChildComponents": [
				"charts"
			],
			"js": [
				{ "resource": "js/lib/highcharts.js" },
				{ "resource": "js/skuidvisRuntime.js" },
				{ "resource": "js/skuidvisCharts.js" }
			]
		},
		{
			"id": "geochart",
			"js": [
				{ "resource": "js/lib/highcharts.js" },
				{ "resource": "js/lib/highmaps.js" },
				{ "resource": "js/skuidvisRuntime.js" },
				{ "resource": "js/skuidvisCharts.js" },
				{ "resource": "js/skuidvisGeoChart.js" }
			]
		},
		{
			"id": "wizard",
			"pathsToChildComponents": [
				"steps>step>components"
			],
			"pathsToActions": [
				"steps>step>buttons>button>actions"
			]
		},
		{
			"id": "designSystemManager"
		},
		{
			"id": "chatter",
			"pathsToActions": [
				"actions"
			]
		},
		{
			"id": "wrapper",
			"pathsToChildComponents": [
				"components"
			]
		},
		{
			"id": "page",
			"pathsToChildComponents": [
				"components",
				"pageregioncontents>pageregioncontent>components"
			],
			"pathsToActions": [
				"resources>actionsequences>actionsequence>actions",
				"interactions>interaction"
			],
			"pathsToDataSourceAttributes": [
				"styles>styleitem:datasource"
			],
			"customLabelDependencies": [
				"action",
				"actions",
				"after_this",
				"all_records_exported_to_csv",
				"all_time",
				"all_values",
				"am_pm_markers",
				"applying_filter",
				"apply",
				"before_this",
				"cancel",
				"cancelled",
				"check_all",
				"connected",
				"currently_offline",
				"day_names_long",
				"day_names_min",
				"day_names_short",
				"done",
				"edit_page",
				"end_date",
				"enter_keywords",
				"error",
				"error_performing_requested_search",
				"filter",
				"filter_could_not_be_applied",
				"first",
				"greater_than",
				"last",
				"less_than",
				"loading",
				"load_more",
				"month_names_long",
				"month_names_short",
				"next",
				"no_objects_to_display",
				"none_selected",
				"number_selected",
				"objects_per_page",
				"pagination_limit_reached",
				"previous",
				"reconnecting",
				"required_fields_have_no_value",
				"retrieving_data_for_export",
				"retrieving_records_a_to_b",
				"save",
				"save_anyway",
				"viewing_a_b_of_c",
				"saved",
				"saving",
				"saving_offline_changes",
				"select",
				"select_option_none",
				"search",
				"searching",
				"showing_rows",
				"skuid_page_problems",
				"skuid_page_problems_no_click",
				"start",
				"start_date",
				"uncheck_all",
				"unsaved_changes_warning",
				"upload",
				"uploading",
				"upload_successful",
				"view"
			]
		},
				{
			"id": "pageBuilder",
			"customLabelDependencies": [
				"add_drilldown",
				"building_page",
				"clone",
				"components",
				"day_scheduling_view",
				"edit_rows_action",
				"file_resource",
				"flag_for_delete_action",
				"invalid_data_source",
				"invalid_data_source_type",
				"mass_update_selected_rows",
				"models",
				"module",
				"month_view",
				"no_module",
				"none_option_text",
				"page_regions",
				"preview",
				"properties",
				"pb_no_properties_renderer",
				"pb_no_component_renderer",
				"remove",
				"resources",
				"toggle_edit_mode_on_selected_rows",
				"toggle_selected_rows_for_deletion",
				"week_view"
			]
		},
		{
			"id": "pageInclude",
			"pathsToChildComponents": [
				"components"
			]
		},
		{
			"id": "pageRegion"
		}
	],
	"js": [
		{ "resource": "js/lib/moment.js" },
		{ "resource": "js/skuidRuntime.js" }
	]
}
