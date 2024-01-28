-- HUD
-- by Justa

local surface = surface
local draw = draw
local Color = Color

include( "vgui/dproperties.lua" )

SKIN = {}

SKIN.PrintName 		= "Ciero Dark Spawnmenu Skin"
SKIN.Author 		= "AquaRex"
SKIN.DermaVersion	= 2
SKIN.GwenTexture	= Material( "gwenskin/cieroskin.png" )

SKIN.bg_color 					= Color( 101, 100, 105, 255 )
SKIN.bg_color_sleep 			= Color( 70, 70, 70, 255 )
SKIN.bg_color_dark				= Color( 55, 57, 61, 255 )
SKIN.bg_color_bright			= Color( 220, 220, 220, 255 )
SKIN.frame_border				= Color( 50, 50, 50, 255 )


SKIN.fontFrame					= "DermaDefault"

SKIN.control_color 				= Color( 120, 120, 120, 255 )
SKIN.control_color_highlight	= Color( 150, 150, 150, 255 )
SKIN.control_color_active 		= Color( 110, 150, 250, 255 )
SKIN.control_color_bright 		= Color( 255, 200, 100, 255 )
SKIN.control_color_dark 		= Color( 100, 100, 100, 255 )

SKIN.bg_alt1 					= Color( 50, 50, 50, 255 )
SKIN.bg_alt2 					= Color( 55, 55, 55, 255 )


SKIN.listview_hover				= Color( 70, 70, 70, 255 )
SKIN.listview_selected			= Color( 100, 170, 220, 255 )

SKIN.text_bright				= Color( 255, 255, 255, 255 )
SKIN.text_normal				= Color( 180, 180, 180, 255 )
SKIN.text_dark					= Color( 20, 20, 20, 255 )
SKIN.text_highlight				= Color( 255, 20, 20, 255 )

SKIN.texGradientUp				= Material( "gui/gradient_up" )
SKIN.texGradientDown			= Material( "gui/gradient_down" )

SKIN.combobox_selected			= SKIN.listview_selected

SKIN.panel_transback			= Color( 255, 255, 255, 50 )
SKIN.tooltip					= Color( 255, 245, 175, 255 )

SKIN.colPropertySheet 			= Color( 170, 170, 170, 255 )
SKIN.colTab			 			= SKIN.colPropertySheet
SKIN.colTabInactive				= Color( 140, 140, 140, 255 )
SKIN.colTabShadow				= Color( 0, 0, 0, 170 )
SKIN.colTabText		 			= Color( 255, 255, 255, 255 )
SKIN.colTabTextInactive			= Color( 0, 0, 0, 200 )
SKIN.fontTab					= "DermaDefault"

SKIN.colCollapsibleCategory		= Color( 255, 255, 255, 20 )

SKIN.colCategoryText			= Color( 255, 255, 255, 255 )
SKIN.colCategoryTextInactive	= Color( 200, 200, 200, 255 )
SKIN.fontCategoryHeader			= "TabLarge"

SKIN.colNumberWangBG			= Color( 255, 240, 150, 255 )
SKIN.colTextEntryBG				= Color( 240, 240, 240, 255 )
SKIN.colTextEntryBorder			= Color( 20, 20, 20, 255 )
SKIN.colTextEntryText			= Color( 255, 255, 255, 255 )
SKIN.colTextEntryTextHighlight		= Color( 45, 45, 45, 255 )
SKIN.colTextEntryTextCursor		= Color( 0, 0, 0, 255 )

SKIN.colMenuBG					= Color( 255, 255, 255, 200 )
SKIN.colMenuBorder				= Color( 0, 0, 0, 200 )

SKIN.colButtonText				= Color( 255, 255, 255, 255 )
SKIN.colButtonTextDisabled		= Color( 255, 255, 255, 55 )
SKIN.colButtonBorder			= Color( 20, 20, 20, 255 )
SKIN.colButtonBorderHighlight	= Color( 255, 255, 255, 50 )
SKIN.colButtonBorderShadow		= Color( 0, 0, 0, 100 )

-- ComboBox / List Colors are defined in png


SKIN.tex = {}

SKIN.tex.Selection		 			= GWEN.CreateTextureBorder( 384, 32, 31, 31, 4, 4, 4, 4 );

SKIN.tex.Panels = {}
SKIN.tex.Panels.Normal				= GWEN.CreateTextureBorder( 256,		0,	63,	63,	16,	16,		16,	16 )
SKIN.tex.Panels.Bright				= GWEN.CreateTextureBorder( 256+64,	0,	63,	63,	16,	16,		16,	16 )
SKIN.tex.Panels.Dark				= GWEN.CreateTextureBorder( 256,		64,	63,	63,	16,	16,		16,	16 )
SKIN.tex.Panels.Highlight			= GWEN.CreateTextureBorder( 256+64,	64,	63,	63,	16,	16,		16,	16 )

SKIN.tex.Button						= GWEN.CreateTextureBorder( 480, 0,	31,		31,		8,	8,		8,	8 )
SKIN.tex.Button_Hovered				= GWEN.CreateTextureBorder( 480, 32,	31,		31,		8,	8,		8,	8 )
SKIN.tex.Button_Dead				= GWEN.CreateTextureBorder( 480, 64,	31,		31,		8,	8,		8,	8 )
SKIN.tex.Button_Down				= GWEN.CreateTextureBorder( 480, 96,	31,		31,		8,	8,		8,	8 )
SKIN.tex.Shadow						= GWEN.CreateTextureBorder( 448, 0,	31,		31,		8,	8,		8,	8 )

SKIN.tex.Tree						= GWEN.CreateTextureBorder( 256, 128, 127,	127,	16,	16,		16,	16 )
SKIN.tex.Checkbox_Checked			= GWEN.CreateTextureNormal( 448, 32, 15, 15 )
SKIN.tex.Checkbox					= GWEN.CreateTextureNormal( 464, 32, 15, 15 )
SKIN.tex.CheckboxD_Checked			= GWEN.CreateTextureNormal( 448, 48, 15, 15 )
SKIN.tex.CheckboxD					= GWEN.CreateTextureNormal( 464, 48, 15, 15 )
--SKIN.tex.RadioButton_Checked		= GWEN.CreateTextureNormal( 448, 64, 15, 15 )
--SKIN.tex.RadioButton				= GWEN.CreateTextureNormal( 464, 64, 15, 15 )
--SKIN.tex.RadioButtonD_Checked		= GWEN.CreateTextureNormal( 448, 80, 15, 15 )
--SKIN.tex.RadioButtonD				= GWEN.CreateTextureNormal( 464, 80, 15, 15 )
SKIN.tex.TreePlus					= GWEN.CreateTextureNormal( 448, 96, 15, 15 )
SKIN.tex.TreeMinus					= GWEN.CreateTextureNormal( 464, 96, 15, 15 )
--SKIN.tex.Menu_Strip				= GWEN.CreateTextureBorder( 0, 128, 127, 21, 1, 1, 1, 1 )
SKIN.tex.TextBox					= GWEN.CreateTextureBorder( 0, 150, 127, 21,		4,	4,		4,	4 )
SKIN.tex.TextBox_Focus				= GWEN.CreateTextureBorder( 0, 172, 127, 21,		4,	4,		4,	4 )
SKIN.tex.TextBox_Disabled			= GWEN.CreateTextureBorder( 0, 194, 127, 21,		4,	4,		4,	4 )
SKIN.tex.MenuBG_Column				= GWEN.CreateTextureBorder( 128, 128, 127, 63,		24, 8, 8, 8 )
SKIN.tex.MenuBG						= GWEN.CreateTextureBorder( 128, 192, 127, 63,		8, 8, 8, 8 )
SKIN.tex.MenuBG_Hover				= GWEN.CreateTextureBorder( 128, 256, 127, 31,		8, 8, 8, 8 )
SKIN.tex.MenuBG_Spacer				= GWEN.CreateTextureNormal( 128, 288, 127, 3 )
SKIN.tex.Menu_Strip					= GWEN.CreateTextureBorder( 0, 128, 127, 21,		8, 8, 8, 8)
SKIN.tex.Menu_Check					= GWEN.CreateTextureNormal( 448, 112, 15, 15 )
SKIN.tex.Tab_Control				= GWEN.CreateTextureBorder( 0, 256, 127, 127, 8, 8, 8, 8 )
SKIN.tex.TabB_Active				= GWEN.CreateTextureBorder( 0,		416, 63, 31, 8, 8, 8, 8 )
SKIN.tex.TabB_Inactive				= GWEN.CreateTextureBorder( 0+128,	416, 63, 31, 8, 8, 8, 8 )
SKIN.tex.TabT_Active				= GWEN.CreateTextureBorder( 0,		384, 63, 31, 8, 8, 8, 8 )
SKIN.tex.TabT_Inactive				= GWEN.CreateTextureBorder( 0+128,	384, 63, 31, 8, 8, 8, 8 )
SKIN.tex.TabL_Active				= GWEN.CreateTextureBorder( 64,		384, 31, 63, 8, 8, 8, 8 )
SKIN.tex.TabL_Inactive				= GWEN.CreateTextureBorder( 64+128,	384, 31, 63, 8, 8, 8, 8 )
SKIN.tex.TabR_Active				= GWEN.CreateTextureBorder( 96,		384, 31, 63, 8, 8, 8, 8 )
SKIN.tex.TabR_Inactive				= GWEN.CreateTextureBorder( 96+128,	384, 31, 63, 8, 8, 8, 8 )
SKIN.tex.Tab_Bar					= GWEN.CreateTextureBorder( 128, 352, 127, 31, 4, 4, 4, 4 )
		
SKIN.tex.Window = {}

SKIN.tex.Window.Normal				= GWEN.CreateTextureBorder( 0,	0,	127,	127,	8,	32,		8,	8 )
SKIN.tex.Window.Inactive			= GWEN.CreateTextureBorder( 128,	0,	127,	127,	8,	32,		8,	8 )

SKIN.tex.Window.Close				= GWEN.CreateTextureNormal( 32, 448, 31, 31 );
SKIN.tex.Window.Close_Hover			= GWEN.CreateTextureNormal( 64, 448, 31, 31 );
SKIN.tex.Window.Close_Down			= GWEN.CreateTextureNormal( 96, 448, 31, 31 );

