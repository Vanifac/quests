function event_spawn(e)
	eq.set_timer("visit",150000);
end

function event_timer(e)
	if(e.timer == "visit") then
		eq.depop();
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Didn't your mother teach you not to walk in other people's rooms without knocking?! You didn't even have the courtesy to close the door behind you!!");
	elseif(e.message:findi("princess lenya thex")) then
		e.self:Say("What?!!  You have word of the Princess?  She has been missing for quite a while.  I sent Tearon to Tunaria to search for her, but he has not reported back.  If you wish to help, you'd better prove yourself worthy first. I believe you should talk to Tynkale.");
	end
	
	if(e.other:GetFaction(e.self) < 5) then
		if(e.message:findi("the glory of the mother shines bright")) then
			e.self:Say("So you're the slayer of Jojongua. Funny, I thought you would be taller. I guess you will have to do. I am Tolon Nurbyte of the Silent Watch. We do all the dirty work of King Tearis Thex. No one knows of us. So I hope you accept this mission or I will have to kill you. Do you [accept the mission] or do you [wish to leave]?");
		elseif(e.message:findi("wish to leave")) then
			e.self:Say("There is only insufferable labor and merciless torment here, stranger. Kaya Rishareth has condemned her eternal self to servitude in the War Forge -- her selfless act malignantly repaid by the gods with this existence. Her spirit died here long ago and her life's [effort and struggles] were ultimately for naught.");
			eq.attack(e.other:GetName());
		end
	else
		if(e.message:findi("the glory of the mother shines bright") or e.message:findi("wish to leave")) then
			e.self:Say("When you have furthered your service to the Paladins of Tunare. we shall make conversation.");
		end		
	end
	
	if(e.other:GetFaction(e.self) < 4) then
		if(e.message:findi("accept the mission")) then
			e.self:Say("In her mortal life, Kaya Rishareth was a keeper of tranquility and served her beloved child-like goddess with every fiber of her being. A native to the free city of Freeport, Kaya found herself traveling on her own as soon as her master would allow. Erudin was the destination she chose and it was the temples dedicated to The Tranquil where she sought to learn more about her goddess and perhaps share philosophies and knowledge with the High Men. Erudin received her graciously and for nearly a year, she studied the High Men's way of worship and reverence to their shared deity. However, tranquility is easily disrupted and those who seek it, must also [defend it].");
		elseif(e.message:findi("silent watcher")) then
			e.self:Say("The Silent Watch was established in the early years of Felwithe. King Tearis Thex had many cruel deeds to do. The regular Koad'Vie were too righteous to carry out any of the necessary missions and we dare not bring in the Fier'Dal. After all, some of the operations were against Kelethin.  King Tearis formed our group from Koada'Dal not of such prim and proper breeding. Now we act as his secret guard and report only to him.");
		end
	else
		if(e.message:findi("accept the mission") or e.message:findi("silent watcher")) then
			e.self:Say("When you have furthered your service to the Paladins of Tunare. we shall make conversation.");
		end		
	end
end
function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18841})) then
		e.self:Say("So I see you completed your mission. Good work. You just may be a member of the Silent Watch someday. Well my friend. I will be keeping my eye on you. No doubt we will meet again. Oh, I almost forgot. The Princess wanted you to have this. Now show yourself the door.");
		e.other:Faction(e.self,226,25); -- Faction: Clerics of Tunare
		e.other:Faction(e.self,279,25); -- Faction: King Tearis Thex
		e.other:Faction(e.self, 5002, 15002); -- Faction: Anti-mage
		e.other:QuestReward(e.self,0,0,0,0,13353,2000); -- Item: Thex Dagger
		eq.depop_with_timer();
	end
end