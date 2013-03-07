package  
{
	import br.ederlima.ui.icons.IconClosedFolder;
	import br.ederlima.ui.icons.IconItem;
	import br.ederlima.ui.List;
	import br.ederlima.ui.ListItem;
	import br.ederlima.ui.events.ListItemEvent;
	import br.ederlima.ui.events.TreeItemEvent;
	import br.ederlima.ui.events.TreeViewEvent
	import br.ederlima.ui.styles.FolderItemStyle;
	import br.ederlima.ui.TreeView;
	import br.ederlima.ui.types.ListItemType;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import br.ederlima.ui.styles.ListItemStyle;
	import flash.text.TextFormat;
	import flash.ui.Mouse;
	//import com.greensock.TweenLite;
	/*import com.greensock.plugins.TweenPlugin;
	import com.greensock.plugins.TintPlugin;
	import com.greensock.plugins.RemoveTintPlugin;*/
	import fl.containers.ScrollPane;
	
	/**
	 * ...
	 * @author Eder Lima
	 */
	public class TreeViewTeste extends MovieClip 
	{
		private var list:List = new List();
		private var _xmloader:URLLoader = new URLLoader();
		private var st:ListItemStyle = new ListItemStyle();
		private var tree:TreeView = new TreeView();
		private var pane:ScrollPane = new ScrollPane();
	
		
		public function TreeViewTeste() 
		{
			_xmloader.addEventListener(Event.COMPLETE, xmlComplete);
			_xmloader.load(new URLRequest("data.xml"));
			//TweenPlugin.activate([TintPlugin, RemoveTintPlugin]);
		}
		
		private function xmlComplete(event:Event):void 
		{
			tree.dataProvider = XML(event.target.data);
			tree.listStyle = new ListItemStyle(new TextFormat("Trebuchet MS", "11", 0x000000, false, false), "FFFFFF", "B0CDEA");
			tree.folderStyle = new FolderItemStyle(new TextFormat("Arial", "12", 0x333333, true, false), "FFFFFF", "FFFFFF");
			tree.margin = 20;
			tree.itemWidth = 250;
			tree.itemHeight = 380;
			tree.addEventListener(TreeItemEvent.ITEM_ROLL_OVER, itemOver);
			tree.addEventListener(TreeItemEvent.ITEM_ROLL_OUT, itemOut);
			tree.addEventListener(TreeItemEvent.ITEM_CLICK, itemClick);
			
			tree.addEventListener(TreeItemEvent.FOLDER_ROLL_OVER, folderOver);
			tree.addEventListener(TreeItemEvent.FOLDER_ROLL_OUT, folderOut);
			tree.addEventListener(TreeItemEvent.FOLDER_CLICK, folderClick);
			
			tree.addEventListener(TreeViewEvent.SEARCH_SUCCESS, onSearch);
			tree.addEventListener(TreeViewEvent.SEARCH_ERROR, onSearchError);
			
			addChild(tree);
			
			bb.addEventListener(MouseEvent.CLICK, onStageClick);
			bc.addEventListener(MouseEvent.CLICK, expandAll);
			bd.addEventListener(MouseEvent.CLICK, collapseAll);
		}
		
		private function collapseAll(e:MouseEvent):void 
		{
			tree.collapseAll();
		}
		private function expandAll(event:MouseEvent):void
		{
			tree.expandAll();
		}
		private function onSearchError(event:TreeViewEvent):void 
		{
			trace("Não existe");
		}
		
		private function onSearch(event:TreeViewEvent):void 
		{
			trace(event.currentItem.label);
		}
		//actions sobre os folders
		private function folderClick(event:TreeItemEvent):void 
		{
			trace( "click folder");
		}
		private function folderOut(event:TreeItemEvent):void 
		{
			trace( "out folder");
		}
		
		private function folderOver(event:TreeItemEvent):void 
		{
			trace( "over folder");
		}
		//actions sobre os itens
		private function itemClick(event:TreeItemEvent):void 
		{
			trace( "click item");
		}
		
		private function itemOut(event:TreeItemEvent):void 
		{
			trace( "out item");
		}
		
		private function itemOver(event:TreeItemEvent):void 
		{
			trace( "over item");
		}
		
		
		private function onStageClick(event:MouseEvent):void 
		{
			tree.findItem("loremipsum");
		}
		
		
		
	}

}