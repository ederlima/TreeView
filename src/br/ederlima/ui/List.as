package br.ederlima.ui 
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.utils.Dictionary;
	import br.ederlima.ui.events.ListItemEvent
	import br.ederlima.ui.types.ListItemType;
	
	/**
	 * List
	 * <br>Contém outros Itens ou Folders, agrupando-os e cuidando do posicionamento e redimensionamento 
	 * @author Eder Lima
	 */
	public class List extends MovieClip 
	{
		
		private var _itens:Dictionary = new Dictionary();
		private var _id:String = "";
		private var _itemCount:int = 0;
		private var _parentListItem:ListItem = null;
		/**
		 * Construtor da Classe
		 */
		public function List() 
		{

		}
		/**
		 * Adiciona um ListItem a List, posicionando automaticamente abaixo do item anterior
		 * @param	item Objeto ListItem
		 * @return	Objeto ListItem
		 */
		public function addItem(item:ListItem):DisplayObject
		{
			_itens[item.id] = item;
			if (_itemCount > 0)
			{
				item.y = MovieClip(this.getChildAt(numChildren - 1)).y + MovieClip(this.getChildAt(numChildren - 1)).height;
			}
			this.addChild(item);
			_itemCount++;
			return item as DisplayObject;
		}
		
		/**
		 * Remove um ListItem da Lista
		 * @param	item Objeto ListItem
		 */
		public function removeItem(item:ListItem):void
		{
			this.removeChild(item);
			delete _itens[item.id];
			refreshList();
		}
		/**
		 * Atualiza as posições dos ListItens dentro da Lista
		 */
		public function refreshList():void
		{
			_itemCount = this.numChildren;
			for (var i:int = 0; i < this.numChildren; i++)
			{
				if (i > 0)
				{
					MovieClip(this.getChildAt(i)).y = MovieClip(this.getChildAt(i - 1)).y + MovieClip(this.getChildAt(i - 1)).height;
				}
				else
				{
					MovieClip(this.getChildAt(i)).y = 0;
				}
			}
		}
		/**
		 * Dictionary contendo todos os ListItens de cada lista
		 */
		public function get itens():Dictionary 
		{
			return _itens;
		}
		
		public function set itens(value:Dictionary):void 
		{
			_itens = value;
		}
		/**
		 * Identificador único da Lista
		 */
		public function get id():String 
		{
			return _id;
		}
		
		public function set id(value:String):void 
		{
			_id = value;
		}
		/**
		 * ListItem que hospeda a Lista (List)
		 */
		public function get parentListItem():ListItem 
		{
			return _parentListItem;
		}
		
		public function set parentListItem(value:ListItem):void 
		{
			_parentListItem = value;
		}
		
	}

}