package br.ederlima.ui 
{
	import br.ederlima.ui.styles.FolderItemStyle;
	import br.ederlima.ui.types.ListItemType;
	import br.ederlima.ui.types.ListItemState;
	import br.ederlima.ui.events.ListItemEvent;
	import br.ederlima.ui.styles.ListItemStyle;
	import br.ederlima.ui.styles.FolderItemStyle;
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	import flash.text.AntiAliasType;
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFieldAutoSize;
	
	
	/**
	 * ListItem
	 * O Objeto ListItem é desenhado para representar cada item de um XML em uma TreeView
	 * Ele renderiza dois tipos diferentes de ListItens: Item e Folder
	 * @author Eder Lima
	 */
	public dynamic class ListItem extends MovieClip 
	{
				
		private var _labelField:TextField = new TextField();
		private var _hit:MovieClip = new MovieClip();
		private var _bg:MovieClip = new MovieClip();
		
		private var _listItemStyle:ListItemStyle = new ListItemStyle();
		private var _folderItemStyle:FolderItemStyle = new FolderItemStyle();
		
		private var _width:Number = 200;
		private var _backgroundColor:uint = 0;
		private var _colorString:String = "";
		private var _alternateColor:uint = 0;
		private var _alternateColorString:String = "";
		private var _defaultFormat:TextFormat = new TextFormat("Arial", "11", 0x333333);
		private var _id:int = 0;
		private var _uniqueId:String = "";
		private var _parentList:List = null;
		private var _containerList:List = null;
		private var _type:String;
		private var _label:String = "";
		
		private var _colorTransform:ColorTransform = new ColorTransform();
		
		private var _iconContainer:MovieClip = new MovieClip();
		private var _iconSimpleItem:MovieClip = new MovieClip();
		private var _iconFolderOpen:MovieClip = new MovieClip();
		private var _iconFolderClosed:MovieClip = new MovieClip();
		private var _state:String = ListItemState.CLOSED;
		
		private var _primaryValue:String = "";
		private var _secondaryValue:String = "";
		
		private var _active:Boolean = false;
		
		/**
		 * Construtor da Classe ListItem
		 * @param	type Tipo do Item
		 * @param	itemStyle Estilo do Item
		 * @param	folderStyle Estilo do Item do tipo Folder
		 */
		public function ListItem(type:String = "", itemStyle:ListItemStyle = null, folderStyle:FolderItemStyle = null) 
		{
			_type = type;
			
			if (itemStyle != null)
			{
				listItemStyle = itemStyle;
			}
			if (folderStyle != null)
			{
				folderItemStyle = folderStyle;
			}
			switch(_type)
			{
				case (ListItemType.TYPE_ITEM) :
				backgroundColor = _listItemStyle.backgroundColor;
				_alternateColorString = _listItemStyle.alternateColor;
				defaultFormat = _listItemStyle.textFormat;
				_iconSimpleItem = _listItemStyle.primaryIcon;
				break;
				case (ListItemType.TYPE_FOLDER) : 
				backgroundColor = _folderItemStyle.backgroundColor;
				_alternateColorString = _folderItemStyle.alternateColor;
				defaultFormat = _folderItemStyle.textFormat;
				_iconFolderClosed = _folderItemStyle.primaryIcon;
				_iconFolderOpen = _folderItemStyle.secondaryIcon;
				_iconFolderOpen.visible = false;
				break;
			}
					
			_bg.graphics.lineStyle(0, 0, 0);
			_bg.graphics.beginFill(_backgroundColor);
			_bg.graphics.drawRect(0, 0, _width, 30);
			_bg.graphics.endFill();
			_bg.name = "bg";
			this.addChild(_bg);
			
			_labelField.mouseEnabled = false;
			_labelField.x = 26;
			_labelField.y = 5;
			_labelField.antiAliasType = AntiAliasType.ADVANCED;
			_labelField.width = _width - 36;
			_labelField.multiline = true;
			_labelField.wordWrap = true;
			_labelField.autoSize = TextFieldAutoSize.LEFT;
			_labelField.defaultTextFormat = _defaultFormat;
			this.addChild(_labelField);
			
			_iconContainer.x = 5;
			_iconContainer.y = 7;
			addChild(_iconContainer);
			
			_iconContainer.addChild(_iconFolderClosed);
			_iconContainer.addChild(_iconFolderOpen);
			_iconContainer.addChild(_iconSimpleItem);
			
			_hit.graphics.lineStyle(0, 0, 0);
			_hit.graphics.beginFill(0x000000, 1);
			_hit.graphics.drawRect(0, 0, _width, 30);
			_hit.graphics.endFill();
			_hit.name = "hit";
			_hit.alpha = 0;
			this.addChild(_hit);
			
			this._hit.addEventListener(MouseEvent.CLICK, itemClick);
			this._hit.addEventListener(MouseEvent.ROLL_OVER, itemOver);
			this._hit.addEventListener(MouseEvent.ROLL_OUT, itemOut);
			
		}
		
		private function itemOut(event:MouseEvent):void 
		{
			this.dispatchEvent(new ListItemEvent(ListItemEvent.LIST_ITEM_OUT, this as ListItem));
		}
		
		private function itemOver(event:MouseEvent):void 
		{
			this.dispatchEvent(new ListItemEvent(ListItemEvent.LIST_ITEM_OVER, this as ListItem));
		}
		
		private function itemClick(event:MouseEvent):void 
		{
			if (this.type == ListItemType.TYPE_FOLDER)
			{
				this.state == ListItemState.CLOSED ? this.state = ListItemState.OPEN : this.state = ListItemState.CLOSED;
			}
			this.dispatchEvent(new ListItemEvent(ListItemEvent.LIST_ITEM_CLICK, this as ListItem));
		}
		/**
		 * Largura do ListItem da Lista
		 */
		public function get itemWidth():Number 
		{
			return _width;
		}
		
		public function set itemWidth(value:Number):void 
		{
			_width = value;
			_bg.width = _width;
			_hit.width = _width;
			_labelField.width = _width -36;
		}
		/**
		 * Cor de fundo do ListItem da Lista
		 */
		public function get backgroundColor():String 
		{
			return  _colorString;
		}
		
		public function set backgroundColor(value:String):void 
		{
			_colorString = value;
			_backgroundColor = uint(String("0x" +_colorString));
			_colorTransform = new ColorTransform();
			_colorTransform.color = _backgroundColor;
			_bg.transform.colorTransform = _colorTransform;
		}
		/**
		 * Objeto TextFormat para formatação do ListItem da Lista
		 */
		public function get defaultFormat():TextFormat
		{
			return _defaultFormat;
		}
		
		public function set defaultFormat(value:TextFormat):void 
		{
			_defaultFormat = value;
			_labelField.defaultTextFormat = _defaultFormat;
		}
		/**
		 * Identificador numérico do ListItem da Lista
		 * Usado internamente para posicionar o item dentro de cada Lista
		 */
		public function get id():int 
		{
			return _id;
		}
		
		public function set id(value:int):void 
		{
			_id = value;
		}
		/**
		 * Identificador único do ListItem da Lista, obrigatoriamente único para possível e posterior localização
		 * Deve assumir um valor único em toda a árvore de itens
		 */
		public function get uniqueId():String 
		{
			return _uniqueId;
		}
		
		public function set uniqueId(value:String):void 
		{
			_uniqueId = value;
		}
		/**
		 * Objeto List que comporta o ListItem específico
		 */
		public function get parentList():List 
		{
			return _parentList;
		}
		
		public function set parentList(value:List):void 
		{
			_parentList = value;
		}
		/**
		 * Tipo do ListItem TYPE_FOLDER ou TYPE_ITEM
		 * Objeto ListItemType
		 */
		public function get type():String 
		{
			return _type;
		}

		public function set type(value:String):void 
		{
			_type = value;
			if (_type == ListItemType.TYPE_ITEM)
			{
				_iconFolderClosed.visible = false;
				_iconFolderOpen.visible = false;
				_iconSimpleItem.visible = true;
			}
			else if (_type == ListItemType.TYPE_FOLDER)
			{
				_iconFolderClosed.visible = true;
				_iconFolderOpen.visible = false;
				_iconSimpleItem.visible = false;
			}
			
		}
		/**
		 * Rótulo do ListItem
		 */
		public function get label():String 
		{
			return _label;
		}
		
		public function set label(value:String):void 
		{
			_label = value;
			_labelField.text = _label;
			resetSize();
		}
		/**
		 * Estado do ListItem caso ele seja ListItemType.TYPE_FOLDER
		 * Alterna entre "closed" e "open"
		 */
		public function get state():String 
		{
			return _state;
		}
		
		public function set state(value:String):void 
		{
			_state = value;
			if (_state == ListItemState.CLOSED)
			{
				_iconFolderClosed.visible = true;
				_iconFolderOpen.visible = false;
			}
			else if (_state == ListItemState.OPEN)
			{
				_iconFolderClosed.visible = false;
				_iconFolderOpen.visible = true;
			}
		}
		/**
		 * Lista contida dentro do ListItem
		 */
		public function get containerList():List 
		{
			return _containerList;
		}
		
		public function set containerList(value:List):void 
		{
			_containerList = value;
		}
		/**
		 * Cor alternativa do Item, quando clicado
		 */
		public function get alternateColor():String 
		{
			return _alternateColorString;
		}
		
		public function set alternateColor(value:String):void 
		{
			_alternateColorString = value;
			_alternateColor = uint(String("0x" +_alternateColorString));
			_colorTransform = new ColorTransform();
			_colorTransform.color = _alternateColor;
			_bg.transform.colorTransform = _colorTransform;
		}
		
		/**
		 * Valor primário de cada item do XML
		 */
		public function get primaryValue():String 
		{
			return _primaryValue;
		}
		
		public function set primaryValue(value:String):void 
		{
			_primaryValue = value;
		}
		/**
		 * Valor secundário de cada item do XML
		 */
		public function get secondaryValue():String 
		{
			return _secondaryValue;
		}
		
		public function set secondaryValue(value:String):void 
		{
			_secondaryValue = value;
		}
		/**
		 * Objeto de estilos do Item ListItemStyle
		 */
		public function get listItemStyle():ListItemStyle 
		{
			return _listItemStyle;
		}
		
		public function set listItemStyle(value:ListItemStyle):void 
		{
			_listItemStyle = value;
			backgroundColor = value.backgroundColor;
			_alternateColorString = value.alternateColor;
			defaultFormat = value.textFormat;
		}
		/**
		 * Objeto de estilos do Item FolderItemStyle
		 */
		public function get folderItemStyle():FolderItemStyle 
		{
			return _folderItemStyle;
		}
		
		public function set folderItemStyle(value:FolderItemStyle):void 
		{
			_folderItemStyle = value;
			backgroundColor = value.backgroundColor;
			_alternateColorString = value.alternateColor;
			defaultFormat = value.textFormat;
		}
		/**
		 * MovieClip de fundo (pode ser usado em Tweens)
		 */
		public function get background():MovieClip { return _bg; }
		
		public function set background(value:MovieClip):void 
		{
			_bg = value;
		}
		/**
		 * Campo de texto com o rótulo
		 */
		public function get labelField():TextField { return _labelField; }
		
		public function set labelField(value:TextField):void 
		{
			_labelField = value;
		}
		/**
		 * Indicador se o Item atual está marcado ou não
		 */
		public function get active():Boolean { return _active; }
		
		public function set active(value:Boolean):void 
		{
			_active = value;
		}
		private function resetSize():void
		{
			_bg.height = _labelField.height + 10;
			_hit.height = _labelField.height + 10;
			_labelField.width = _width - 36;
		}
		
	}

}