SKIN.tex.Window.Maxi				= GWEN.CreateTextureNormal( 32 + 96*2, 448, 31, 31 );
SKIN.tex.Window.Maxi_Hover			= GWEN.CreateTextureNormal( 64 + 96*2, 448, 31, 31 );
SKIN.tex.Window.Maxi_Down			= GWEN.CreateTextureNormal( 96 + 96*2, 448, 31, 31 );

SKIN.tex.Window.Restore				= GWEN.CreateTextureNormal( 32 + 96*2, 448+32, 31, 31 );
SKIN.tex.Window.Restore_Hover		= GWEN.CreateTextureNormal( 64 + 96*2, 448+32, 31, 31 );
SKIN.tex.Window.Restore_Down		= GWEN.CreateTextureNormal( 96 + 96*2, 448+32, 31, 31 );

SKIN.tex.Window.Mini				= GWEN.CreateTextureNormal( 32 + 96, 448, 31, 31 );
SKIN.tex.Window.Mini_Hover			= GWEN.CreateTextureNormal( 64 + 96, 448, 31, 31 );
SKIN.tex.Window.Mini_Down			= GWEN.CreateTextureNormal( 96 + 96, 448, 31, 31 );

SKIN.tex.Scroller = {}
SKIN.tex.Scroller.TrackV				= GWEN.CreateTextureBorder( 384,				208, 15, 127, 4, 4, 4, 4 );
SKIN.tex.Scroller.ButtonV_Normal		= GWEN.CreateTextureBorder( 384 + 16,		208, 15, 127, 4, 4, 4, 4 );
SKIN.tex.Scroller.ButtonV_Hover			= GWEN.CreateTextureBorder( 384 + 32,		208, 15, 127, 4, 4, 4, 4 );
SKIN.tex.Scroller.ButtonV_Down			= GWEN.CreateTextureBorder( 384 + 48,		208, 15, 127, 4, 4, 4, 4 );
SKIN.tex.Scroller.ButtonV_Disabled		= GWEN.CreateTextureBorder( 384 + 64,		208, 15, 127, 4, 4, 4, 4 );

SKIN.tex.Scroller.TrackH				= GWEN.CreateTextureBorder( 384,	128,		127, 15, 4, 4, 4, 4 );
SKIN.tex.Scroller.ButtonH_Normal		= GWEN.CreateTextureBorder( 384,	128 + 16,	127, 15, 4, 4, 4, 4 );
SKIN.tex.Scroller.ButtonH_Hover			= GWEN.CreateTextureBorder( 384,	128 + 32,	127, 15, 4, 4, 4, 4 );
SKIN.tex.Scroller.ButtonH_Down			= GWEN.CreateTextureBorder( 384,	128 + 48,	127, 15, 4, 4, 4, 4 );
SKIN.tex.Scroller.ButtonH_Disabled		= GWEN.CreateTextureBorder( 384,	128 + 64,	127, 15, 4, 4, 4, 4 );

SKIN.tex.Scroller.LeftButton_Normal		= GWEN.CreateTextureBorder( 464,			208,	15, 15, 2, 2, 2, 2 );
SKIN.tex.Scroller.LeftButton_Hover		= GWEN.CreateTextureBorder( 480,			208,	15, 15, 2, 2, 2, 2 );
SKIN.tex.Scroller.LeftButton_Down		= GWEN.CreateTextureBorder( 464,			272,	15, 15, 2, 2, 2, 2 );
SKIN.tex.Scroller.LeftButton_Disabled	= GWEN.CreateTextureBorder( 480 + 48,	272,	15, 15, 2, 2, 2, 2 );

SKIN.tex.Scroller.UpButton_Normal		= GWEN.CreateTextureBorder( 464,			208 + 16,	15, 15, 2, 2, 2, 2 );
SKIN.tex.Scroller.UpButton_Hover		= GWEN.CreateTextureBorder( 480,			208 + 16,	15, 15, 2, 2, 2, 2 );
SKIN.tex.Scroller.UpButton_Down			= GWEN.CreateTextureBorder( 464,			272 + 16,	15, 15, 2, 2, 2, 2 );
SKIN.tex.Scroller.UpButton_Disabled		= GWEN.CreateTextureBorder( 480 + 48,	272 + 16,	15, 15, 2, 2, 2, 2 );

SKIN.tex.Scroller.RightButton_Normal	= GWEN.CreateTextureBorder( 464,			208 + 32,	15, 15, 2, 2, 2, 2 );
SKIN.tex.Scroller.RightButton_Hover		= GWEN.CreateTextureBorder( 480,			208 + 32,	15, 15, 2, 2, 2, 2 );
SKIN.tex.Scroller.RightButton_Down		= GWEN.CreateTextureBorder( 464,			272 + 32,	15, 15, 2, 2, 2, 2 );
SKIN.tex.Scroller.RightButton_Disabled	= GWEN.CreateTextureBorder( 480 + 48,	272 + 32,	15, 15, 2, 2, 2, 2 );

SKIN.tex.Scroller.DownButton_Normal		= GWEN.CreateTextureBorder( 464,			208 + 48,	15, 15, 2, 2, 2, 2 );
SKIN.tex.Scroller.DownButton_Hover		= GWEN.CreateTextureBorder( 480,			208 + 48,	15, 15, 2, 2, 2, 2 );
SKIN.tex.Scroller.DownButton_Down		= GWEN.CreateTextureBorder( 464,			272 + 48,	15, 15, 2, 2, 2, 2 );
SKIN.tex.Scroller.DownButton_Disabled	= GWEN.CreateTextureBorder( 480 + 48,	272 + 48,	15, 15, 2, 2, 2, 2 );

SKIN.tex.Menu = {}
SKIN.tex.Menu.RightArrow				= GWEN.CreateTextureNormal( 464, 112, 15, 15 );

SKIN.tex.Input = {}

SKIN.tex.Input.ComboBox = {}
SKIN.tex.Input.ComboBox.Normal			= GWEN.CreateTextureBorder( 384,	336,	127, 31, 8, 8, 32, 8 );
SKIN.tex.Input.ComboBox.Hover			= GWEN.CreateTextureBorder( 384,	336+32, 127, 31, 8, 8, 32, 8 );
SKIN.tex.Input.ComboBox.Down			= GWEN.CreateTextureBorder( 384,	336+64, 127, 31, 8, 8, 32, 8 );
SKIN.tex.Input.ComboBox.Disabled		= GWEN.CreateTextureBorder( 384,	336+96, 127, 31, 8, 8, 32, 8 );

SKIN.tex.Input.ComboBox.Button = {}
SKIN.tex.Input.ComboBox.Button.Normal		 = GWEN.CreateTextureNormal( 496,	272,	15, 15 );
SKIN.tex.Input.ComboBox.Button.Hover		 = GWEN.CreateTextureNormal( 496,	272+16, 15, 15 );
SKIN.tex.Input.ComboBox.Button.Down			 = GWEN.CreateTextureNormal( 496,	272+32, 15, 15 );
SKIN.tex.Input.ComboBox.Button.Disabled		 = GWEN.CreateTextureNormal( 496,	272+48, 15, 15 );

SKIN.tex.Input.UpDown = {}
SKIN.tex.Input.UpDown.Up = {}
SKIN.tex.Input.UpDown.Up.Normal				= GWEN.CreateTextureCentered( 384,		112,	7, 7 );
SKIN.tex.Input.UpDown.Up.Hover				= GWEN.CreateTextureCentered( 384+8,	112,	7, 7 );
SKIN.tex.Input.UpDown.Up.Down				= GWEN.CreateTextureCentered( 384+16,	112,	7, 7 );
SKIN.tex.Input.UpDown.Up.Disabled			= GWEN.CreateTextureCentered( 384+24,	112,	7, 7 );

SKIN.tex.Input.UpDown.Down = {}
SKIN.tex.Input.UpDown.Down.Normal			= GWEN.CreateTextureCentered( 384,		120,	7, 7 );
SKIN.tex.Input.UpDown.Down.Hover			= GWEN.CreateTextureCentered( 384+8,	120,	7, 7 );
SKIN.tex.Input.UpDown.Down.Down				= GWEN.CreateTextureCentered( 384+16,	120,	7, 7 );
SKIN.tex.Input.UpDown.Down.Disabled			= GWEN.CreateTextureCentered( 384+24,	120,	7, 7 );

SKIN.tex.Input.Slider = {}
SKIN.tex.Input.Slider.H = {}
SKIN.tex.Input.Slider.H.Normal			= GWEN.CreateTextureNormal( 416,	32,	15, 15 );
SKIN.tex.Input.Slider.H.Hover			= GWEN.CreateTextureNormal( 416,	32+16, 15, 15 );
SKIN.tex.Input.Slider.H.Down			= GWEN.CreateTextureNormal( 416,	32+32, 15, 15 );
SKIN.tex.Input.Slider.H.Disabled		= GWEN.CreateTextureNormal( 416,	32+48, 15, 15 );

SKIN.tex.Input.Slider.V = {}
SKIN.tex.Input.Slider.V.Normal			= GWEN.CreateTextureNormal( 416+16,	32,	15, 15 );
SKIN.tex.Input.Slider.V.Hover			= GWEN.CreateTextureNormal( 416+16,	32+16, 15, 15 );
SKIN.tex.Input.Slider.V.Down			= GWEN.CreateTextureNormal( 416+16,	32+32, 15, 15 );
SKIN.tex.Input.Slider.V.Disabled		= GWEN.CreateTextureNormal( 416+16,	32+48, 15, 15 );

SKIN.tex.Input.ListBox = {}
SKIN.tex.Input.ListBox.Background		= GWEN.CreateTextureBorder( 256,	256, 63, 127, 8, 8, 8, 8 );
SKIN.tex.Input.ListBox.Hovered			= GWEN.CreateTextureBorder( 320,	320, 31, 31, 8, 8, 8, 8 );
SKIN.tex.Input.ListBox.EvenLine			= GWEN.CreateTextureBorder( 352,  256, 31, 31, 8, 8, 8, 8 );
SKIN.tex.Input.ListBox.OddLine			= GWEN.CreateTextureBorder( 352,  288, 31, 31, 8, 8, 8, 8 );
SKIN.tex.Input.ListBox.EvenLineSelected			= GWEN.CreateTextureBorder( 320,	270, 31, 31, 8, 8, 8, 8 );
SKIN.tex.Input.ListBox.OddLineSelected			= GWEN.CreateTextureBorder( 320,	288, 31, 31, 8, 8, 8, 8 );

