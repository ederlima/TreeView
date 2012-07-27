package br.ederlima.ui.events 
{
	import flash.events.Event;
	import br.ederlima.ui.ListItem;
	
	/**
	 * Classe de Eventos para ListItens
	 * @author Eder Lima
	 */
	public class ListItemEvent extends Event 
	{
		private var _listItem:ListItem = new ListItem();
		
		/**
		 * Disparado quando o mouse está sobre o ListItem
		 */
		public static const LIST_ITEM_OVER:String = "list_item_over";
		/**
		 * Disparado quando o mouse sai do ListItem
		 */
		public static const LIST_ITEM_OUT:String = "list_item_out";
		/**
		 * Disparado ao clicar sobre o ListItem
		 */
		public static const LIST_ITEM_CLICK:String = "list_item_click";
		
		/**
		 * Construtor da Classe
		 * @param	type Tipo do Evento
		 * @param	listItem Objeto ListItem
		 */
		public function ListItemEvent(type:String, listItem:ListItem = null, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			_listItem = listItem;
			super(type, bubbles, cancelable);
		} 
		
		public override function clone():Event 
		{ 
			return new ListItemEvent(type, _listItem, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("ListItemEvent", "type", "ListItem", "bubbles", "cancelable", "eventPhase"); 
		}
		/**
		 * Objeto ListItem
		 * <br>Retorna os dados do item atual
		 */
		public function get currentItem():ListItem 
		{
			return _listItem;
		}
		
		public function set currentItem(value:ListItem):void 
		{
			_listItem = value;
		}
		
		
	}
	
}