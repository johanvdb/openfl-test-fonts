package;

import openfl.Assets;
import openfl.display.Sprite;
import openfl.text.Font;
import openfl.text.TextField;
import openfl.text.TextFieldAutoSize;
import openfl.text.TextFormat;

class Main extends Sprite {
	
	private var fonty: Int = 10;
	
	private function addTextField(fontFile: String = null) {
		var textField: TextField = new TextField();
		textField.text = "H|AB012Iygj ";
		if (fontFile != null) {
			var font: Font = Assets.getFont(fontFile);
			var format: TextFormat = new TextFormat(font.fontName, 20);
			textField.embedFonts = true;
			textField.defaultTextFormat = format;
			textField.text += font.fontName;
		} else {
			var format: TextFormat = new TextFormat(20);
			textField.defaultTextFormat = format;
			textField.text += "Default font";
		}
		textField.x = 10;
		textField.y = fonty;
		textField.autoSize = TextFieldAutoSize.LEFT;
		addChild(textField);
		
		graphics.lineStyle(2, 0x000000);
		graphics.drawRect(8, fonty-2, textField.textWidth+4, textField.textHeight+4);

		fonty += Math.round(textField.textHeight + 1) + 10;
	}
	
	public function new () {
		super();
		addTextField();
		var fontFiles: Array<String> = Assets.list(AssetType.FONT);
		for (fontFile in fontFiles) {
			addTextField(fontFile);
		}
	}
	
}