SKIN.tex.ProgressBar = {}
SKIN.tex.ProgressBar.Back		= GWEN.CreateTextureBorder( 384,	0, 31, 31, 8, 8, 8, 8 );
SKIN.tex.ProgressBar.Front		= GWEN.CreateTextureBorder( 384+32,	0, 31, 31, 8, 8, 8, 8 );


SKIN.tex.CategoryList = {}
SKIN.tex.CategoryList.Outer		= GWEN.CreateTextureBorder( 256,		384, 63, 63, 8, 8, 8, 8 );
SKIN.tex.CategoryList.Inner		= GWEN.CreateTextureBorder( 256 + 64,	384, 63, 63, 8, 21, 8, 8 );
SKIN.tex.CategoryList.Header	= GWEN.CreateTextureBorder( 320,			352, 63, 31, 8, 8, 8, 8 );

SKIN.tex.Tooltip		= GWEN.CreateTextureBorder( 384,	64, 31, 31, 8, 8, 8, 8 );
		
SKIN.Colours = {}

SKIN.Colours.Window = {}
SKIN.Colours.Window.TitleActive			= GWEN.TextureColor( 4 + 8 * 0, 508 );
SKIN.Colours.Window.TitleInactive		= GWEN.TextureColor( 4 + 8 * 1, 508 );

SKIN.Colours.Button = {}
SKIN.Colours.Button.Normal				= GWEN.TextureColor( 4 + 8 * 2, 508 );
SKIN.Colours.Button.Hover				= GWEN.TextureColor( 4 + 8 * 3, 508 );
SKIN.Colours.Button.Down				= GWEN.TextureColor( 4 + 8 * 2, 500 );
SKIN.Colours.Button.Disabled			= GWEN.TextureColor( 4 + 8 * 3, 500 );

SKIN.Colours.Tab = {}
SKIN.Colours.Tab.Active = {}
SKIN.Colours.Tab.Active.Normal			= GWEN.TextureColor( 4 + 8 * 4, 508 );
SKIN.Colours.Tab.Active.Hover			= GWEN.TextureColor( 4 + 8 * 5, 508 );
SKIN.Colours.Tab.Active.Down			= GWEN.TextureColor( 4 + 8 * 4, 500 );
SKIN.Colours.Tab.Active.Disabled		= GWEN.TextureColor( 4 + 8 * 5, 500 );

SKIN.Colours.Tab.Inactive = {}
SKIN.Colours.Tab.Inactive.Normal		= GWEN.TextureColor( 4 + 8 * 6, 508 );
SKIN.Colours.Tab.Inactive.Hover			= GWEN.TextureColor( 4 + 8 * 7, 508 );
SKIN.Colours.Tab.Inactive.Down			= GWEN.TextureColor( 4 + 8 * 6, 500 );
SKIN.Colours.Tab.Inactive.Disabled		= GWEN.TextureColor( 4 + 8 * 7, 500 );

SKIN.Colours.Label = {}
SKIN.Colours.Label.Default				= GWEN.TextureColor( 4 + 8 * 8, 508 );
SKIN.Colours.Label.Bright				= GWEN.TextureColor( 4 + 8 * 9, 508 );
SKIN.Colours.Label.Dark					= GWEN.TextureColor( 4 + 8 * 8, 500 );
SKIN.Colours.Label.Highlight			= GWEN.TextureColor( 4 + 8 * 9, 500 );

SKIN.Colours.Tree = {}
SKIN.Colours.Tree.Lines					= GWEN.TextureColor( 4 + 8 * 10, 508 );		---- !!!
SKIN.Colours.Tree.Normal				= GWEN.TextureColor( 4 + 8 * 11, 508 );
SKIN.Colours.Tree.Hover					= GWEN.TextureColor( 4 + 8 * 10, 500 );
SKIN.Colours.Tree.Selected				= GWEN.TextureColor( 4 + 8 * 11, 500 );

SKIN.Colours.Properties = {}
SKIN.Colours.Properties.Line_Normal			= GWEN.TextureColor( 4 + 8 * 12, 508 );
SKIN.Colours.Properties.Line_Selected		= GWEN.TextureColor( 4 + 8 * 13, 508 );
SKIN.Colours.Properties.Line_Hover			= GWEN.TextureColor( 4 + 8 * 12, 500 );
SKIN.Colours.Properties.Title				= GWEN.TextureColor( 4 + 8 * 13, 500 );
SKIN.Colours.Properties.Column_Normal		= GWEN.TextureColor( 4 + 8 * 14, 508 );
SKIN.Colours.Properties.Column_Selected		= GWEN.TextureColor( 4 + 8 * 15, 508 );
SKIN.Colours.Properties.Column_Hover		= GWEN.TextureColor( 4 + 8 * 14, 500 );
SKIN.Colours.Properties.Border				= GWEN.TextureColor( 4 + 8 * 15, 500 );
SKIN.Colours.Properties.Label_Normal		= GWEN.TextureColor( 4 + 8 * 16, 508 );
SKIN.Colours.Properties.Label_Selected		= GWEN.TextureColor( 4 + 8 * 17, 508 );
SKIN.Colours.Properties.Label_Hover			= GWEN.TextureColor( 4 + 8 * 16, 500 );

SKIN.Colours.Category = {}
SKIN.Colours.Category.Header				= GWEN.TextureColor( 4 + 8 * 18, 500 );
SKIN.Colours.Category.Header_Closed			= GWEN.TextureColor( 4 + 8 * 19, 500 );
SKIN.Colours.Category.Line = {}
SKIN.Colours.Category.Line.Text				= GWEN.TextureColor( 4 + 8 * 20, 508 );
SKIN.Colours.Category.Line.Text_Hover		= GWEN.TextureColor( 4 + 8 * 21, 508 );
SKIN.Colours.Category.Line.Text_Selected	= GWEN.TextureColor( 4 + 8 * 20, 500 );
SKIN.Colours.Category.Line.Button			= GWEN.TextureColor( 4 + 8 * 21, 500 );
SKIN.Colours.Category.Line.Button_Hover		= GWEN.TextureColor( 4 + 8 * 22, 508 );
SKIN.Colours.Category.Line.Button_Selected	= GWEN.TextureColor( 4 + 8 * 23, 508 );
SKIN.Colours.Category.LineAlt = {}
SKIN.Colours.Category.LineAlt.Text				= GWEN.TextureColor( 4 + 8 * 22, 500 );
SKIN.Colours.Category.LineAlt.Text_Hover		= GWEN.TextureColor( 4 + 8 * 23, 500 );
SKIN.Colours.Category.LineAlt.Text_Selected		= GWEN.TextureColor( 4 + 8 * 24, 508 );
SKIN.Colours.Category.LineAlt.Button			= GWEN.TextureColor( 4 + 8 * 25, 508 );
SKIN.Colours.Category.LineAlt.Button_Hover		= GWEN.TextureColor( 4 + 8 * 24, 500 );
SKIN.Colours.Category.LineAlt.Button_Selected	= GWEN.TextureColor( 4 + 8 * 25, 500 );

SKIN.Colours.TooltipText	= GWEN.TextureColor( 4 + 8 * 26, 500 );


--[[---------------------------------------------------------
	Panel
-----------------------------------------------------------]]
function SKIN:PaintPanel( panel, w, h )

	if ( !panel.m_bBackground ) then return end	
	self.tex.Panels.Normal( 0, 0, w, h, panel.m_bgColor );

end

--[[---------------------------------------------------------
	Panel
-----------------------------------------------------------]]
function SKIN:PaintShadow( panel, w, h )

	SKIN.tex.Shadow( 0, 0, w, h );

end

--[[---------------------------------------------------------
	Frame
-----------------------------------------------------------]]
function SKIN:PaintFrame( panel, w, h )

	
	if ( panel.m_bPaintShadow ) then
	
		DisableClipping( true )
		SKIN.tex.Shadow( -4, -4, w+10, h+10 );
		DisableClipping( false )
	
	end
	
	if ( panel:HasHierarchicalFocus() ) then
	
		self.tex.Window.Normal( 0, 0, w, h );
		
	else
	
		self.tex.Window.Inactive( 0, 0, w, h );
		
	end

end

--[[---------------------------------------------------------
	Button
-----------------------------------------------------------]]
function SKIN:PaintButton( panel, w, h )

	if ( !panel.m_bBackground ) then return end
	
	if ( panel.Depressed || panel:IsSelected() || panel:GetToggle() ) then
		return self.tex.Button_Down( 0, 0, w, h );	
	end	
	
	if ( panel:GetDisabled() ) then
		return self.tex.Button_Dead( 0, 0, w, h );	
	end	
	
	if ( panel.Hovered ) then
		return self.tex.Button_Hovered( 0, 0, w, h );	
	end
			
	self.tex.Button( 0, 0, w, h );

end


--[[---------------------------------------------------------
	Tree
-----------------------------------------------------------]]
function SKIN:PaintTree( panel, w, h )

	if ( !panel.m_bBackground ) then return end
	
	self.tex.Tree( 0, 0, w, h, panel.m_bgColor );

end


--[[---------------------------------------------------------
	CheckBox
-----------------------------------------------------------]]
function SKIN:PaintCheckBox( panel, w, h )

	if ( panel:GetChecked() ) then
	
		if ( panel:GetDisabled() ) then
			self.tex.CheckboxD_Checked( 0, 0, w, h )
		else
			self.tex.Checkbox_Checked( 0, 0, w, h )
		end
		
	else
	
		if ( panel:GetDisabled() ) then
			self.tex.CheckboxD( 0, 0, w, h )
		else
			self.tex.Checkbox( 0, 0, w, h )
		end
		
	end	

end

--[[---------------------------------------------------------
	ExpandButton
-----------------------------------------------------------]]
function SKIN:PaintExpandButton( panel, w, h )

	if ( !panel:GetExpanded() ) then 
		self.tex.TreePlus( 0, 0, w, h )
	else 
		self.tex.TreeMinus( 0, 0, w, h )	
	end	

