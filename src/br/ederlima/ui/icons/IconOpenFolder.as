package br.ederlima.ui.icons 
{
	import flash.display.MovieClip;
	/**
	 * IconOpenFolder
	 * <br>Ícone padrão para Folders abertos
	 * @author Eder Lima
	 */
	public class IconOpenFolder extends MovieClip
	{
		/**
		 * Construtor da Classe
		 */
		public function IconOpenFolder() 
		{
			this.graphics.lineStyle(1, 0x000000, 1);
			this.graphics.beginFill(0xffffff, 1);
			this.graphics.drawRect(3, 3, 8, 8);
			this.graphics.endFill();
		}
		
	}

}