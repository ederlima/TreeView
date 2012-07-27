package br.ederlima.ui.icons 
{
	import flash.display.MovieClip;
	/**
	 * IconItem
	 * <br>Ícone padrão para Itens
	 * @author Eder Lima
	 */
	public class IconItem extends MovieClip
	{
		/**
		 * Construtor da Classe
		 */
		public function IconItem() 
		{
			this.graphics.lineStyle(0, 0, 0);
			this.graphics.beginFill(0x000000, 1);
			this.graphics.drawRect(6, 6, 3, 3);
			this.graphics.endFill();
			this.visible = true;
			this.name = "simpleIcon";
		}
		
	}

}