end

--[[---------------------------------------------------------
	TextEntry
-----------------------------------------------------------]]
function SKIN:PaintTextEntry( panel, w, h )

	if ( panel.m_bBackground ) then
	
		if ( panel:GetDisabled() ) then
			self.tex.TextBox_Disabled( 0, 0, w, h )
		elseif ( panel:HasFocus() ) then
			self.tex.TextBox_Focus( 0, 0, w, h )
		else
			self.tex.TextBox( 0, 0, w, h )
		end
	
	end
	
	panel:DrawTextEntryText( panel.m_colText, panel.m_colHighlight, panel.m_colCursor )
	
end

function SKIN:SchemeTextEntry( panel ) ---------------------- TODO
	
	panel:SetTextColor( self.colTextEntryText )
	panel:SetHighlightColor( self.colTextEntryTextHighlight )
	panel:SetCursorColor( self.colTextEntryTextCursor )

end

--[[---------------------------------------------------------
	Menu
-----------------------------------------------------------]]
function SKIN:PaintMenu( panel, w, h )

	if ( panel:GetDrawColumn() ) then
		self.tex.MenuBG_Column( 0, 0, w, h )
	else
		self.tex.MenuBG( 0, 0, w, h )
	end
	
end

--[[---------------------------------------------------------
	Menu
-----------------------------------------------------------]]
function SKIN:PaintMenuSpacer( panel, w, h )

	self.tex.MenuBG( 0, 0, w, h )
	
end

--[[---------------------------------------------------------
	MenuOption
-----------------------------------------------------------]]
function SKIN:PaintMenuOption( panel, w, h )

	if ( panel.m_bBackground && (panel.Hovered || panel.Highlight) ) then
		self.tex.MenuBG_Hover( 0, 0, w, h )
	end
	
	if ( panel:GetChecked() ) then
		self.tex.Menu_Check( 5, h/2-7, 15, 15 )
	end
	
end

--[[---------------------------------------------------------
	MenuRightArrow
-----------------------------------------------------------]]
function SKIN:PaintMenuRightArrow( panel, w, h )
	
	self.tex.Menu.RightArrow( 0, 0, w, h );

end

--[[---------------------------------------------------------
	PropertySheet
-----------------------------------------------------------]]
function SKIN:PaintPropertySheet( panel, w, h )

	-- TODO: Tabs at bottom, left, right

	local ActiveTab = panel:GetActiveTab()
	local Offset = 0
	if ( ActiveTab ) then Offset = ActiveTab:GetTall()-8 end
	
	self.tex.Tab_Control( 0, Offset, w, h-Offset )
	
end

--[[---------------------------------------------------------
	Tab
-----------------------------------------------------------]]
function SKIN:PaintTab( panel, w, h )

	if ( panel:GetPropertySheet():GetActiveTab() == panel ) then
		return self:PaintActiveTab( panel, w, h )
	end
	
	self.tex.TabT_Inactive( 0, 0, w, h )
	
end

function SKIN:PaintActiveTab( panel, w, h )

	self.tex.TabT_Active( 0, 0, w, h )
	
end

--[[---------------------------------------------------------
	Button
-----------------------------------------------------------]]
function SKIN:PaintWindowCloseButton( panel, w, h )

	if ( !panel.m_bBackground ) then return end
	
	if ( panel:GetDisabled() ) then
		return self.tex.Window.Close( 0, 0, w, h, Color( 255, 255, 255, 50 ) );	
	end	
	
	if ( panel.Depressed || panel:IsSelected() ) then
		return self.tex.Window.Close_Down( 0, 0, w, h );	
	end	
	
	if ( panel.Hovered ) then
		return self.tex.Window.Close_Hover( 0, 0, w, h );	
	end
			
	self.tex.Window.Close( 0, 0, w, h );

end

function SKIN:PaintWindowMinimizeButton( panel, w, h )

	if ( !panel.m_bBackground ) then return end
	
	if ( panel:GetDisabled() ) then
		return self.tex.Window.Mini( 0, 0, w, h, Color( 255, 255, 255, 50 ) );	
	end	
	
	if ( panel.Depressed || panel:IsSelected() ) then
		return self.tex.Window.Mini_Down( 0, 0, w, h );	
	end	
	
	if ( panel.Hovered ) then
		return self.tex.Window.Mini_Hover( 0, 0, w, h );	
	end
			
	self.tex.Window.Mini( 0, 0, w, h );

end

function SKIN:PaintWindowMaximizeButton( panel, w, h )

	if ( !panel.m_bBackground ) then return end
	
	if ( panel:GetDisabled() ) then
		return self.tex.Window.Maxi( 0, 0, w, h, Color( 255, 255, 255, 50 ) );	
	end	
	
	if ( panel.Depressed || panel:IsSelected() ) then
		return self.tex.Window.Maxi_Down( 0, 0, w, h );	
	end	
	
	if ( panel.Hovered ) then
		return self.tex.Window.Maxi_Hover( 0, 0, w, h );	
	end
			
	self.tex.Window.Maxi( 0, 0, w, h );

end

--[[---------------------------------------------------------
	VScrollBar
-----------------------------------------------------------]]
function SKIN:PaintVScrollBar( panel, w, h )

	self.tex.Scroller.TrackV( 0, 0, w, h );	

end

--[[---------------------------------------------------------
	ScrollBarGrip
-----------------------------------------------------------]]
function SKIN:PaintScrollBarGrip( panel, w, h )

	if ( panel:GetDisabled() ) then
		return self.tex.Scroller.ButtonV_Disabled( 0, 0, w, h );	
	end
	
	if ( panel.Depressed ) then
		return self.tex.Scroller.ButtonV_Down( 0, 0, w, h );	
	end
	
	if ( panel.Hovered ) then
		return self.tex.Scroller.ButtonV_Hover( 0, 0, w, h );	
	end
		
	return self.tex.Scroller.ButtonV_Normal( 0, 0, w, h );

end

--[[---------------------------------------------------------
	ButtonDown
-----------------------------------------------------------]]
function SKIN:PaintButtonDown( panel, w, h )

	if ( !panel.m_bBackground ) then return end
	
	if ( panel.Depressed || panel:IsSelected() ) then
		return self.tex.Scroller.DownButton_Down( 0, 0, w, h );	
	end	
	
	if ( panel:GetDisabled() ) then
		return self.tex.Scroller.DownButton_Dead( 0, 0, w, h );	
	end	
	
	if ( panel.Hovered ) then
		return self.tex.Scroller.DownButton_Hover( 0, 0, w, h );	
	end
			
	self.tex.Scroller.DownButton_Normal( 0, 0, w, h );

end

--[[---------------------------------------------------------
	ButtonUp
-----------------------------------------------------------]]
function SKIN:PaintButtonUp( panel, w, h )

	if ( !panel.m_bBackground ) then return end
	
	if ( panel.Depressed || panel:IsSelected() ) then
		return self.tex.Scroller.UpButton_Down( 0, 0, w, h );	
	end	
	
	if ( panel:GetDisabled() ) then
		return self.tex.Scroller.UpButton_Dead( 0, 0, w, h );	
	end	
	
	if ( panel.Hovered ) then
		return self.tex.Scroller.UpButton_Hover( 0, 0, w, h );	
	end
			
	self.tex.Scroller.UpButton_Normal( 0, 0, w, h );

end

--[[---------------------------------------------------------
	ButtonLeft
-----------------------------------------------------------]]
function SKIN:PaintButtonLeft( panel, w, h )

	if ( !panel.m_bBackground ) then return end
	
	if ( panel.Depressed || panel:IsSelected() ) then
		return self.tex.Scroller.LeftButton_Down( 0, 0, w, h );	
	end	
	
	if ( panel:GetDisabled() ) then
		return self.tex.Scroller.LeftButton_Dead( 0, 0, w, h );	
	end	
	
	if ( panel.Hovered ) then
		return self.tex.Scroller.LeftButton_Hover( 0, 0, w, h );	
	end
			
	self.tex.Scroller.LeftButton_Normal( 0, 0, w, h );

end

--[[---------------------------------------------------------
	ButtonRight
-----------------------------------------------------------]]
function SKIN:PaintButtonRight( panel, w, h )

	if ( !panel.m_bBackground ) then return end
	
	if ( panel.Depressed || panel:IsSelected() ) then
		return self.tex.Scroller.RightButton_Down( 0, 0, w, h );	
	end	
	
	if ( panel:GetDisabled() ) then
		return self.tex.Scroller.RightButton_Dead( 0, 0, w, h );	
	end	
	
	if ( panel.Hovered ) then
		return self.tex.Scroller.RightButton_Hover( 0, 0, w, h );	
	end
			
	self.tex.Scroller.RightButton_Normal( 0, 0, w, h );

end


--[[---------------------------------------------------------
	ComboDownArrow
-----------------------------------------------------------]]
function SKIN:PaintComboDownArrow( panel, w, h )

	if ( panel.ComboBox:GetDisabled() ) then
		return self.tex.Input.ComboBox.Button.Disabled( 0, 0, w, h );	
	end	
	
	if ( panel.ComboBox.Depressed || panel.ComboBox:IsMenuOpen() ) then
		return self.tex.Input.ComboBox.Button.Down( 0, 0, w, h );	
	end	
	
	if ( panel.ComboBox.Hovered ) then
		return self.tex.Input.ComboBox.Button.Hover( 0, 0, w, h );	
	end
			
	self.tex.Input.ComboBox.Button.Normal( 0, 0, w, h );

end

--[[---------------------------------------------------------
	ComboBox
-----------------------------------------------------------]]
function SKIN:PaintComboBox( panel, w, h )
	
	if ( panel:GetDisabled() ) then
		return self.tex.Input.ComboBox.Disabled( 0, 0, w, h );	
	end	
	
	if ( panel.Depressed || panel:IsMenuOpen() ) then
		return self.tex.Input.ComboBox.Down( 0, 0, w, h );	
	end	
	
	if ( panel.Hovered ) then
		return self.tex.Input.ComboBox.Hover( 0, 0, w, h );	
	end
			
	self.tex.Input.ComboBox.Normal( 0, 0, w, h );
	
end

