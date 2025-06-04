package;


import flixel.util.FlxGradient;
import flixel.math.FlxPoint;
import flixel.FlxCamera;
import Section.SwagSection;
import Song.SwagSong;
import WiggleEffect.WiggleEffectType;
import flixel.FlxBasic;
import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxGame;
import flixel.FlxObject;
import flixel.FlxState;
import flixel.FlxSubState;
import flixel.addons.display.FlxGridOverlay;
import flixel.addons.effects.FlxTrail;
import flixel.addons.effects.FlxTrailArea;
import flixel.addons.effects.chainable.FlxEffectSprite;
import flixel.addons.effects.chainable.FlxWaveEffect;
import flixel.addons.transition.FlxTransitionableState;
import flixel.graphics.atlas.FlxAtlas;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.ui.FlxBar;
import flixel.util.FlxCollision;
import flixel.util.FlxColor;
import flixel.util.FlxSort;
import flixel.util.FlxStringUtil;
import flixel.util.FlxTimer;
import haxe.Json;
import lime.utils.Assets;
import openfl.Lib;
import openfl.display.BlendMode;
import openfl.display.StageQuality;
import openfl.filters.BitmapFilter;
import openfl.utils.Assets as OpenFlAssets;
import editors.ChartingState;
import editors.CharacterEditorState;
import flixel.group.FlxSpriteGroup;
import flixel.input.keyboard.FlxKey;
import Note.EventNote;
import openfl.events.KeyboardEvent;
import flixel.effects.particles.FlxEmitter;
import flixel.effects.particles.FlxParticle;
import flixel.util.FlxSave;
import flixel.animation.FlxAnimationController;
import animateatlas.AtlasFrameMaker;
import Achievements;
import StageData;
import FunkinLua;
import DialogueBoxPsych;
import Conductor.Rating;
import flixel.FlxSprite;

class StickerFadeTransition extends MusicBeatSubstate {
	public static var finishCallback:Void->Void;
	public static var nextCamera:FlxCamera;
	var stickerGroup:FlxSpriteGroup;
	var isTransIn:Bool = false;
	var gradientTrans:Bool = false;

	var stickerTimes:Int = 400;
	var stickerSprites:Array<String> = [
		"bluu",
		"gf",
		"dad"
	];
	var timerSticks:FlxTimer = null;
	var excuses:Array<Array<Float>> = [];
	var durationTween:Float = 0;
	
	private var leTween:FlxTween = null;
	var transBlack:FlxSprite;
	var transGradient:FlxSprite;
	public function new(duration:Float, isTransIn:Bool, gradientTrans:Bool = false) {
		super();
		this.durationTween = duration;
		this.isTransIn = isTransIn;
		this.gradientTrans = gradientTrans;

		if (!gradientTrans)
		{
			stickerGroup = new FlxSpriteGroup(0, 0, stickerTimes);
			add(stickerGroup);

			var stickerPerTime:Float = (duration / stickerTimes) / 100;


			//trace(TitleState.spriteDataGroup[0] == null);

			timerSticks = new FlxTimer().start(stickerPerTime, function(timer:FlxTimer){
				// isTransIn - close
				if (!isTransIn){
					createSticker(10, duration/2);

					if (stickerGroup.length < stickerTimes)
						timerSticks.reset(stickerPerTime);
				} else {
					//deleteStickers();
					createSticker(stickerGroup.maxSize);
					//deleteSprites = true;
					new FlxTimer().start(duration/2, t -> deleteSprites = true);
				}

				//trace(stickerGroup.length);
			});

			if(nextCamera != null) {
				stickerGroup.cameras = [nextCamera];
			}
		}
		else
		{
			var zoom:Float = FlxMath.bound(FlxG.camera.zoom, 0.05, 1);
			var width:Int = Std.int(FlxG.width / zoom);
			var height:Int = Std.int(FlxG.height / zoom);
			transGradient = FlxGradient.createGradientFlxSprite(1, height, (isTransIn ? [0x0, FlxColor.BLACK] : [FlxColor.BLACK, 0x0]));
			transGradient.scale.x = width;
			transGradient.updateHitbox();
			transGradient.scrollFactor.set();
			add(transGradient);
	
			transBlack = new FlxSprite().makeGraphic(1, height + 400, FlxColor.BLACK);
			transBlack.scale.x = width;
			transBlack.updateHitbox();
			transBlack.scrollFactor.set();
			add(transBlack);
	
			transGradient.x -= (width - FlxG.width) / 2;
			transBlack.x = transGradient.x;
	
			if(isTransIn) {
				transGradient.y = transBlack.y - transBlack.height;
				FlxTween.tween(transGradient, {y: transGradient.height + 50}, duration, {
					onComplete: function(twn:FlxTween) {
						close();
					},
				ease: FlxEase.linear});
			} else {
				transGradient.y = -transGradient.height;
				transBlack.y = transGradient.y - transBlack.height + 50;
				leTween = FlxTween.tween(transGradient, {y: transGradient.height + 50}, duration, {
					onComplete: function(twn:FlxTween) {
						if(finishCallback != null) {
							finishCallback();
						}
					},
				ease: FlxEase.linear});
			}
	
			if(nextCamera != null) {
				transBlack.cameras = [nextCamera];
				transGradient.cameras = [nextCamera];
			}
		}
		nextCamera = null;
	}

