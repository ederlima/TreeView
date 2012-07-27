package br.ederlima.ui.events 
{
	import flash.events.Event;
	
	/**
	 * Classe de Eventos para List
	 * @author Eder Lima
	 */
	public class ListEvent extends Event 
	{
		/**
		 * Evento disparado quando uma lista é aberta (mostrada)
		 */
		public static const LIST_OPEN:String = "list_event_open";
		/**
		 * Evento disparado quando uma lista é fechada
		 */
		public static const LIST_CLOSE:String = "list_event_close";
		/**
		 * Construtor da Classe
		 * @param	type Tipo do Evento
		 */
		public function ListEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
		} 
		
		public override function clone():Event 
		{ 
			return new ListEvent(type, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("ListEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}