--[[---------------------------------------------------------
	ComboBox
-----------------------------------------------------------]]
function SKIN:PaintListBox( panel, w, h )
	
	self.tex.Input.ListBox.Background( 0, 0, w, h );
	
end

--[[---------------------------------------------------------
	NumberUp
-----------------------------------------------------------]]
function SKIN:PaintNumberUp( panel, w, h )

	if ( panel:GetDisabled() ) then
		return self.Input.UpDown.Up.Disabled( 0, 0, w, h );	
	end	
	
	if ( panel.Depressed ) then
		return self.tex.Input.UpDown.Up.Down( 0, 0, w, h );	
	end	
	
	if ( panel.Hovered ) then
		return self.tex.Input.UpDown.Up.Hover( 0, 0, w, h );	
	end
			
	self.tex.Input.UpDown.Up.Normal( 0, 0, w, h );
	
end
		
--[[---------------------------------------------------------
	NumberDown
-----------------------------------------------------------]]
function SKIN:PaintNumberDown( panel, w, h )

	if ( panel:GetDisabled() ) then
		return self.tex.Input.UpDown.Down.Disabled( 0, 0, w, h );	
	end	
	
	if ( panel.Depressed ) then
		return self.tex.Input.UpDown.Down.Down( 0, 0, w, h );	
	end	
	
	if ( panel.Hovered ) then
		return self.tex.Input.UpDown.Down.Hover( 0, 0, w, h );	
	end
			
	self.tex.Input.UpDown.Down.Normal( 0, 0, w, h );
	
end

function SKIN:PaintTreeNode( panel, w, h )

	if ( !panel.m_bDrawLines ) then return end
	
	surface.SetDrawColor( self.Colours.Tree.Lines )
	
	if ( panel.m_bLastChild ) then
	
			surface.DrawRect( 9, 					0,		1, 	7 )
			surface.DrawRect( 9, 					7,		9, 	1 )
	
	else
			surface.DrawRect( 9, 					0,		1, 	h )
			surface.DrawRect( 9, 					7,		9, 	1 )
	end

end


function SKIN:PaintTreeNodeButton( panel, w, h )

	if ( !panel.m_bSelected ) then return end
	
	-- Don't worry this isn't working out the size every render
	-- it just gets the cached value from inside the Label
	local w, _ = panel:GetTextSize() 
	
	self.tex.Selection( 38, 0, w+6, h );

end

function SKIN:PaintSelection( panel, w, h )

	self.tex.Selection( 0, 0, w, h );

end

function SKIN:PaintSliderKnob( panel, w, h )

	if ( panel:GetDisabled() ) then	return self.tex.Input.Slider.H.Disabled( 0, 0, w, h ); end	
	
	if ( panel.Depressed ) then
		return self.tex.Input.Slider.H.Down( 0, 0, w, h );	
	end	
	
	if ( panel.Hovered ) then
		return self.tex.Input.Slider.H.Hover( 0, 0, w, h );	
	end
			
	self.tex.Input.Slider.H.Normal( 0, 0, w, h );

end

local function PaintNotches( x, y, w, h, num )

	if ( !num ) then return end

	local space = w / num
	
	for i=0, num do
	
		surface.DrawRect( x + i * space, y+4,	1,  5 )
	
	end

end

function SKIN:PaintNumSlider( panel, w, h )

	surface.SetDrawColor( Color( 100, 100, 100 ) )
	surface.DrawRect( 8, h/2-1,		w-15,  1 )
	
	PaintNotches( 8, h/2-1,		w-16,  1, panel.m_iNotches )

end

function SKIN:PaintProgress( panel, w, h )

	self.tex.ProgressBar.Back( 0, 0, w, h );
	self.tex.ProgressBar.Front( 0, 0, w * panel:GetFraction(), h );

end

function SKIN:PaintCollapsibleCategory( panel, w, h )

	if ( !panel:GetExpanded() && h < 40 ) then
		return self.tex.CategoryList.Header( 0, 0, w, h );
	end
	
	self.tex.CategoryList.Inner( 0, 0, w, h );

end

function SKIN:PaintCategoryList( panel, w, h )

	self.tex.CategoryList.Outer( 0, 0, w, h );

end

function SKIN:PaintCategoryButton( panel, w, h )

	if ( panel.AltLine ) then

		if ( panel.Depressed || panel.m_bSelected ) then surface.SetDrawColor( self.Colours.Category.LineAlt.Button_Selected );
		elseif ( panel.Hovered ) then surface.SetDrawColor( self.Colours.Category.LineAlt.Button_Hover );
		else surface.SetDrawColor( self.Colours.Category.LineAlt.Button ); end
	
	else
	
		if ( panel.Depressed || panel.m_bSelected ) then surface.SetDrawColor( self.Colours.Category.Line.Button_Selected );
		elseif ( panel.Hovered ) then surface.SetDrawColor( self.Colours.Category.Line.Button_Hover );
		else surface.SetDrawColor( self.Colours.Category.Line.Button ); end
		
	end

	surface.DrawRect( 0, 0, w, h );

end

function SKIN:PaintListViewLine( panel, w, h )

	if ( panel:IsSelected() ) then

		self.tex.Input.ListBox.EvenLineSelected( 0, 0, w, h );
	 
	elseif ( panel.Hovered ) then

		self.tex.Input.ListBox.Hovered( 0, 0, w, h );
	 
	elseif ( panel.m_bAlt ) then

		self.tex.Input.ListBox.EvenLine( 0, 0, w, h );
	         
	end

end

function SKIN:PaintListView( panel, w, h )

	self.tex.Input.ListBox.Background( 0, 0, w, h )

end

function SKIN:PaintTooltip( panel, w, h )

	self.tex.Tooltip( 0, 0, w, h )

end

function SKIN:PaintMenuBar( panel, w, h )

	self.tex.Menu_Strip( 0, 0, w, h )

end


derma.DefineSkin( "CISKIN", "Dark Spawnmenu", SKIN )


if hook.GetTable()["OnGamemodeLoaded"] and hook.GetTable()["OnGamemodeLoaded"]["CreateMenuBar"] then

	local OLDCREATEMENUBAR = OLDCREATEMENUBAR or hook.GetTable()["OnGamemodeLoaded"]["CreateMenuBar"]

	hook.Add( "OnGamemodeLoaded", "CreateMenuBar", function()

		OLDDMENUOPTIONINIT = OLDDMENUOPTIONINIT or DMenuOption.Init

		function DMenuOption:Init(...)
			local values = {OLDDMENUOPTIONINIT(self, ...)}

			self:SetTextColor( Color( 200, 200, 200 ) )

			return unpack(values)
		end

		OLDCREATEMENUBAR()

	end )

end

hook.Add( "ForceDermaSkin", "CISKIN.Force", function()

    return "CISKIN"

end )

-- ConVar to select which HUD we want to use
local selected_hud = CreateClientConVar("kawaii_hud", 3, true, false)

-- Font
surface.CreateFont( "HUDTimer", { size = 17, weight = 800, font = "Trebuchet24" } )
surface.CreateFont( "HUDTimer2", { size = 18, weight = 100000, font = "Lato" } )	
surface.CreateFont( "HUDTimerBig", { size = 28, weight = 400, font = "Trebuchet24" } )
surface.CreateFont( "HUDTimerMedThick", { size = 22, weight = 40000, font = "Trebuchet24" } )
surface.CreateFont( "HUDTimerKindaUltraBig", { size = 28, weight = 4000, font = "Trebuchet24" } )

-- Converting a time
local fl, fo  = math.floor, string.format
local function ConvertTime( ns )
	ns = math.Round(ns, 4)

	if ns > 3600 then
		return fo( "%d:%.2d:%.2d.%.3d", fl( ns / 3600 ), fl( ns / 60 % 60 ), fl( ns % 60 ), fl( ns * 1000 % 1000 ) )
	else
		return fo( "%.2d:%.2d.%.3d", fl( ns / 60 % 60 ), fl( ns % 60 ), fl( ns * 1000 % 1000 ) )
	end
end
local function cTime(ns)
	ns = math.Round(ns, 4)

	if ns > 3600 then
		return fo( "%d:%.2d:%.2d.%.1d", fl( ns / 3600 ), fl( ns / 60 % 60 ), fl( ns % 60 ), fl( ns * 10 % 10 ) )
	elseif ns > 60 then 
		return fo( "%.1d:%.2d.%.1d", fl( ns / 60 % 60 ), fl( ns % 60 ), fl( ns * 10 % 10 ) )
	else
		return fo( "%.1d.%.1d", fl( ns % 60 ), fl( ns * 10 % 10 ) )
	end
end

-- Neat :)
HUD = {}
HUD.Ids = {"Counter Strike: Source", "Simple", "Momentum", "Flow Network"}

-- Themes
local sync = "0"

local last = 0
local coll
local lastUp = CurTime()

MONHUD = {}
MONHUD.Enabled = CreateClientConVar( "kawaii_momentum_speed_hud", "1", true, false, "Momentum speed hud display" )

