package br.ederlima.ui.events 
{
	import flash.events.Event;
	import br.ederlima.ui.ListItem;
	
	/**
	 * Classe TreeViewEvent
	 * <br>Disparado com ações do mouse sobre cada ListItem na TreeView
	 * @author Eder Lima
	 */
	public class TreeItemEvent extends Event 
	{
		/**
		 * Disparado quando o cursor está sobre o ListItem
		 */
		public static const ITEM_ROLL_OVER:String = "tree_item_rollover";
		/**
		 * Disparado quando o cursor deixa o ListItem
		 */
		public static const ITEM_ROLL_OUT:String = "tree_item_rollout";
		/**
		 * Disparado quando ao clicar sobre o ListItem
		 */
		public static const ITEM_CLICK:String = "tree_item_click";
		/**
		 * Disparado quando o cursor está sobre o Folder
		 */
		public static const FOLDER_ROLL_OVER:String = "folder_item_rollover";
		/**
		 * Disparado quando o cursor deixa o Folder
		 */
		public static const FOLDER_ROLL_OUT:String = "folder_item_rollout";
		/**
		 * Disparado ao clicar sobre o Folder
		 */
		public static const FOLDER_CLICK:String = "folder_item_click";
		
		private var _listItem:ListItem = new ListItem();
		/**
		 * Construtor da Classe
		 * @param	type Tipo do Evento
		 * @param	listItem Objeto ListItem
		 */
		public function TreeItemEvent(type:String, listItem:ListItem = null, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			_listItem = listItem;
			super(type, bubbles, cancelable);
		} 
		
		public override function clone():Event 
		{ 
			return new TreeItemEvent(type, _listItem, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("TreeItemEvent", "type", "ListItem - Objeto ListItem","bubbles", "cancelable", "eventPhase"); 
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