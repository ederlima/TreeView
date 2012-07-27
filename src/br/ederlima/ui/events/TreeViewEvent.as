package br.ederlima.ui.events 
{
	import flash.events.Event;
	import br.ederlima.ui.ListItem;
	
	/**
	 * TreeViewEvent
	 * <br>Classe de Eventos de uma TreeView
	 * @author Eder Lima
	 */
	public class TreeViewEvent extends Event 
	{
		/**
		 * Disparado quando a busca encontra o item especificado
		 */
		public static const SEARCH_SUCCESS:String = "tree_view_event_search_success";
		/**
		 * Disparado quandoa  busca não encontra o item selecionado
		 */
		public static const SEARCH_ERROR:String = "tree_view_event_search_error";
		private var _listItem:ListItem = new ListItem();
		/**
		 * Construtor da Classe
		 * @param	type Tipo do Evento
		 * @param	listItem Objeto ListItem
		 */
		public function TreeViewEvent(type:String, listItem:ListItem = null, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			_listItem = listItem;
			super(type, bubbles, cancelable);
		} 
		
		public override function clone():Event 
		{ 
			return new TreeViewEvent(type, _listItem, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("TreeViewEvent", "type", "ListItem", "bubbles", "cancelable", "eventPhase"); 
		}
		/**
		 * Retorna o objeto encontrado
		 */
		public function get currentItem():ListItem { return _listItem; }
		
		public function set currentItem(value:ListItem):void 
		{
			_listItem = value;
		}
		
	}
	
}