hook.Add("HUDPaint", "Speedometer", function() 
		local MONHUD = MONHUD.Enabled:GetBool()
		if !MONHUD then return end

        local current = LocalPlayer():GetVelocity():Length2D()
    	if not (LocalPlayer():Team() == TEAM_SPECTATOR) then 
	    if (current == 0) then
		 	   	current = 0
	       	 else
	    		if (current <= 33) and not LocalPlayer():IsOnGround() then
		  	  	current = 30
		  	  end 
	   	 end

        if last < current then
            coll = Color(0, 160, 200)
        end
        if last > current then
            coll = Color(255,0,0)
        end
        if last == current then
            if CurTime() > (lastUp + 0.5) then
                coll = Color(255, 255, 255)
                lastUp = CurTime()
            end
        end

		local width = 200
		local height = 100
		local xPos = (ScrW() / 2) - (width / 2)
		local yPos = ScrH() - height - 60 - (LocalPlayer():Team() == TEAM_SPECTATOR and 50 or 0)

        last = current
        draw.SimpleText(string.Split(current, ".")[1], "HUDTimerKindaUltraBig", ScrW() / 2, yPos - 110, coll, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
end)

HUD.Themes = {
	function(pl, data) -- CS:S
		local base = Color(20, 20, 20, 150)
		local text = color_white

		if (data.strafe) then 
			sync = data.sync or sync
			return
		end

		-- Current Vel
		local velocity = math.floor(pl:GetVelocity():Length2D())

		-- Strings
		local time = "Time: "
		local pb = "PB: "
		local style = pl:GetNWInt("Style", 1)
		local stylename = Core:StyleName(style or 1) .. (pl:IsBot() and " Bot" or "")

		-- Personal best
		local personal = ConvertTime(data.pb or 0)

		-- Current Time
		local current = data.current < 0 and 0 or data.current
		local currentf = cTime(current)

		-- Jumps
		jumps = pl.player_jumps or 0

		-- Activity 
		local activity = current > 0 and 1 or 2
		activity = (pl:GetNWInt("inPractice", false) or (pl.TnF or pl.TbF)) and 3 or activity
		activity = (activity == 1 and (pl:IsBot() and 4 or 1) or activity)

		-- Outer box
		local width = 130
		local height = {124, 64, 44, 84}
		height = height[activity]
		local xPos = (ScrW() / 2) - (width / 2)
		local yPos = ScrH() - height - 60 - (LocalPlayer():Team() == TEAM_SPECTATOR and 50 or 0)

		draw.RoundedBox(16, xPos, yPos, width, height, base)

		-- HUD on the bottom
		if (activity == 1) then 
			draw.SimpleText(stylename, "HUDTimer", ScrW() / 2, yPos + 20, text, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)		
			draw.SimpleText(time .. currentf, "HUDTimer", ScrW() / 2, yPos + 40, text, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			draw.SimpleText("Jumps: " .. jumps or 0, "HUDTimer", ScrW() / 2, yPos + 60, text, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			draw.SimpleText("Sync: " .. sync .. "%", "HUDTimer", ScrW() / 2, yPos + 80, text, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)	
			draw.SimpleText("Speed: " .. velocity, "HUDTimer", ScrW() / 2, yPos + 100, text, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)			
		elseif (activity == 2) then
			draw.SimpleText("In Start Zone", "HUDTimer", ScrW() / 2, yPos + 20, text, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			draw.SimpleText("Speed: " .. velocity, "HUDTimer", ScrW() / 2, yPos + 40, text, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)			
		elseif (activity == 3) then
			draw.SimpleText("Speed: " .. velocity, "HUDTimer", ScrW() / 2, yPos + 20, text, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)			
		elseif (activity == 4) then 
			draw.SimpleText(stylename, "HUDTimer", ScrW() / 2, yPos + 20, text, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)		
			draw.SimpleText(time .. currentf, "HUDTimer", ScrW() / 2, yPos + 40, text, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			draw.SimpleText("Speed: " .. velocity, "HUDTimer", ScrW() / 2, yPos + 60, text, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)		
		end

		local wr, wrn
		if (not WorldRecords) or (not WorldRecords[style]) or (#WorldRecords[style] == 0) then 
			wr = "No time recorded"
			wrn = ""
		else 
			wr = ConvertTime(WorldRecords[pl:GetNWInt("Style", 1)][2])
			wrn = "(" .. WorldRecords[pl:GetNWInt("Style", 1)][1] .. ")"
		end

		-- Top 
		draw.SimpleText("WR: " .. wr .. " " .. wrn, "HUDTimerBig", 10, 6, text)
		draw.SimpleText(pb .. personal, "HUDTimerBig", 10, 34, text)	

		-- Spec 
		if (LocalPlayer():Team() == TEAM_SPECTATOR) then 
			-- Draw big box
			surface.SetDrawColor(base)
			surface.DrawRect(0, ScrH() - 80, ScrW(), ScrH())

			-- Name
			local name = pl:Name()

			-- Bot?
			if (pl:IsBot()) then 
				name = Core:StyleName(style or 1) .. " Replay (" .. pl:GetNWString("BotName", "Loading...") .. ")"
			end

			draw.SimpleText(name, "HUDTimer", ScrW() / 2, ScrH() - 40, text, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)		
		end	
	end,

	-- Simple
	function(pl, data)
		local base = Color(20, 20, 20, 150)
		local text = color_white

		local width = 200
		local height = 100
		local xPos = (ScrW() / 2) - (width / 2)
		local yPos = ScrH() - 90 - height

		if (data.strafe) then 
			sync = data.sync or sync
			return
		end

		local theme = Momentum
		local box = Color(0, 0, 0, 100)
		local tc = color_white
		local tc2 = Color(0, 160, 200)
		local su = Color(0, 160, 200)
		local sd = Color(200, 0, 0)
		local start = false

		local current = data.current < 0 and 0 or data.current
		local time = ConvertTime(current)

		local personal = data.pb 
		local personalf = ConvertTime(personal) .. data.recTp

		local status = "No Timer"

		-- Current Vel
		local velocity = math.floor(pl:GetVelocity():Length2D())

		if (velocity == 0) then
			velocity = 0
		else
			if (velocity <= 33) and not LocalPlayer():IsOnGround() then
				velocity = 30
			end 
		end

		-- Jumps
		jumps = pl.player_jumps or 0
	
		-- Strings
		local style = pl:GetNWInt("Style", 1)
		local stylename = Core:StyleName(style or 1) .. (pl:IsBot() and " Bot" or "")

		-- Personal best
		local personal = ConvertTime(data.pb or 0)

		-- Current Time
		local current = data.current < 0 and 0 or data.current
		local currentf = ConvertTime(current)

		-- Jumps
		jumps = pl.player_jumps or 0

		local current = data.current < 0 and 0 or data.current
		local time = ConvertTime(current)

		local szStyle = Core:StyleName(pl:GetNWInt("Style", _C.Style.Normal))

		local personal = data.pb 
		local personalf = ConvertTime(personal) .. data.recTp

		local status = "Disabled"

		if current > 0.01 then
			status = time
		end

		if (pl.TnF or pl.TbF) then 
			status = ConvertTime(current)

			if pl.TnF or pl.TbF then 
				draw.SimpleText("Map Completed", "HUDTimer2", ScrW() / 2, yPos - 40, tc, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			end 
		end

		draw.SimpleText("Time: " .. status, "HUDTimer2", ScrW() / 2, yPos + 60, tc, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

		if current < 0.01 and not pl:GetNWInt("inPractice", true) and pl:GetMoveType() != MOVETYPE_NOCLIP then 
			draw.SimpleText("Start Zone", "HUDTimer2", ScrW() / 2, yPos + 92, tc, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			draw.SimpleText("Unranked", "HUDTimer2", ScrW() / 2, yPos + 123, tc, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			draw.SimpleText(velocity .. " u/s", "HUDTimer2", ScrW() / 2, yPos - 390, tc, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		else
			draw.SimpleText(szStyle, "HUDTimer2", ScrW() / 2, yPos + 92, tc, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			--draw.SimpleText(velocity, "HUDTimer2", ScrW() / 2, yPos + 123, tc, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			draw.SimpleText(velocity .. " u/s", "HUDTimer2", ScrW() / 2, yPos - 390, tc, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

			draw.SimpleText("Sync: " .. sync .. "%", "HUDTimer2", 1755, 1000, tc)
			draw.SimpleText("Jumps: " .. jumps or 0, "HUDTimer2", 100, 1000, tc)
		end

		if not pl:IsBot() and pl:GetNWInt("inPractice", true) then 
			draw.SimpleText("Practicing", "HUDTimer2", ScrW() / 2, yPos - 40, tc, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end

		local wr, wrn
		if (not WorldRecords) or (not WorldRecords[style]) or (#WorldRecords[style] == 0) then 
			wr = "No time recorded"
			wrn = ""
		else 
			wr = ConvertTime(WorldRecords[pl:GetNWInt("Style", 1)][2])
			wrn = "(" .. WorldRecords[pl:GetNWInt("Style", 1)][1] .. ")"
		end

		-- Top 
		draw.SimpleText("Map: " .. game.GetMap(), "HUDTimer2", 10, 8, tc, TEXT_ALIGN_LEFT)
		draw.SimpleText("World Record: " .. wr .. " " .. wrn, "HUDTimer2", 9, 28, tc)
		draw.SimpleText("Personal Best: " .. personalf, "HUDTimer2", 10, 48, tc)	

		-- In spec
		if LocalPlayer():Team() == TEAM_SPECTATOR then
			local ob = pl
			if IsValid( ob ) and ob:IsPlayer() then
				local nStyle = ob:GetNWInt( "Style", _C.Style.Normal )
				local szStyle = Core:StyleName( nStyle )

				if ob:IsBot() then
					--draw.SimpleText("Progress "  .. 4.5 * math.Round(time) * 100 / 100  .. "%", "HUDTimer", ScrW() / 2, yPos - 45, text, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
					draw.SimpleText("Status: Playing (1x)", "HUDTimer", ScrW() / 2, yPos + 48, text, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
				end

				local header, pla
				if ob:IsBot() then
					header = "Spectating"
					pla =  szStyle .. " Replay " .. "(" .. ob:GetNWString("BotName", "Loading...") .. ")"
				else
					header = "Spectating"
					pla = szStyle .. " (" .. ob:Name() .. ")"
				end

	  		 	 if (velocity == 0) then
		 			   	velocity = 0
	       			 else
	    				if (velocity <= 33) and not LocalPlayer():IsOnGround() then
		  	 		 	velocity = 30
		  			  end 
	   			 end

       			 if last < velocity then
       			     coll = Color(0, 160, 200)
      			  end
       			 if last > velocity then
        		    coll = Color(255,0,0)
      			  end
       			 if last == velocity then
         		   if CurTime() > (lastUp + 0.5) then
          		      coll = Color(255, 255, 255)
         		       lastUp = CurTime()
         		   end
       			 end

				local width = 200
				local height = 100
				local xPos = (ScrW() / 2) - (width / 2)
				local yPos = ScrH() - height - 60 - (LocalPlayer():Team() == TEAM_SPECTATOR and 50 or 0)

      			last = current
       			draw.SimpleText(string.Split(velocity, ".")[1], "HUDTimerKindaUltraBig", ScrW() / 2, yPos - 110 + 50, coll, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
				draw.SimpleText( header, "HUDHeaderBig", ScrW() / 2, 15, Color(25, 25, 25, 255), TEXT_ALIGN_CENTER )
				draw.SimpleText( header, "HUDHeaderBig", ScrW() / 2, 15, Color(0, 160, 200, 255), TEXT_ALIGN_CENTER )
				draw.SimpleText( pla, "HUDHeader", ScrW() / 2, 56, Color(25, 25, 25, 255), TEXT_ALIGN_CENTER )
				draw.SimpleText( pla, "HUDHeader", ScrW() / 2, 56, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER )
			end
		end
	end,

	function(pl, data) -- Momentum
		local base = Color(20, 20, 20, 150)
		local text = color_white

		local width = 200
		local height = 100
		local xPos = (ScrW() / 2) - (width / 2)
		local yPos = ScrH() - 90 - height

		if (data.strafe) then 
			sync = data.sync or sync
			return
		end

		local theme = Momentum
		local box = Color(0, 0, 0, 100)
		local tc = color_white
		local tc2 = Color(0, 160, 200)
		local su = Color(0, 160, 200)
		local sd = Color(200, 0, 0)
		local start = false

		local current = data.current < 0 and 0 or data.current
		local time = cTime(current)

		local personal = data.pb 
		local personalf = ConvertTime(personal) .. data.recTp

		local status = "No Timer"

    	if not (LocalPlayer():Team() == TEAM_SPECTATOR) then 
		if current > 1.42 then
			draw.SimpleText("Sync", "HUDTimerMedThick", ScrW() / 2, yPos + height + 10, tc, TEXT_ALIGN_CENTER)
			draw.SimpleText(sync or 0, "HUDTimerKindaUltraBig", ScrW() / 2, yPos + height + 34, col, TEXT_ALIGN_CENTER)

		if (sync ~= 0) and (type(sync) == 'number') then 
			local col = sync > 93 and su or tc 
			col = sync < 90 and sd or col
			col = sync == 0 and color_white or col

			-- Sync bar thingy
			local barwidth = sync / 100 * (width + 10)
				surface.SetDrawColor(col)
				surface.DrawRect(xPos - 10, ScrH() - 24, barwidth, 16)
			end
				surface.SetDrawColor(Color(200, 0, 0))
			end
		end

		-- Current Vel
		local velocity = math.floor(pl:GetVelocity():Length2D())

		-- Strings
		local style = pl:GetNWInt("Style", 1)
		local stylename = Core:StyleName(style or 1) .. (pl:IsBot() and " Bot" or "")

		-- Personal best
		local personal = ConvertTime(data.pb or 0)

		-- Current Time
		local current = data.current < 0 and 0 or data.current
		local currentf = cTime(current)

		-- Jumps
		jumps = pl.player_jumps or 0

		-- Speedometer
		local speed = LocalPlayer():GetVelocity():Length2D()

		pl.speedcol = pl.speedcol or tc
		pl.current = pl.current or 0 
		local diff = speed - pl.current
		if pl.current == speed or speed == 0 then 
			pl.speedcol = tc
		elseif diff > -2 then 
			pl.speedcol = su
		elseif diff < -2 then
			pl.speedcol = sd
		end

		local width = 200
		local height = 100
		local xPos = (ScrW() / 2) - (width / 2)
		local yPos = ScrH() - height - 60

		-- Activity 
		local activity = current > 0 and 1 or 2
		activity = (pl:GetNWInt("inPractice", false) or (pl.TnF or pl.TbF)) and 3 or activity
		activity = (activity == 1 and (pl:IsBot() and 4 or 1) or activity)

		surface.SetDrawColor(Color(200, 0, 0))

		surface.SetDrawColor(box)
		surface.DrawRect(xPos, yPos - 30, width, height)

		local current = data.current < 0 and 0 or data.current
		local time = cTime(current)

		local personal = data.pb 
		local personalf = ConvertTime(personal) .. data.recTp

		local status = "No Timer"

		if current > 0.01 then
			status = time
		end

		if (pl.TnF or pl.TbF) then 
			status = cTime(current)

			if pl.TnF or pl.TbF then 
				draw.SimpleText("Map Completed", "HUDTimer", ScrW() / 2, yPos - 40, tc, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			end 
		end

		draw.SimpleText(status, "HUDTimerKindaUltraBig", ScrW() / 2, yPos - 10, tc, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

		if current < 0.01 and not pl:GetNWInt("inPractice", true) and pl:GetMoveType() != MOVETYPE_NOCLIP then 
			draw.SimpleText("Start Zone", "HUDTimer", ScrW() / 2, yPos - 40, tc, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end

		if not pl:IsBot() and pl:GetNWInt("inPractice", true) then 
			draw.SimpleText("Practicing", "HUDTimer", ScrW() / 2, yPos - 40, tc, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end

		local wr, wrn
		if (not WorldRecords) or (not WorldRecords[style]) or (#WorldRecords[style] == 0) then 
			wr = "No time recorded"
			wrn = ""
		else 
			wr = ConvertTime(WorldRecords[pl:GetNWInt("Style", 1)][2])
			wrn = "(" .. WorldRecords[pl:GetNWInt("Style", 1)][1] .. ")"
		end

		-- Top 
		draw.SimpleText("Map: " .. game.GetMap(), "HUDTimer", 10, 8, tc, TEXT_ALIGN_LEFT)
		draw.SimpleText("World Record: " .. wr .. " " .. wrn, "HUDTimer", 9, 28, tc)
		draw.SimpleText("Personal Best: " .. personalf, "HUDTimer", 10, 48, tc)	

		-- In spec
		if LocalPlayer():Team() == TEAM_SPECTATOR then
			local ob = pl
			if IsValid( ob ) and ob:IsPlayer() then
				local nStyle = ob:GetNWInt( "Style", _C.Style.Normal )
				local szStyle = Core:StyleName( nStyle )

				if ob:IsBot() then
					draw.SimpleText("Status: Playing (1x)", "HUDTimer", ScrW() / 2, yPos + 48, text, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
				end

				local header, pla
				if ob:IsBot() then
					header = "Spectating"
					pla =  szStyle .. " Replay " .. "(" .. ob:GetNWString("BotName", "Loading...") .. ")"
				else
					header = "Spectating"
					pla = szStyle .. " (" .. ob:Name() .. ")"
				end

	  		 	 if (velocity == 0) then
		 			   	velocity = 0
	       			 else
	    				if (velocity <= 33) and not LocalPlayer():IsOnGround() then
		  	 		 	velocity = 30
		  			  end 
	   			 end

       			 if last < velocity then
       			     coll = Color(0, 160, 200)
      			  end
       			 if last > velocity then
        		    coll = Color(255,0,0)
      			  end
       			 if last == velocity then
         		   if CurTime() > (lastUp + 0.5) then
          		      coll = Color(255, 255, 255)
         		       lastUp = CurTime()
         		   end
       			 end

				local width = 200
				local height = 100
				local xPos = (ScrW() / 2) - (width / 2)
				local yPos = ScrH() - height - 60 - (LocalPlayer():Team() == TEAM_SPECTATOR and 50 or 0)

      			last = current
       			draw.SimpleText(string.Split(velocity, ".")[1], "HUDTimerKindaUltraBig", ScrW() / 2, yPos - 110 + 50, coll, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
				draw.SimpleText( header, "HUDHeaderBig", ScrW() / 2, 15, Color(25, 25, 25, 255), TEXT_ALIGN_CENTER )
				draw.SimpleText( header, "HUDHeaderBig", ScrW() / 2, 15, Color(0, 160, 200, 255), TEXT_ALIGN_CENTER )
				draw.SimpleText( pla, "HUDHeader", ScrW() / 2, 56, Color(25, 25, 25, 255), TEXT_ALIGN_CENTER )
				draw.SimpleText( pla, "HUDHeader", ScrW() / 2, 56, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER )
			end
		end
	end,

	-- Flow Network
	function(pl, data)
		-- Size
		local width = 230
		local height = 95

		-- Positions
		local xPos = data.pos[1] 
		local yPos = data.pos[2]

		-- Colours
		local BASE = Settings:GetValue("PrimaryCol")
		local INNER = Settings:GetValue("SecondaryCol")
		local TEXT = Settings:GetValue("TextCol")
		local BAR = Settings:GetValue("AccentCol")
		local OUTLINE = Color(0, 0, 0, 0)

		--local theme = Theme:Get("hud.flow.redesign")
		--local BASE = theme["Colours"]["Primary Colour"]
		--local INNER = theme["Colours"]["Secondary Colour"]
		--local BAR = theme["Colours"]["Accent Colour"]
		--local TEXT = theme["Colours"]["Text Colour"]
		--local OUTLINE = theme["Toggles"]["Outlines"] and color_black or Color(0, 0, 0, 0)

		sync = data.sync or sync

		-- Strafe HUD?
		if (data.strafe) then 
			xPos = xPos + 5

			-- Height/Width is a bit different on this
			height = height + 35
			width = width

			-- Easy calculations
			local x, y, w, h = 0, 0, 0, 0

			-- Draw base 
			surface.SetDrawColor(BASE)
			surface.DrawRect(ScrW() - xPos - width, ScrH() - yPos - height, width + 5, height)

			-- Draw inners
			surface.SetDrawColor(INNER)
			surface.DrawRect(ScrW() - xPos + 5 - width, ScrH() - yPos - (height - 5), width - 5, 55)
			
			-- A
			x, y, w, h = ScrW() - xPos + 5 - width, ScrH() - yPos - (height - 65), (width / 2) - 5, 27
			surface.SetDrawColor(data.a and BAR or INNER)
			surface.DrawRect(x, y, w, h)
			draw.SimpleText("A", "HUDTimer", x + w/2, y + h/2, TEXT, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

			-- D
			x, y = ScrW() - xPos + 5 - width/2, ScrH() - yPos - (height - 65)
			surface.SetDrawColor(data.d and BAR or INNER)
			surface.DrawRect(x, y, w, h)
			draw.SimpleText("D", "HUDTimer", x + w/2, y + h/2, TEXT, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

			-- Left
			x, y = ScrW() - xPos + 5 - width, ScrH() - yPos - (height - 97)
			surface.SetDrawColor(data.l and BAR or INNER)
			surface.DrawRect(x, y, w, h)
			draw.SimpleText("Mouse Left", "HUDTimer", x + w/2, y + h/2, TEXT, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			
			-- Right
			x = ScrW() - xPos + 5 - width/2
			surface.SetDrawColor(data.r and BAR or INNER)
			surface.DrawRect(x, y, w, h)
			draw.SimpleText("Mouse Right", "HUDTimer", x + w/2, y + h/2, TEXT, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

			-- Extra Keys
			x, y = ScrW() - xPos + 15 - width, ScrH() - yPos - (height - 20)
			draw.SimpleText("Extras: ", "HUDTimer", x, y, TEXT, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

			-- Strafes
			draw.SimpleText("Strafes: " .. (data.strafes or 0), "HUDTimer", x, y + 23, TEXT, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

			x = ScrW() - xPos - 10
			draw.SimpleText("Duck", "HUDTimer", x, y, data.duck and BAR or TEXT, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
			draw.SimpleText("Jump", "HUDTimer", x - 42, y, data.jump and BAR or TEXT, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
			draw.SimpleText("S", "HUDTimer", x - 88, y, data.s and BAR or TEXT, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
			draw.SimpleText("W", "HUDTimer", x - 108, y, data.w and BAR or TEXT, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
			draw.SimpleText(("Sync: " .. sync .. "%"), "HUDTimer", x, y + 23, TEXT, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)

			-- Outlines
			surface.SetDrawColor(OUTLINE)
			surface.DrawOutlinedRect(ScrW() - xPos - width, ScrH() - yPos - height, width + 5, height)
			surface.DrawOutlinedRect(ScrW() - xPos + 5 - width, ScrH() - yPos - (height - 5), width - 5, 55)
			surface.DrawOutlinedRect(ScrW() - xPos + 5 - width, ScrH() - yPos - (height - 65), (width / 2) - 5, 27)
			surface.DrawOutlinedRect(ScrW() - xPos + 5 - width/2, ScrH() - yPos - (height - 65), (width / 2) - 5, 27)
			surface.DrawOutlinedRect(ScrW() - xPos + 5 - width, ScrH() - yPos - (height - 97), (width / 2) - 5, 27)
			surface.DrawOutlinedRect(ScrW() - xPos + 5 - width/2, ScrH() - yPos - (height - 97), (width / 2) - 5, 27)

			return 
		end

		-- In spec
		if LocalPlayer():Team() == TEAM_SPECTATOR then
			local ob = pl
			if IsValid( ob ) and ob:IsPlayer() then
				local nStyle = ob:GetNWInt( "Style", _C.Style.Normal )
				local szStyle = Core:StyleName( nStyle )
				
				local header, pla
				if ob:IsBot() then
					header = "Spectating Bot"
					pla =  ob:GetNWString("BotName", "Loading...") .. " (" .. szStyle .. " style)"
				else
					header = "Spectating"
					pla = ob:Name() .. " (" .. szStyle .. ")"
				end

				draw.SimpleText( header, "HUDHeaderBig", ScrW() / 2, ScrH() - 58 - 40, Color(25, 25, 25, 255), TEXT_ALIGN_CENTER )
				draw.SimpleText( header, "HUDHeaderBig", ScrW() / 2, ScrH() - 60 - 40, Color(214, 59, 43, 255), TEXT_ALIGN_CENTER )
				draw.SimpleText( pla, "HUDHeader", ScrW() / 2, ScrH() - 18 - 40, Color(25, 25, 25, 255), TEXT_ALIGN_CENTER )
				draw.SimpleText( pla, "HUDHeader", ScrW() / 2, ScrH() - 20 - 40, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER )
			end
		end

		-- Current Vel
		local velocity = math.floor(pl:GetVelocity():Length2D())

		-- Strings
		local time = "Time: "
		local pb = "PB: "

		-- Personal best
		local personal = data.pb 
		local personalf = ConvertTime(personal) .. data.recTp

		-- Current Time
		local current = data.current < 0 and 0 or data.current
		local currentf = ConvertTime(current) .. data.curTp

		-- Start Zone
		if pl:GetNWInt("inPractice", false) then 
			currentf = ""
			personalf = ""
			time = "Timer Disabled"
			pb = "Practice mode has no timer"
		elseif (current <= 0) and (not pl:IsBot()) then 
			currentf = ""
			personalf = ""
			time = "Timer Disabled"
			pb = "Leave the zone to start timer"
		end

		-- Draw base 
		surface.SetDrawColor(BASE)
		surface.DrawRect(xPos, ScrH() - yPos - 95, width, height)

		-- Draw inners
		surface.SetDrawColor(INNER)
		surface.DrawRect(xPos + 5, ScrH() - yPos - 90, width - 10, 55)
		surface.DrawRect(xPos + 5, ScrH() - yPos - 30, width - 10, 25)

		-- Bar
		local cp = math.Clamp(velocity, 0, 3500) / 3500
		surface.SetDrawColor(BAR)
		surface.DrawRect(xPos + 5, ScrH() - yPos - 30, cp * 220, 25)

		-- Text
		draw.SimpleText(time, "HUDTimer", (currentf != "" and xPos + 12 or xPos + width / 2), ScrH() - yPos - 75, TEXT, (currentf != "" and TEXT_ALIGN_LEFT or TEXT_ALIGN_CENTER), TEXT_ALIGN_CENTER)
		draw.SimpleText(pb, "HUDTimer", (currentf != "" and xPos + 13 or xPos + width / 2), ScrH() - yPos - 50, TEXT, (currentf != "" and TEXT_ALIGN_LEFT or TEXT_ALIGN_CENTER), TEXT_ALIGN_CENTER)
		draw.SimpleText(velocity .. " u/s", "HUDTimer", xPos + 115, ScrH() - yPos - 18, TEXT, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		draw.SimpleText(currentf, "HUDTimer", xPos + width - 12, ScrH() - yPos - 75, TEXT, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
		draw.SimpleText(personalf, "HUDTimer", xPos + width - 12, ScrH() - yPos - 50, TEXT, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)

		-- Draw Outlines
		surface.SetDrawColor(OUTLINE)
		surface.DrawOutlinedRect(xPos, ScrH() - yPos - 95, width, height)
		surface.DrawOutlinedRect(xPos + 5, ScrH() - yPos - 90, width - 10, 55)
		surface.DrawOutlinedRect(xPos + 5, ScrH() - yPos - 30, width - 10, 25)
	end
}

-- Capture data for ssj 
local JHudStatistics = {0, 0, 0, 0}
local JHudAnnounced = 0
net.Receive("kawaii.secret", function(_, _)
	local jumps = net.ReadInt(16)
	local gain = net.ReadFloat()
	local speed = net.ReadInt(18)
	local jss = net.ReadFloat()

	JHudAnnounced = CurTime()
	JHudStatistics = {jumps, gain, speed, jss}
end)

surface.CreateFont( "JHUDMain", { size = 20, weight = 4000, font = "Trebuchet24" } )
surface.CreateFont( "JHUDMainBIG", { size = 48, weight = 4000, font = "Trebuchet24" } )
surface.CreateFont( "JHUDMainBIG2", { size = 28, weight = 4000, font = "Trebuchet24" } )

local secret = CreateClientConVar("kawaii_secret", 0, true)

-- SSJ hud
local fade = 0

local function SSJ_HUD()
	local jump, gain, speed, jss = unpack(JHudStatistics)

	local color = Color(235, 49, 46, 255)
	local color35 = Color(255, 255, 255)
	local color355 = Color(255, 255, 255)
	local color77 = Color(255, 255, 255)

     if (speed > 0) then
	   if (speed >= 277) then
	   	 color35 = Color(0, 160, 200)
	    else 
		  color35 = Color(255, 255, 255)
		end 
	 end

     if (gain > 0) then
	   if (gain >= 277) then
	   	 color35 = Color(0, 160, 200)
		end 
	 end

     if (JHudAnnounced + 2) < CurTime() then 
        fade = fade + 0.5
        color35.a = math.Clamp(color35.a - fade, 0, 255)
        color35.a = color35.a
     else
        fade = 0
     end

     if (JHudAnnounced + 2) < CurTime() then 
        fade = fade + 0.5
        color355.a = math.Clamp(color355.a - fade, 0, 255)
        color355.a = color355.a
     else
        fade = 0
     end

	 if (JHudAnnounced + 2) < CurTime() then 
        fade = fade + 2
        color77.a = math.Clamp(color77.a - fade, 0, 255)
        color77.a = color77.a
     else
        fade = 0
     end

	if (gain > 0) then
		if (gain >= 80) then
			color = Color(0, 160, 200, 255)
		elseif (gain > 70) and (gain <= 79.99) then
			color = Color(39, 255, 0, 255)
		elseif (gain > 60) and (gain <= 69.99) then
			color = Color(255, 191, 0, 255)
		else 
			color = Color(255, 0, 0, 255)
		end 
	end

	if (JHudAnnounced + 2) < CurTime() then 
		fade = fade + 0.5
		color.a = color.a - fade 
	else 
		fade = 0 
	end

	gain = math.Round(gain, 2) .. "%"

	if jump <= 1 then 
	else 
		draw.SimpleText(speed - jump + 3, "JHUDMainBIG2", ScrW() / 2, (ScrH() / 2) - 140, color355, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end

	if jump <= 1 then 
		draw.SimpleText(speed, "JHUDMainBIG", ScrW() / 2, (ScrH() / 2) - 100, color355, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	else
		draw.SimpleText(speed, "JHUDMainBIG", ScrW() / 2, (ScrH() / 2) - 100, color, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end

	if jump <= 1 then 
	else 
		draw.SimpleText(gain, "JHUDMainBIG2", ScrW() / 2, (ScrH() / 2) - 60, color355, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end

	local width = 200
	local height = 100

	local xPos = (ScrW() / 2) - (width / 2)
	local yPos = ScrH() - 90 - height
	local tc = color_white

	kawaiihud = GetConVarNumber("kawaii_hud")

	if kawaiihud == 2 and jump <= 0 then 
		draw.SimpleText("", "HUDTimer2", ScrW() / 2, yPos + 123, color77, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	else
		draw.SimpleText(speed .. " (+" .. speed - 56 .. ")", "HUDTimer2", ScrW() / 2, yPos + 123, color77, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end

end


function HUD:Draw(style, client, data) 
	self.Themes[selected_hud:GetInt()](client, data)

	if secret:GetInt() == 1 then 
		SSJ_HUD()
	end
end