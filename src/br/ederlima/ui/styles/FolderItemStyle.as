package br.ederlima.ui.styles 
{
	import br.ederlima.ui.icons.IconClosedFolder;
	import br.ederlima.ui.icons.IconOpenFolder;
	import flash.display.MovieClip;
	import flash.text.TextFormat;
	/**
	 * ListItemStyle
	 * <br>Configura a formatação específica para cada item do tipo Folder
	 * @author Eder Lima
	 */
	public class FolderItemStyle 
	{
		private var _primaryIcon:MovieClip = null;
		private var _secondaryIcon:MovieClip = null;
		private var _textFormat:TextFormat = new TextFormat("Arial", "11", 0x333333);
		private var _backgroundColor:String = "EAEAEA";
		private var _alternateColor:String = "E4E4E4";
		/**
		 * Construtor da Classe
		 * @param	textFormat Objeto do tipo TextFormat
		 * @param	backgroundColor String com a cor de fundo, ex: "000000"
		 * @param	alternateColor String cmo a cor alternativa, ex: "FFFFFF"
		 * @param	primaryIcon Instância de MovieClip para servir como ícone (pasta aberta)
		 * @param	secondaryIcon Instância de MovieClip para servir como ícone (pasta fechada)
		 */
		public function FolderItemStyle(textFormat:TextFormat = null, backgroundColor:String = "", alternateColor:String = "", primaryIcon:MovieClip = null, secondaryIcon:MovieClip = null) 
		{
			if (primaryIcon != null)
			{
				_primaryIcon = primaryIcon;
			}
			else
			{
				_primaryIcon = new IconClosedFolder();
			}
			if (secondaryIcon != null)
			{
				_secondaryIcon = secondaryIcon;
			}
			else
			{
				_secondaryIcon = new IconOpenFolder();
			}
			if (textFormat != null)
			{
				_textFormat = textFormat;
			}
			if (backgroundColor != "")
			{
				_backgroundColor = backgroundColor;
			}
			if (alternateColor != "")
			{
				_alternateColor = alternateColor;
			}
		}

		/**
		 * Cor de fundo, ex: "FFFFFF"
		 */
		public function get backgroundColor():String 
		{
			return _backgroundColor;
		}
		
		public function set backgroundColor(value:String):void 
		{
			_backgroundColor = value;
		}
		/**
		 * Objeto TextFormat
		 * <br>É responsável por formatar o texto do Item como fonte, cor, negrito e outras opções
		 * <br>Utilize um objeto TextFormat para realização a formatação conforme desejar
		 */
		public function get textFormat():TextFormat 
		{
			return _textFormat;
		}
		
		public function set textFormat(value:TextFormat):void 
		{
			_textFormat = value;
		}
		/**
		 * MovieClip do ícone Primário (Ícone para ListItem e Ícone fechado para FolderItem)
		 */
		public function get primaryIcon():MovieClip 
		{
			return _primaryIcon;
		}
		
		public function set primaryIcon(value:MovieClip):void 
		{
			_primaryIcon = value;
		}
		/**
		 * MovieClip do ícone Secundário (Ícone para FolderItem aberto)
		 */
		public function get secondaryIcon():MovieClip 
		{
			return _secondaryIcon;
		}
		
		public function set secondaryIcon(value:MovieClip):void 
		{
			_secondaryIcon = value;
		}
		/**
		 * Cor de fundo secundária, ex: "EAEAEA"
		 */
		public function get alternateColor():String 
		{
			return _alternateColor;
		}
		
		public function set alternateColor(value:String):void 
		{
			_alternateColor = value;
		}

		
	}

}