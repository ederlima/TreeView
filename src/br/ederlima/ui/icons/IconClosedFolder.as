package br.ederlima.ui.icons 
{
	import flash.display.MovieClip;
	/**
	 * IconClosedFolder
	 * <br>Ícone padrão para Folders fechados
	 * @author Eder Lima
	 */
	public class IconClosedFolder extends MovieClip
	{
		/**
		 * Construtor da Classe
		 */
		public function IconClosedFolder() 
		{
			
			this.graphics.lineStyle(1, 0x000000, 1);
			this.graphics.beginFill(0xffffff, 1);
			this.graphics.drawRect(3, 3, 8, 8);
			this.graphics.endFill();
			this.graphics.lineStyle(0, 0, 0);
			this.graphics.beginFill(0x000000, 1);
			this.graphics.drawRect(6, 6, 3, 3);
			this.name = "iconClosedFolder";
		}
		
	}

}