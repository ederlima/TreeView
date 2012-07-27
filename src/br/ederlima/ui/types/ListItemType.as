package br.ederlima.ui.types 
{
	/**
	 * ListItemType
	 * <br>Define o tipo e comportamento de um item da TreeView
	 * @author Eder Lima
	 */
	public class ListItemType extends Object
	{
		/**
		 * Define o comportamento como Folder (pasta), contendo outros itens ou pastas dentro
		 */
		public static const TYPE_FOLDER:String = "item_type_folder";
		/**
		 * DEfine o comportamento como Item
		 */
		public static const TYPE_ITEM:String = "item_type_item";
		/**
		 * Construtor da Classe
		 */
		public function ListItemType() 
		{
			
		}
		
	}

}