	function createSticker(times:Int = 1, tweenTime:Float = 0.5){
		FlxG.sound.play(Paths.sound("keys/keyClick" + FlxG.random.int(1, 9)));
		for (t in 0...times){
			var id_sprites:Int = stickerGroup.length - 1;
			var stickerscale = 0.5;

			var random_sticker = "stickers/" + stickerSprites[FlxG.random.int(0, stickerSprites.length-1)] + "Sticker" + FlxG.random.int(1, 3);


			if (id_sprites < 0) id_sprites = 0; 

			var sticker:FlxSprite = new FlxSprite();
			sticker.loadGraphic(Paths.image(random_sticker));

			sticker.setGraphicSize(Std.int(sticker.width * (stickerscale + 0.2)));
			sticker.updateHitbox();
			sticker.ID = id_sprites;

			FlxTween.tween(sticker.scale, {x: stickerscale, y: stickerscale}, 0.5, {ease: FlxEase.backOut});
		
			var randomPos = new FlxPoint(0,0);

			//randomPos.x = FlxG.random.float(-sticker.width, FlxG.width, excuses[0]);
			//randomPos.y = FlxG.random.float(-sticker.height, FlxG.height, excuses[1]);
			for (c in 0...50){
				randomPos.x = FlxG.random.float(-sticker.width, FlxG.width);
				randomPos.y = FlxG.random.float(-sticker.height, FlxG.height);
				if (!stickerGroup.overlapsPoint(randomPos, true, nextCamera)){
					break;
				}
			}

			sticker.angle = FlxG.random.float(-30, 20);

			sticker.setPosition(randomPos.x, randomPos.y);

			stickerGroup.add(sticker);

			for (i in 0...Std.int(sticker.width)){
				excuses.push([(sticker.x + i), (sticker.y + i)]);
			}

			if (stickerGroup.length >= stickerGroup.maxSize && !isTransIn){				
				if (timerSticks    != null) timerSticks.cancel();
				if (finishCallback != null) finishCallback();

			}
		}
	}

	function deleteStickers(times:Int = 1, ?duration:Float = 0.7){
		FlxG.sound.play(Paths.sound("tape/tapeStick" + FlxG.random.int(1, 5)));
		for (t in 0...times){
			if (isTransIn && stickerGroup != null){
				if (stickerGroup.length > 0)
				{
					stickerGroup.forEachAlive(function(spr:FlxSprite){
						if (spr.ID == stickerGroup.maxSize - stickerGroup.length){
							spr.kill();
							stickerGroup.remove(spr, true);
							spr.destroy();									
						}
					});
				}

				if (stickerGroup.length == 1){
					//TitleState.spriteDataGroup = [];
					close();
				}
			}
		}
	}

	var deleteSprites:Bool = false;
	override function update(elapsed:Float) {

		if (!gradientTrans)
		{
			if (deleteSprites){
				deleteStickers(10, durationTween);
			}

			stickerGroup.forEachAlive(function(spr:FlxSprite) spr.centerOrigin() );
		}
		else
		{
			if(isTransIn) {
				transBlack.y = transGradient.y + transGradient.height;
			} else {
				transBlack.y = transGradient.y - transBlack.height;
			}
		}
			
		super.update(elapsed);

		if (gradientTrans)
		{
			if(isTransIn) {
				transBlack.y = transGradient.y + transGradient.height;
			} else {
				transBlack.y = transGradient.y - transBlack.height;
			}
		}

	}

	override function destroy() {
		if(!gradientTrans && timerSticks != null) {

			timerSticks.cancel();

			stickerGroup.kill();
			stickerGroup.clear();
			stickerGroup.destroy();

			// if (finishCallback != null) finishCallback();
		}

		if (gradientTrans && leTween != null)
		{
			finishCallback();
			leTween.cancel();
		}
		super.destroy();
	}
}