local _, ns = ...
local points = ns.points

ns.bestPet = "對於獵人來說，最好的寵物無疑是貓。\n\n以下是一些值得馴服的稀有/精英寵物：\n\n"
			.."莫克瓦     - 7 級，莫高雷血蹄村以西\n拉魯克     - 7 級，杜洛塔迴音群島\n"
			.."暮色潛行者     - 9 級，泰達希爾\n耙子     - 10 級，雷霆崖以東。重生時間 30 分鐘以上\n"
			.."迪舒     - 13 級，貧瘠之地北部\n暗影之爪     - 13 級，黑海岸奧伯丁北部\n"
			.."胡瑪     - 23 級，貧瘠之地棘齒城。重生時間 8 小時以上\n"
			.."阿拉加     - 35 級，奧特蘭克山脈。重生時間 2-3 天\n斷齒     - 37 級，荒蕪之地\n"
			.."巴格希拉     - 40 級精英，荊棘谷\n班加拉什國王     - 43 級精英，荊棘谷\n\n"
			.."對於那些喜歡風蛇的人來說... 當然是哈卡之子\n你可以在祖爾格拉布找到他。60 級精英，以及\n"
			.."石爪山脈的幼年驕傲之翼（僅限），作為獲得擊殺命令的共同獎勵"
ns.chest1 = "* 10 級攔路物資\n* 10 級法師卷軸\n* 5 個專業技能配方\n* 白色、灰色物品"
ns.chest2 = "* 10 級攔路物資\n* 10 級法師卷軸\n* 13 個專業技能配方\n* 綠色、白色、灰色物品"
ns.chest3 = "* 20 級攔路物資\n* 20 級法師卷軸\n* 10 個專業技能配方\n* 綠色、灰色物品"
ns.cozySleepingBag = "第一步：" ..( ( ns.faction == "Alliance" ) and "前往西瘟疫之地的艾力克斯頓農場" or
			"前往貧瘠之地陶拉祖以南的燒毀塔樓" ) .."\n在廢墟中尋找燒毀的殘骸。\n\n"
			.."第二步：" ..( ( ns.faction == "Alliance" ) and "前往貧瘠之地陶拉祖以南的燒毀塔樓。" or
			"前往西瘟疫之地的艾力克斯頓農場" )
			.."\n在廢墟中尋找燒毀的殘骸。\n從附近的釘板處接取下一個任務。\n\n"
			.."第三步：前往石爪山脈，尋找一個\n廢棄的營地。它位於陽光樹林小屋東北方向的一條小路上。\n在那裡的一個箱子上可以找到口袋垃圾。\n\n"
			.."第四步：向北走，直上山坡，尋找一堆泥土。\n"
			.."點擊完成“翻找”。接受“濕活”。\n\n"
			.."第五步：洛克莫丹，在濕地邊界水壩的壁架上。\n點擊鷹雕像完成並開始任務。\n\n"
			.."第六步：攀登索拉丁之牆，它位於希爾斯布萊德丘陵和阿拉希\n高地的交界處。從希爾斯布萊德丘陵一側的一輛破損的推車處向上攀爬。\n繼續攀登，你會發現一個大廳和一個袋子。\n\n"
			.."注意：這個任務鏈會獎勵你 8 個學生\n飼料。目前這是獲得這個休息經驗加成的唯一途徑！"
ns.felPortals = "由術士的探險家小鬼使用，\n法師用於他們的火焰衝擊符文等"
ns.gnomeregan = "(1) 從任何\n諾莫瑞根的垃圾堆或黑鐵大使身上拾取一個污跡斑斑的回收品。\n\n"
			.."(2) 在宿舍，將其和 30 銀幣放入\n回收機器 9000 中。你需要達到 40 級。\n\n"
			.."附近的齊莉會提供幫助修理，你需要\n提供 10 個秘銀錠（拍賣行）、5 個強效\n"
			.."奧術精華（拍賣行）、3 個 GG12-082 型保險絲\n（諾莫瑞根機械怪物掉落）和一個原始 G-7\n"
			.."核心處理器，詳情如下：\n\n(3) 在諾莫瑞根入口處殺死機械技師（40 級精英）\n"
			.."獲得一個腐蝕的處理器。你現在正在進行第三個\n任務。與齊莉交談。\n\n"
			.."(4) 前往藏寶海灣的斯庫提。第四個任務需要你\n從淒涼之地、塵泥沼澤、菲拉斯和塔納利斯收集信標。\n\n(5) 回到藏寶海灣後，斯庫提會將你傳送到\n"
			.."菲拉斯的維達爾奇物公司。注意：如果你\n敢對他的自動化裝置動一根汗毛，它們就會把你從他的基地踢出去。無論如何，將爐石\n設置在海灣是一個明智的選擇。\n\n"
			.."(6) 從納迦怪物身上收集用過的虚空核心，以及\n從一個隨機出現的暗影身影身上收集暗影之塵，\n這個暗影身影會從任何給你經驗值的怪物身上隨機出現。\n\n(7) 返回諾莫瑞根的齊莉處領取你的獎勵"
ns.gnomereganTitle = "諾莫瑞根裝備指南"
ns.nightmare = "(1) 50 級時，進入灰谷的翡翠夢境传送门。向南走到戰歌伐木場的後面。\n"
			.."繼續前進，直到你收到“麻痺恐懼光環減益”。\n"
			.."退出梦境，并与戰地指揮官漢娜拉交谈以进行第一个任务。\n\n"
			.."(2) 與月光林地的洛加納爾交談。他会直接送你去悲伤沼泽西南角的伊薩裡烏斯那里。\n\n"
			.."(3) 在阿塔哈卡神廟/沉沒的神廟中，你必须至少前进到選民居所。\n"
			.."'潛入'現在將會被滿足。稍後返回伊薩裡烏斯那里。\n\n"
			.."(4) 你現在被送回月光林地的洛加納爾那里。\n"
			.."交任務並等待暗影身影出現。\n"
			.."與她交談并接取下一個任务，以及再下一個任务。\n\n"
			.."(5) 下一站是荊棘谷的藏寶海灣。\n"
			.."一個受傷的地精会派你去找哈圭洛岛上的一个小個子魚人。\n"
			.."他旁边是一个小洞穴。\n"
			.."找回護腕，然后前往月光林地。\n\n"
			.."(6) 暗影身影有一個新的任务給你。\n"
			.."返回灰谷，在进入梦境之前装备護腕。\n"
			.."請注意，她已经改變了它们！\n"
			.."前往你之前“減益”的位置。\n"
			.."一个夢魘融合怪正在該地區巡逻。\n"
			.."杀死它，但你需要一个 5 人小隊。\n"
			.."它會掉落紫色品質的夢魘護肩！！！\n\n"
			.."(7) 回到暗影身影那里。她現在是你获取第三阶段装备的首选！"   
ns.nightmareTitle = "夢魘装备指南"
ns.twoMeditate = "17 級時，前往暴風城的公園（人類/\n矮人）、達納蘇斯的月神殿（暗夜精靈）、\n"
			.."幽暗城的戰爭區（所有部落），從牧師訓練師那里接取一個種族\n任務。\n\n"
			.."最終，你將能夠在不同種族（以及陣營，這是 Bug 嗎？）之間共享多個冥想\n增益。\n\n"
			.."玩家 1：/kneel；玩家 2：/pray"
ns.twoMeditateTitle = "牧師雙冥想"
ns.voidTouchedTitle = "虚空之触装备指南"
ns.voidTouched = "(1) 鍛造、制皮或裁縫其中一項技能達到 25 級和 100 級。\n\n"
			.."(2) 從拍賣行購買一瓶混合悔恨藥劑。\n煉金術士可以從塔倫米爾和南海鎮之間路上的齊希爾，\n以及赤脊山/艾爾文森林通往夜色鎮的路上，\n從克奇克斯那里購買到這個配方。\n\n"
			.."(3) 在灰谷的佐拉姆海岸找到死去的暮光教徒。\n喝下藥劑並與他交談。\n\n"
			.."(4) 在黑暗深淵，擊敗第二個 Boss，加摩拉。\n與老塞拉基斯的屍體互動。\n\n"
			.."(5) 在棘齒城，從諾拉·安妮希尔特那里接受任务。\n需要 40 個奇异之尘、5 個強效奥术精华、2 個微光碎片、\n"
			.."一把變換鱗片和 5 金幣。\n"
			.."鱗片由老塞拉基斯掉落。\n"
			.."其他東西可以从拍賣行購買。\n\n"
			.."(6) 带着她的護身符奖励，返回黑暗深淵，前往凯尔里斯的\n水下洞穴。\n"
			.."拾取工匠的宝箱。“盒子”會神奇地出现在你的背包里。\n\n(7) 前往奧特蘭克山脈。\n"
			.."使用柱子摧毁盒子。\n\n"
			.."(8) 一个暗影身影會出現。\n"
			.."與其互動。\n"
			.."你必須選擇\n“好吧，讓我看看”選項。\n\n"
			.."(9) 恭喜。\n"
			.."你現在拥有了所有第一阶段的配方。\n"
			.."很可能是当前版本的最佳裝備！\n\n"
			.."(重複(6)的操作可以获得另一个碎片)"


-- Icons:	1 -3 	Chest
--			4		Void-Touched
--			5		Best Pets
--			6		Cozy Sleeping Bag
--			7		Fel Portals
--			8		Priest L17/18 Dual Meditation
--			9		Gnomeregan Gear
--			10		Nightmare Gear
--			11		Nightmare Bloom / Seed


--=======================================================================================================
--
-- EASTERN KINGDOMS
--
--=======================================================================================================

points[ 1416 ] = { -- 奧特蘭克山脈
	[31007260] = { npc=14222, name="阿拉加", title="最佳獵人寵物", icon=5, class="HUNTER", guide=ns.bestPet },
	[31408480] = { npc=14222, name="阿拉加", title="最佳獵人寵物", icon=5, class="HUNTER", guide=ns.bestPet, continent=true },
	[38808980] = { npc=14222, name="阿拉加", title="最佳獵人寵物", icon=5, class="HUNTER", guide=ns.bestPet },
}

points[ 1417 ] = { -- 阿拉希高地
	[22502420] = { name="匆忙捲起的釘板", title="舒適睡袋", icon=6, guide=ns.cozySleepingBag,				
					quest={ ( ( ns.faction == "Alliance" ) and 79008 or 79007 ), 79192, 79980, 79974, 79975, 79976 }, 
					questName={ "...還有你找到的那張紙條", "踏腳石", "翻找", "濕活", "鷹爪",
						"就是這裡了" }, continent=true,
						tip="第六步。請參閱希爾斯布萊德丘陵地圖\n以了解從哪裡開始此步驟" },
}

points[ 1418 ] = { -- 荒蕪之地
	[45203520] = { npc=2850, name="斷齒", title="最佳獵人寵物", icon=5, class="HUNTER", guide=ns.bestPet },
	[54801480] = { npc=2850, name="斷齒", title="最佳獵人寵物", icon=5, class="HUNTER", guide=ns.bestPet, continent=true },
	[63003020] = { npc=2850, name="斷齒", title="最佳獵人寵物", icon=5, class="HUNTER", guide=ns.bestPet },
}

points[ 1419 ] = { -- 詛咒之地
	[35005480] = { name="惡魔之痕", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[41303350] = { name="惡魔之痕", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[43602530] = { name="惡魔之痕", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[46603910] = { name="惡魔之痕", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[48804830] = { name="惡魔之痕", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[56203660] = { name="惡魔之痕", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[60204640] = { name="惡魔之痕", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[62003920] = { name="惡魔之痕", title="惡魔傳送門", icon=7, tip=ns.felPortals, continent=true },
}

points[ 1430 ] = { -- 暮色森林
}

points[ 1426 ] = { -- 丹莫洛
	[21705200] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[23105200] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[23305420] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[23505240] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[26005120] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[26104120] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[26803640] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[34005110] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[36104010] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[38704330] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[39204650] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[40104810] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[41004890] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[41504440] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[42003590] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[42804710] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[43504920] = { title="破損的箱子", icon=1, tip=ns.chest1, continent=true },
	[66905960] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[67506070] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[68905940] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[71005900] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[71205050] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[71605180] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[72104990] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[73005350] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[74606170] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[74805650] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[76005810] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[77906190] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[79305870] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[79705470] = { title="破損的箱子", icon=1, tip=ns.chest1 },
}

points[ 1431 ] = { -- 暮色森林
	[18002560] = { title=ns.twoMeditateTitle, name="恐狼（多種）", icon=8, class="PRIEST", level=17, guide=ns.twoMeditate,
					tip="從這些怪物身上收集爪子。用於第一個任務", faction="Alliance",
					quest={ ( ( ( ns.race == "Dwarf" ) or ( ns.race == "Human" ) ) and 78194 or 0 ), 
							( ( ( ns.race == "Dwarf" ) or ( ns.race == "Human" ) ) and 78195 or 0 ) },
					questName={ ( ( ( ns.race == "Dwarf" ) or ( ns.race == "Human" ) ) and "伊露恩的秘密 (1)" or "" ), 
							( ( ( ns.race == "Dwarf" ) or ( ns.race == "Human" ) ) and "伊露恩的秘密 (2)" or "" ) } },
	[37602240] = { title=ns.twoMeditateTitle, name="恐狼（多種）", icon=8, class="PRIEST", level=17, guide=ns.twoMeditate,
					tip="從這些怪物身上收集爪子。用於第一個任務", faction="Alliance",
					quest={ ( ( ( ns.race == "Dwarf" ) or ( ns.race == "Human" ) ) and 78194 or 0 ), 
							( ( ( ns.race == "Dwarf" ) or ( ns.race == "Human" ) ) and 78195 or 0 ) },
					questName={ ( ( ( ns.race == "Dwarf" ) or ( ns.race == "Human" ) ) and "伊露恩的秘密 (1)" or "" ), 
							( ( ( ns.race == "Dwarf" ) or ( ns.race == "Human" ) ) and "伊露恩的秘密 (2)" or "" ) } },
	[55406160] = { title=ns.twoMeditateTitle, name="恐狼（多種）", icon=8, class="PRIEST", level=17, guide=ns.twoMeditate,
					tip="從這些怪物身上收集爪子。用於第一個任務", faction="Alliance", continent=true,
					quest={ ( ( ( ns.race == "Dwarf" ) or ( ns.race == "Human" ) ) and 78194 or 0 ), 
							( ( ( ns.race == "Dwarf" ) or ( ns.race == "Human" ) ) and 78195 or 0 ) },
					questName={ ( ( ( ns.race == "Dwarf" ) or ( ns.race == "Human" ) ) and "伊露恩的秘密 (1)" or "" ), 
							( ( ( ns.race == "Dwarf" ) or ( ns.race == "Human" ) ) and "伊露恩的秘密 (2)" or "" ) } },
	[59001960] = { title=ns.twoMeditateTitle, name="恐狼（多種）", icon=8, class="PRIEST", level=17, guide=ns.twoMeditate,
					tip="從這些怪物身上收集爪子。用於第一個任務", faction="Alliance",
					quest={ ( ( ( ns.race == "Dwarf" ) or ( ns.race == "Human" ) ) and 78194 or 0 ), 
							( ( ( ns.race == "Dwarf" ) or ( ns.race == "Human" ) ) and 78195 or 0 ) },
					questName={ ( ( ( ns.race == "Dwarf" ) or ( ns.race == "Human" ) ) and "伊露恩的秘密 (1)" or "" ), 
							( ( ( ns.race == "Dwarf" ) or ( ns.race == "Human" ) ) and "伊露恩的秘密 (2)" or "" ) } },
	[68203400] = { title=ns.twoMeditateTitle, name="恐狼（多種）", icon=8, class="PRIEST", level=17, guide=ns.twoMeditate,
					tip="從這些怪物身上收集爪子。用於第一個任務", faction="Alliance",
					quest={ ( ( ( ns.race == "Dwarf" ) or ( ns.race == "Human" ) ) and 78194 or 0 ), 
							( ( ( ns.race == "Dwarf" ) or ( ns.race == "Human" ) ) and 78195 or 0 ) },
					questName={ ( ( ( ns.race == "Dwarf" ) or ( ns.race == "Human" ) ) and "伊露恩的秘密 (1)" or "" ), 
							( ( ( ns.race == "Dwarf" ) or ( ns.race == "Human" ) ) and "伊露恩的秘密 (2)" or "" ) } },

	[81801980] = { npc=3134, name="克奇克斯", title=ns.voidTouchedTitle, icon=4, guide=ns.voidTouched,
					tip="煉金術士可以購買混合\n悔恨藥劑配方",
					quest={ 78909 }, questName={ "變換鱗片護符" }, continent=true },
}

points[ 1429 ] = { -- 艾爾文森林
	[12463405] = { title=ns.twoMeditateTitle, npc=11397, name="娜拉·梅德羅斯", icon=8, class="PRIEST", level=17, 
					guide=ns.twoMeditate, tip="從這裡開始", faction="Alliance",
					quest={ ( ( ( ns.race == "Dwarf" ) or ( ns.race == "Human" ) ) and 78194 or 0 ), 
							( ( ( ns.race == "Dwarf" ) or ( ns.race == "Human" ) ) and 78195 or 0 ) },
					questName={ ( ( ( ns.race == "Dwarf" ) or ( ns.race == "Human" ) ) and "伊露恩的秘密 (1)" or "" ), 
							( ( ( ns.race == "Dwarf" ) or ( ns.race == "Human" ) ) and "伊露恩的秘密 (2)" or "" ) } },
	[19392475] = { title=ns.twoMeditateTitle, npc=376, name="大祭司勞雷娜", icon=8, class="PRIEST", level=17, 
					guide=ns.twoMeditate, tip="在這裡完成第二個任務。始終保持 /kneel！", faction="Alliance",
					quest={ ( ( ns.race == "Night elf" ) and 78192 or 0 ), ( ( ns.race=="Night elf") and 78193 or 0 ) }, 
					questName={ ( ( ns.race == "Night elf" ) and "聖光的秘密 (1)" or "" ), 
							( ( ns.race == "Night Elf") and "聖光的秘密 (2)" or "" ) }, continent=true, },

	[23805890] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[24409350] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[26049211] = { title="破損的箱子", icon=1, tip=ns.chest1 }, -- V
	[27808840] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[30806480] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[36206580] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[37908330] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[38208200] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[40307750] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[40807760] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[41605280] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[41807800] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[41808150] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[47608647] = { title="破損的箱子", icon=1, tip=ns.chest1 }, -- V
	[48008710] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[48608790] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[52505900] = { title="破損的箱子", icon=1, tip=ns.chest1, continent=true },
	[54306670] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[55606700] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[56706680] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[61004910] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[61304970] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[61704680] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[62204800] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[64805730] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[65004130] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[65005630] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[66104070] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[68404460] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[69903880] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[71107770] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[71108040] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[71507670] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[74005000] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[75508520] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[76508650] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[77308520] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[78205750] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[79305710] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[79405450] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[79505710] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[79705530] = { title="破損的箱子", icon=1, tip=ns.chest1 },
}

points[ 1424 ] = { -- 希爾斯布萊德丘陵
	[33003600] = { title=ns.twoMeditateTitle, name="希爾斯布萊德怪物（多種）", icon=8, class="PRIEST", level=18,
					faction="Horde", guide=ns.twoMeditate, continent=true,
					quest={ ( ( ns.race == "Undead" ) and 78198 or 0 ), ( ( ns.race == "Undead" ) and 78199 or 0 ) }, 
					questName={ ( ( ns.race == "Undead" ) and "洛阿的秘密 (1)" or "" ), 
							( ( ns.race == "Undead" ) and "洛阿的秘密 (2)" or "" ) } },
	[35204700] = { title=ns.twoMeditateTitle, name="希爾斯布萊德怪物（多種）", icon=8, class="PRIEST", level=18,
					faction="Horde", guide=ns.twoMeditate,
					quest={ ( ( ns.race == "Undead" ) and 78198 or 0 ), ( ( ns.race == "Undead" ) and 78199 or 0 ) }, 
					questName={ ( ( ns.race == "Undead" ) and "洛阿的秘密 (1)" or "" ), 
							( ( ns.race == "Undead" ) and "洛阿的秘密 (2)" or "" ) } },

	[50514971] = { npc=3537, name="齊希爾", title=ns.voidTouchedTitle, icon=4, guide=ns.voidTouched,
					tip="煉金術士可以購買混合\n悔恨藥劑配方",
					quest={ 78909 }, questName={ "變換鱗片護符" } },
	[52714131] = { npc=3537, name="齊希爾", title=ns.voidTouchedTitle, icon=4, guide=ns.voidTouched,
					tip="煉金術士可以購買混合\n悔恨藥劑配方",
					quest={ 78909 }, questName={ "變換鱗片護符" } },
	[55511881] = { npc=3537, name="齊希爾", title=ns.voidTouchedTitle, icon=4, guide=ns.voidTouched,
					tip="煉金術士可以購買混合\n悔恨藥劑配方",
					quest={ 78909 }, questName={ "變換鱗片護符" } },
	[55612661] = { npc=3537, name="齊希爾", title=ns.voidTouchedTitle, icon=4, guide=ns.voidTouched,
					tip="煉金術士可以購買混合\n悔恨藥劑配方",
					quest={ 78909 }, questName={ "變換鱗片護符" }, continent=true },
	[55613461] = { npc=3537, name="齊希爾", title=ns.voidTouchedTitle, icon=4, guide=ns.voidTouched,
					tip="煉金術士可以購買混合\n悔恨藥劑配方",
					quest={ 78909 }, questName={ "變換鱗片護符" } },
	[60712021] = { npc=3537, name="齊希爾", title=ns.voidTouchedTitle, icon=4, guide=ns.voidTouched,
					tip="煉金術士可以購買混合\n悔恨藥劑配方",
					quest={ 78909 }, questName={ "變換鱗片護符" } },
	[88557351] = { name="暗影身影 / 純淨之光碎片", title=ns.voidTouchedTitle, icon=4, guide=ns.voidTouched,
					tip="途徑鴉巢莊園" },

	[87304960] = { name="破舊的推車", title="舒適睡袋", icon=6, guide=ns.cozySleepingBag,				
					quest={ ( ( ns.faction == "Alliance" ) and 79008 or 79007 ), 79192, 79980, 79974, 79975, 79976 }, 
					questName={ "...還有你找到的那張紙條", "踏腳石", "翻找", "濕活", "鷹爪",
						"就是這裡了" }, continent=true,
						tip="第六步。從這裡開始第六步，\n而不是從阿拉希高地那一側" },
}

points[ 1455 ] = { -- 鐵爐堡
}

points[ 1432 ] = { -- 洛克莫丹
	[24803070] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[26004930] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[26504420] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[26905760] = { title="破損的箱子", icon=2, tip=ns.chest2, continent=true },
	[27908330] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[28308740] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[31507550] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[34402710] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[34509000] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[34609110] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[34908250] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[35102680] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[35602480] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[35701650] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[35909370] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[36008460] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[36302350] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[37608650] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[37701610] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[39801240] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[48002090] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[49002970] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[54502600] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[48103950] = { title="破損的箱子", icon=3, tip=ns.chest3, continent=true },
	[59201360] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[68006590] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[68301860] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[68806250] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[69302280] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[69806630] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[73306440] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[75502500] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[77001440] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[77701840] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[79501610] = { title="破損的箱子", icon=3, tip=ns.chest3 },

	[49501280] = { name="雕刻小雕像", title="舒適睡袋", icon=6, guide=ns.cozySleepingBag,				
					quest={ ( ( ns.faction == "Alliance" ) and 79008 or 79007 ), 79192, 79980, 79974, 79975, 79976 }, 
					questName={ "...還有你找到的那張紙條", "踏腳石", "翻找", "濕活", "鷹爪",
						"就是這裡了" }, tip="第五步", continent=true },
}

points[ 1433 ] = { -- 赤脊山脈
	[14506170] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[14906430] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[17106360] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[17201800] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[19802150] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[20501390] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[21103620] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[21701930] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[23402700] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[27302140] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[27902850] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[28008400] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[28202840] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[29608450] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[32308300] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[34102570] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[39003180] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[43807090] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[47407060] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[52304670] = { title="破損的箱子", icon=3, tip=ns.chest3, continent=true },
	[56005740] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[14506170] = { title="破損的箱子", icon=3, tip=ns.chest3 },

	[29803040] = { name="惡魔裂隙", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[30802180] = { name="惡魔裂隙", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[42801680] = { name="惡魔裂隙", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[71408350] = { name="惡魔裂隙", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[71605830] = { name="惡魔裂隙", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[79003350] = { name="惡魔裂隙", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[79603280] = { name="惡魔裂隙", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[79007300] = { name="惡魔裂隙", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[81606060] = { name="惡魔裂隙", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[83104450] = { name="惡魔裂隙", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[83204560] = { name="惡魔裂隙", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[86305250] = { name="惡魔裂隙", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[86605300] = { name="惡魔裂隙", title="惡魔傳送門", icon=7, tip=ns.felPortals, continent=true },
}

points[ 1421 ] = { -- 銀松森林
	[36502930] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[43502250] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[43503170] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[44107170] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[44702050] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[44902350] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[45307500] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[45405420] = { title="破損的箱子", icon=2, tip=ns.chest2, continent=true  },
	[46007150] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[46305480] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[47207380] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[47705550] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[48302450] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[55801960] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[56202760] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[59101810] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[59901750] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[60801630] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[64801210] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[66301300] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[64504970] = { title="破損的箱子", icon=3, tip=ns.chest3, continent=true },
	[65004200] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[65202320] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[65802340] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[66804550] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[67502540] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[67802420] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[77603100] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[80202850] = { title="破損的箱子", icon=3, tip=ns.chest3 },

	[38801840] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals, continent=true },
	[38802340] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[44202520] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[44602550] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[45503180] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[49801340] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[50205680] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[50206520] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[54403580] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[55602460] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[60800700] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
}

points[ 1453 ] = { -- 暴風城
	[20685007] = { title=ns.twoMeditateTitle, npc=11397, name="娜拉·梅德羅斯", icon=8, class="PRIEST", level=17, 
					guide=ns.twoMeditate, tip="從這裡開始", faction="Alliance", continent=true,
					quest={ ( ( ( ns.race == "Dwarf" ) or ( ns.race == "Human" ) ) and 78194 or 0 ), 
							( ( ( ns.race == "Dwarf" ) or ( ns.race == "Human" ) ) and 78195 or 0 ) },
					questName={ ( ( ( ns.race == "Dwarf" ) or ( ns.race == "Human" ) ) and "伊露恩的秘密 (1)" or "" ), 
							( ( ( ns.race == "Dwarf" ) or ( ns.race == "Human" ) ) and "伊露恩的秘密 (2)" or "" ) } },
	[38582606] = { title=ns.twoMeditateTitle, npc=376, name="大祭司勞雷娜", icon=8, class="PRIEST", level=17,
					guide=ns.twoMeditate, tip="在這裡完成第二個任務。始終保持 /kneel！", faction="Alliance",
					quest={ ( ( ns.race == "Night elf" ) and 78192 or 0 ), ( ( ns.race=="Night elf") and 78193 or 0 ) }, 
					questName={ ( ( ns.race == "Night elf" ) and "聖光的秘密 (1)" or "" ), 
							( ( ns.race == "Night Elf") and "聖光的秘密 (2)" or "" ) } },
}

points[ 1434 ] = { -- 荊棘谷
	[38603560] = { npc=731, name="班加拉什國王", title="最佳獵人寵物", icon=5, class="HUNTER", guide=ns.bestPet, continent=true },
	[47602880] = { npc=728, name="巴格希拉", title="最佳獵人寵物", icon=5, class="HUNTER", guide=ns.bestPet },
	[49002060] = { npc=728, name="巴格希拉", title="最佳獵人寵物", icon=5, class="HUNTER", guide=ns.bestPet },
	[49802460] = { npc=728, name="巴格希拉", title="最佳獵人寵物", icon=5, class="HUNTER", guide=ns.bestPet },

	[27507740] = { title=ns.gnomereganTitle, npc=7853, name="斯庫提", icon=9, guide=ns.gnomeregan,
					quest={ 79626, 79705, 79981, 79984, 79982 }, continent=true,
					questName={ "回收機器 9000！", "搶救回收機器", "腐蝕的核心",
						"四邊測量", "保修索賠" }, },

	[26807720] = { npc=222444, name="受傷的地精", title=ns.nightmareTitle, icon=10,
					guide=ns.nightmare, tip="鹹水手酒館的中層",
					quest= { 82017, 82018, 82019, 82020, 82021, 82022, 82023, 81986 },
					questName = { "夢魘融合怪", "伊薩裡烏斯", "潛入",
						"返回月光林地", "峰迴路轉", "壞消息...",
						"遺失的護腕", "喚醒夢魘" }, },
	[40808560] = { npc=222451, name="小個子魚人", title=ns.nightmareTitle, icon=10,
					guide=ns.nightmare, continent=true,
					quest= { 82017, 82018, 82019, 82020, 82021, 82022, 82023, 81986 },
					questName = { "夢魘融合怪", "伊薩裡烏斯", "潛入",
						"返回月光林地", "峰迴路轉", "壞消息...",
						"遺失的護腕", "喚醒夢魘" }, },
}

points[ 1435 ] = { -- 悲伤沼泽
	[10506030] = { name="惡魔之淚", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[12302960] = { name="惡魔之淚", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[16606330] = { name="惡魔之淚", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[22806430] = { name="惡魔之淚", title="惡魔傳送門", icon=7, tip=ns.felPortals, continent=true },
	[27004930] = { name="惡魔之淚", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[34402840] = { name="惡魔之淚", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[36405030] = { name="惡魔之淚", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[49603840] = { name="惡魔之淚", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[56606540] = { name="惡魔之淚", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[60402770] = { name="惡魔之淚", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[60904370] = { name="惡魔之淚", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[69607840] = { name="惡魔之淚", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[72501070] = { name="惡魔之淚", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[77308960] = { name="惡魔之淚", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[81303430] = { name="惡魔之淚", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[83406650] = { name="惡魔之淚", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[87202630] = { name="惡魔之淚", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[90906540] = { name="惡魔之淚", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[91405670] = { name="惡魔之淚", title="惡魔傳送門", icon=7, tip=ns.felPortals },

	[13607150] = { npc=5353, name="伊薩裡烏斯", title=ns.nightmareTitle, icon=10,
					guide=ns.nightmare, continent=true,
					quest= { 82017, 82018, 82019, 82020, 82021, 82022, 82023, 81986 },
					questName = { "夢魘融合怪", "伊薩裡烏斯", "潛入",
						"返回月光林地", "峰迴路轉", "壞消息...",
						"遺失的護腕", "喚醒夢魘" }, },
}

points[ 1420 ] = { -- 提瑞斯法林地
	[25304870] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[31704610] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[34704100] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[38004970] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[49203360] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[49603570] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[49804280] = { title="破損的箱子", icon=1, tip=ns.chest1, continent=true },
	[51006750] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[51802600] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[55504210] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[57903290] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[58703070] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[58802700] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[72802580] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[77205980] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[78405590] = { title="破損的箱子", icon=1, tip=ns.chest1 },

	[56204940] = { title=ns.twoMeditateTitle, npc=6491, name="靈魂治療師（布瑞爾）", icon=8, class="PRIEST", faction="Horde",
					level=18, guide=ns.twoMeditate, tip="來這裡完成第二個任務。/kneel",
					quest={ ( ( ns.race == "Troll" ) and 78196 or 0 ), ( ( ns.race == "Troll" ) and 78197 or 0 ) }, 
					questName={ ( ( ns.race == "Troll" ) and "亡靈的秘密 (1)" or "" ), 
							( ( ns.race == "Troll" ) and "亡靈的秘密 (2)" or "" ) }, continent=true, },							

}

points[ 1458 ] = { -- 幽暗城
	[47201960] = { title=ns.twoMeditateTitle, npc=211225, name="巴iju拉", icon=8, class="PRIEST", level=18,
					faction="Horde", guide=ns.twoMeditate, tip="在這裡開始第一個任務", continent=true,
					quest={ ( ( ns.race == "Undead" ) and 78198 or 0 ), ( ( ns.race == "Undead" ) and 78199 or 0 ) }, 
					questName={ ( ( ns.race == "Undead" ) and "洛阿的秘密 (1)" or "" ), 
							( ( ns.race == "Undead" ) and "洛阿的秘密 (2)" or "" ) } },
}

points[ 1422 ] = { -- 西瘟疫之地
}

points[ 1436 ] = { -- 西部荒野
	[29104880] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[29204590] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[29304960] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[29704730] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[30904620] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[31004410] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[33205650] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[36403190] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[38202860] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[38806980] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[41504100] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[42306880] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[42701220] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[43000800] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[43906830] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[44102350] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[44507020] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[44702550] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[44900760] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[45002190] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[45502090] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[45507030] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[45901910] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[46103850] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[46805340] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[48204710] = { title="破損的箱子", icon=2, tip=ns.chest2, continent=true },
	[48302030] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[48506090] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[51103900] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[52503450] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[53106250] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[55600770] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[56501340] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[56501920] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[60605830] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[60905020] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[34808570] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[36808280] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[53007890] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[56307450] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[56506990] = { title="破損的箱子", icon=3, tip=ns.chest3, continent=true },
	[60707440] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[63807030] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[65307510] = { title="破損的箱子", icon=3, tip=ns.chest3 },

	[37505070] = { name="燒毀的殘骸", title="舒適睡袋", icon=6, guide=ns.cozySleepingBag,
					quest={ ( ( ns.faction == "Alliance" ) and 79008 or 79007 ), 79192, 79980, 79974, 79975, 79976 }, 
					questName={ "...還有你找到的那張紙條", "踏腳石", "翻找", "濕活", "鷹爪",
						"就是這裡了" },
						tip="聯盟：第一步\n部落：第二步", continent=true },
						
	[28604400] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[28904750] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[29005850] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[29606940] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[29803440] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[31403940] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[31506540] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[31603920] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[32207600] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[32208020] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[32402920] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals, continent=true },
	[34008220] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[34806140] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[35803260] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[37508530] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[41501530] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[44804640] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[46801240] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[46903950] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[47502170] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[47506750] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[47507930] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[47801380] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[51003240] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[51607150] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[53008020] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[57001050] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[62502630] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
}

points[ 1437 ] = { -- 濕地
	[72009400] = { name="雕刻小雕像", title="舒適睡袋", icon=6, guide=ns.cozySleepingBag,				
					quest={ ( ( ns.faction == "Alliance" ) and 79008 or 79007 ), 79192, 79980, 79974, 79975, 79976 }, 
					questName={ "...還有你找到的那張紙條", "踏腳石", "翻找", "濕活", "鷹爪",
						"就是這裡了" }, tip="第五步", continent=true },
}

--=======================================================================================================
--
-- KALIMDOR
--
--=======================================================================================================

points[ 1440 ] = { -- 灰谷
	[07101230] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[10402260] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[11102690] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[11603180] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[14202040] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[18503160] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[22403630] = { title="破損的箱子", icon=3, tip=ns.chest3, continent=true },
	[31902320] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[31903120] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	
	[17202660] = { npc=212334, name="死去的暮光教徒", title=ns.voidTouchedTitle, icon=4, guide=ns.voidTouched,
					quest={ 78909 }, questName={ "變換鱗片護符" }, continent=true },
	[86006700] = { name=ns.L["AoPD"], title=ns.nightmareTitle, icon=10, guide=ns.nightmare,
					tip="這是進入夢魘後獲得減益的\n"
						.."大概位置", continent=true,
					quest= { 82017, 82018, 82019, 82020, 82021, 82022, 82023, 81986 },
					questName = { "夢魘融合怪", "伊薩裡烏斯", "潛入",
						"返回月光林地", "峰迴路轉", "壞消息...",
						"遺失的護腕", "喚醒夢魘" }, },
	[89404060] = { npc=221477, name="戰地指揮官漢娜拉", title=ns.nightmareTitle, icon=10,
					guide=ns.nightmare,
					tip="她位於“普通”\n灰谷，在夢魘之外。\n\n"
						.."圖釘也被符文插件使用，所以一個\n圖釘可能會與另一個圖釘大部分重疊",
					quest= { 82017, 82018, 82019, 82020, 82021, 82022, 82023, 81986 },
					questName = { "夢魘融合怪", "伊薩裡烏斯", "潛入",
						"返回月光林地", "峰迴路轉", "壞消息...",
						"遺失的護腕", "喚醒夢魘" }, },

	[24406340] = { name="惡魔裂隙", title="惡魔傳送門", icon=7, tip=ns.felPortals, continent=true },
	[27606260] = { name="惡魔裂隙", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[30203020] = { name="惡魔裂隙", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[33502840] = { name="惡魔裂隙", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[44506420] = { name="惡魔裂隙", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[51204700] = { name="惡魔裂隙", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[52506280] = { name="惡魔裂隙", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[55504020] = { name="惡魔裂隙", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[67004600] = { name="惡魔裂隙", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[67205100] = { name="惡魔裂隙", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[77407300] = { name="惡魔裂隙", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[80507080] = { name="惡魔裂隙", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[84807020] = { name="惡魔裂隙", title="惡魔傳送門", icon=7, tip=ns.felPortals },

	[31602300] = { title=ns.twoMeditateTitle, name="被遺忘者怪物（多種）", icon=8, class="PRIEST", level=18,
					guide=ns.twoMeditate,
					quest={ ( ( ns.race == "Night elf" ) and 78192 or 0 ), ( ( ns.race == "Night elf" ) and 78193 or 0 ) }, 
					questName={ ( ( ns.race == "Night elf" ) and "聖光的秘密 (1)" or "" ), 
							( ( ns.race == "Night Elf" ) and "聖光的秘密 (2)" or "" ) } },
	[33406820] = { title=ns.twoMeditateTitle, name="暗影灌木怪物（多種）", icon=8, class="PRIEST", faction="Horde",
					level=18, guide=ns.twoMeditate, tip="從怪物身上收集暗影葉", continent=true,
					quest={ ( ( ns.race == "Troll" ) and 78196 or 0 ), ( ( ns.race == "Troll" ) and 78197 or 0 ) }, 
					questName={ ( ( ns.race == "Troll" ) and "亡靈的秘密 (1)" or "" ), 
							( ( ns.race == "Troll" ) and "亡靈的秘密 (2)" or "" ) } },							
	[61007620] = { title=ns.twoMeditateTitle, name="暗影灌木怪物（多種）", icon=8, class="PRIEST", faction="Horde",
					level=18, guide=ns.twoMeditate, tip="從怪物身上收集暗影葉",
					quest={ ( ( ns.race == "Troll" ) and 78196 or 0 ), ( ( ns.race == "Troll" ) and 78197 or 0 ) }, 
					questName={ ( ( ns.race == "Troll" ) and "亡靈的秘密 (1)" or "" ), 
							( ( ns.race == "Troll" ) and "亡靈的秘密 (2)" or "" ) } },									
	[64206840] = { title=ns.twoMeditateTitle, name="暗影灌木怪物（多種）", icon=8, class="PRIEST", faction="Horde",
					level=18, guide=ns.twoMeditate, tip="從怪物身上收集暗影葉",
					quest={ ( ( ns.race == "Troll" ) and 78196 or 0 ), ( ( ns.race == "Troll" ) and 78197 or 0 ) }, 
					questName={ ( ( ns.race == "Troll" ) and "亡靈的秘密 (1)" or "" ), 
							( ( ns.race == "Troll" ) and "亡靈的秘密 (2)" or "" ) } },							
	[67208280] = { title=ns.twoMeditateTitle, name="暗影灌木怪物（多種）", icon=8, class="PRIEST", faction="Horde",
					level=18, guide=ns.twoMeditate, tip="從怪物身上收集暗影葉",
					quest={ ( ( ns.race == "Troll" ) and 78196 or 0 ), ( ( ns.race == "Troll" ) and 78197 or 0 ) }, 
					questName={ ( ( ns.race == "Troll" ) and "亡靈的秘密 (1)" or "" ), 
							( ( ns.race == "Troll" ) and "亡靈的秘密 (2)" or "" ) } },							
	[71405400] = { title=ns.twoMeditateTitle, name="暗影灌木怪物（多種）", icon=8, class="PRIEST", faction="Horde",
					level=18, guide=ns.twoMeditate, tip="從怪物身上收集暗影葉",
					quest={ ( ( ns.race == "Troll" ) and 78196 or 0 ), ( ( ns.race == "Troll" ) and 78197 or 0 ) }, 
					questName={ ( ( ns.race == "Troll" ) and "亡靈的秘密 (1)" or "" ), 
							( ( ns.race == "Troll" ) and "亡靈的秘密 (2)" or "" ) } },
	[76604520] = { title=ns.twoMeditateTitle, name="暗影灌木怪物（多種）", icon=8, class="PRIEST", faction="Horde",
					level=18, guide=ns.twoMeditate, tip="從怪物身上收集暗影葉",
					quest={ ( ( ns.race == "Troll" ) and 78196 or 0 ), ( ( ns.race == "Troll" ) and 78197 or 0 ) }, 
					questName={ ( ( ns.race == "Troll" ) and "亡靈的秘密 (1)" or "" ), 
							( ( ns.race == "Troll" ) and "亡靈的秘密 (2)" or "" ) } },
	[79007360] = { title=ns.twoMeditateTitle, name="暗影灌木怪物（多種）", icon=8, class="PRIEST", faction="Horde",
					level=18, guide=ns.twoMeditate, tip="從怪物身上收集暗影葉",
					quest={ ( ( ns.race == "Troll" ) and 78196 or 0 ), ( ( ns.race == "Troll" ) and 78197 or 0 ) }, 
					questName={ ( ( ns.race == "Troll" ) and "亡靈的秘密 (1)" or "" ), 
							( ( ns.race == "Troll" ) and "亡靈的秘密 (2)" or "" ) } },
	[79406200] = { title=ns.twoMeditateTitle, name="暗影灌木怪物（多種）", icon=8, class="PRIEST", faction="Horde",
					level=18, guide=ns.twoMeditate, tip="從怪物身上收集暗影葉",
					quest={ ( ( ns.race == "Troll" ) and 78196 or 0 ), ( ( ns.race == "Troll" ) and 78197 or 0 ) }, 
					questName={ ( ( ns.race == "Troll" ) and "亡靈的秘密 (1)" or "" ), 
							( ( ns.race == "Troll" ) and "亡靈的秘密 (2)" or "" ) } },
	[85406640] = { title=ns.twoMeditateTitle, name="暗影灌木怪物（多種）", icon=8, class="PRIEST", faction="Horde",
					level=18, guide=ns.twoMeditate, tip="從怪物身上收集暗影葉",
					quest={ ( ( ns.race == "Troll" ) and 78196 or 0 ), ( ( ns.race == "Troll" ) and 78197 or 0 ) }, 
					questName={ ( ( ns.race == "Troll" ) and "亡靈的秘密 (1)" or "" ), 
							( ( ns.race == "Troll" ) and "亡靈的秘密 (2)" or "" ) } },

	[80105000] = { name="共鳴的夢魘之花", title="夢魘種子", icon=11, tip=ns.nightmareSeed, continent=true },
	[82106510] = { name="共鳴的夢魘之花", title="夢魘種子", icon=11, tip=ns.nightmareSeed },
	[82905170] = { name="共鳴的夢魘之花", title="夢魘種子", icon=11, tip=ns.nightmareSeed },
	[84506070] = { name="共鳴的夢魘之花", title="夢魘種子", icon=11, tip=ns.nightmareSeed },
	[85805090] = { name="共鳴的夢魘之花", title="夢魘種子", icon=11, tip=ns.nightmareSeed },
	[86106570] = { name="共鳴的夢魘之花", title="夢魘種子", icon=11, tip=ns.nightmareSeed },
	[87304630] = { name="共鳴的夢魘之花", title="夢魘種子", icon=11, tip=ns.nightmareSeed },
	[88504300] = { name="共鳴的夢魘之花", title="夢魘種子", icon=11, tip=ns.nightmareSeed },
	[88904610] = { name="共鳴的夢魘之花", title="夢魘種子", icon=11, tip=ns.nightmareSeed },
	[90104950] = { name="共鳴的夢魘之花", title="夢魘種子", icon=11, tip=ns.nightmareSeed },
	[90805240] = { name="共鳴的夢魘之花", title="夢魘種子", icon=11, tip=ns.nightmareSeed },
	[91005680] = { name="共鳴的夢魘之花", title="夢魘種子", icon=11, tip=ns.nightmareSeed },
	[91404970] = { name="共鳴的夢魘之花", title="夢魘種子", icon=11, tip=ns.nightmareSeed },
	[93205130] = { name="共鳴的夢魘之花", title="夢魘種子", icon=11, tip=ns.nightmareSeed },
}

points[ 1447 ] = { -- 艾薩拉
	[16505100] = { name="惡魔之痕", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[17505870] = { name="惡魔之痕", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[21205400] = { name="惡魔之痕", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[24804780] = { name="惡魔之痕", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[25108150] = { name="惡魔之痕", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[30207980] = { name="惡魔之痕", title="惡魔傳送門", icon=7, tip=ns.felPortals, continent=true },
	[33008150] = { name="惡魔之痕", title="惡魔傳送門", icon=7, tip=ns.felPortals },
}

points[ 1439 ] = { -- 黑海岸
	[37604380] = { title=ns.twoMeditateTitle, npc=211298, name="西爾諾亞", icon=8, class="PRIEST", level=17, continent=true,
					guide=ns.twoMeditate, tip="在這裡完成第二個任務。始終保持 /kneel！", faction="Alliance",
					quest={ ( ( ( ns.race == "Dwarf" ) or ( ns.race == "Human" ) ) and 78194 or 0 ),
							( ( ( ns.race == "Dwarf" ) or ( ns.race == "Human" ) ) and 78195 or 0 ) },
					questName={ ( ( ( ns.race == "Dwarf" ) or ( ns.race == "Human" ) ) and "伊露恩的秘密 (1)" or "" ), 
							( ( ( ns.race == "Dwarf" ) or ( ns.race == "Human" ) ) and "伊露恩的秘密 (2)" or "" ) } },

	[36702740] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[39607830] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[41605820] = { title="破損的箱子", icon=2, tip=ns.chest2, continent=true },
	[42003120] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[42506200] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[43005870] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[44703730] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[46003770] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[47103700] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[48103650] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[50802560] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[54703690] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[55503620] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[56603510] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[35408480] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[36308650] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[38402930] = { title="破損的箱子", icon=3, tip=ns.chest3, continent=true },
	[38408680] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[42608680] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[42808450] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[44202040] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[44308500] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[44708690] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[56402620] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[57102250] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[58102000] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[58401770] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[58500750] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[58801580] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[60301850] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[60502240] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[61501930] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[61902160] = { title="破損的箱子", icon=3, tip=ns.chest3 },

	[40604080] = { npc=2175, name="暗影之爪", title="最佳獵人寵物", icon=5, class="HUNTER", guide=ns.bestPet, continent=true },

	[35808280] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[37606380] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals, continent=true },
	[40608980] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[43202700] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[44208200] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[45002620] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[45205800] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[46204680] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[47402880] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[49803680] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[56402480] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[59802180] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
}

points[ 1457 ] = { -- 達納蘇斯
	[38608880] = { title=ns.twoMeditateTitle, npc=211188, name="瑪瑟拉·礦渣之心", icon=8, class="PRIEST", level=17,
					guide=ns.twoMeditate, tip="在這裡開始第一個任務", faction="Alliance", continent=true,
					quest={ ( ( ns.race == "Night elf" ) and 78192 or 0 ), ( ( ns.race == "Night elf" ) and 78193 or 0 ) }, 
					questName={ ( ( ns.race == "Night elf" ) and "聖光的秘密 (1)" or "" ), 
							( ( ns.race == "Night Elf" ) and "聖光的秘密 (2)" or "" ) } },
}

points[ 1443 ] = { -- 淒涼之地
	[47402220] = { name="惡魔之淚", title="惡魔傳送門", icon=7, tip=ns.felPortals, continent=true },
	[48808220] = { name="惡魔之淚", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[49507460] = { name="惡魔之淚", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[52008550] = { name="惡魔之淚", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[52207250] = { name="惡魔之淚", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[52808100] = { name="惡魔之淚", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[54401920] = { name="惡魔之淚", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[54602880] = { name="惡魔之淚", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[56107460] = { name="惡魔之淚", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[71501860] = { name="惡魔之淚", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[72502190] = { name="惡魔之淚", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[73502460] = { name="惡魔之淚", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[74501030] = { name="惡魔之淚", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[76501920] = { name="惡魔之淚", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[80501710] = { name="惡魔之淚", title="惡魔傳送門", icon=7, tip=ns.felPortals },

	[32017272] = { title=ns.gnomereganTitle, object=424075, name="四邊測量信標 002", icon=9, guide=ns.gnomeregan,
					quest={ 79626, 79705, 79981, 79984, 79982 }, continent=true,
					questName={ "回收機器 9000！", "搶救回收機器", "腐蝕的核心",
						"四邊測量", "保修索賠" }, },
}

points[ 1411 ] = { -- 杜洛塔
	[39405380] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[40803040] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[42102710] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[42502690] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[43303940] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[43603560] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[43705070] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[43903920] = { title="破損的箱子", icon=1, tip=ns.chest1, continent=true },
	[44102400] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[44205030] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[46607900] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[47104980] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[47503100] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[47604980] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[47803330] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[47807720] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[49104840] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[49702430] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[49708070] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[50702590] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[51201900] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[51202360] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[51302100] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[51401030] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[51501030] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[51901990] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[52002540] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[52400920] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[52602640] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[52700850] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[53202500] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[53802820] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[54102220] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[57805870] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[59605810] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[59605630] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[61804550] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[61805110] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[62105590] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[62404210] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[62406050] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[63205680] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[64105040] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[64505310] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[65508320] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[67108670] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[68308510] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[68407150] = { title="破損的箱子", icon=1, tip=ns.chest1 },

	[68607160] = { npc=208124, name="拉魯克", title="最佳獵人寵物", icon=5, class="HUNTER", guide=ns.bestPet, continent=true },

	[68707110] = { title=ns.twoMeditateTitle, object=410168, name="巫毒堆", icon=8, class="PRIEST", level=18,
					faction="Horde", guide=ns.twoMeditate, tip="忽略任務指示。爬上\n最北端島嶼上的小山",
					quest={ ( ( ns.race == "Undead" ) and 78198 or 0 ), ( ( ns.race == "Undead" ) and 78199 or 0 ) }, 
					questName={ ( ( ns.race == "Undead" ) and "洛阿的秘密 (1)" or "" ), 
							( ( ns.race == "Undead" ) and "洛阿的秘密 (2)" or "" ) }, continent=true, },
}

points[ 1445 ] = { -- 塵泥沼澤
	[58601300] = { title=ns.gnomereganTitle, object=424074, name="四邊測量信標 001", icon=9, guide=ns.gnomeregan,
					quest={ 79626, 79705, 79981, 79984, 79982 }, continent=true,
					questName={ "回收機器 9000！", "搶救回收機器", "腐蝕的核心",
						"四邊測量", "保修索賠" }, },
}

points[ 1444 ] = { -- 菲拉斯
	[68205880] = { name="惡魔之痕", title="惡魔傳送門", icon=7, tip=ns.felPortals, continent=true },
	[70606250] = { name="惡魔之痕", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[72506380] = { name="惡魔之痕", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[73205440] = { name="惡魔之痕", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[74205060] = { name="惡魔之痕", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[74205680] = { name="惡魔之痕", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[74206000] = { name="惡魔之痕", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[76205650] = { name="惡魔之痕", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[76606360] = { name="惡魔之痕", title="惡魔傳送門", icon=7, tip=ns.felPortals },

	[29309380] = { title=ns.gnomereganTitle, object=424077, name="四邊測量信標 004", icon=9, guide=ns.gnomeregan,
					quest={ 79626, 79705, 79981, 79984, 79982 }, continent=true,
					tip="沿著海岸走以避開 60 級精英。\n洞穴也是一個死胡同",
					questName={ "回收機器 9000！", "搶救回收機器", "腐蝕的核心",
						"四邊測量", "保修索賠" }, },
	[84204380] = { title=ns.gnomereganTitle, npc=218237, name="維達爾奇物公司", icon=9, guide=ns.gnomeregan,
					quest={ 79626, 79705, 79981, 79984, 79982 }, continent=true,
					tip="沿著海岸走以避開 60 級精英。\n洞穴也是一個死胡同",
					questName={ "回收機器 9000！", "搶救回收機器", "腐蝕的核心",
						"四邊測量", "保修索賠" }, },
}

points[ 1450 ] = { -- 月光林地
	[52404050] = { npc=12042, name="洛加納爾", title=ns.nightmareTitle, icon=10,
					guide=ns.nightmare, continent=true,
					tip="確保你與塞納里奧議會保持友善關係",
					quest= { 82017, 82018, 82019, 82020, 82021, 82022, 82023, 81986 },
					questName = { "夢魘融合怪", "伊薩裡烏斯", "潛入",
						"返回月光林地", "峰迴路轉", "壞消息...",
						"遺失的護腕", "喚醒夢魘" }, },
}

points[ 1412 ] = { -- 莫高雷					
	[28502120] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[29302350] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[29602590] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[30902290] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[31006080] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[31206180] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[31306340] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[31504200] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[31704270] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[32506100] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[33104740] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[35506240] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[36101120] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[36601290] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[37701040] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[38400800] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[40101530] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[40601610] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[48407230] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[53200930] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[53304810] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[53307310] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[53707320] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[53804850] = { title="破損的箱子", icon=1, tip=ns.chest1, continent=true },
	[55101610] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[55201150] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[56701480] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[59804810] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[60903790] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[61204730] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[62303830] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[63107150] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[63504110] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[64206890] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[65506920] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[65604090] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[66906860] = { title="破損的箱子", icon=1, tip=ns.chest1 },

	[36605660] = { npc=205382, name="莫克瓦", title="最佳獵人寵物", icon=5, class="HUNTER", guide=ns.bestPet, continent=true },
	[51801840] = { npc=5807, name="耙子", title="最佳獵人寵物", icon=5, class="HUNTER", guide=ns.bestPet },
}

points[ 1454 ] = { -- 奧格瑪
	[35748823] = { title=ns.twoMeditateTitle, npc=211229, name="迪特里希·普萊斯", icon=8, class="PRIEST", faction="Horde",
					level=18, guide=ns.twoMeditate, tip="在這裡開始第一個任務", continent=true,
					quest={ ( ( ns.race == "Troll" ) and 78196 or 0 ), ( ( ns.race == "Troll" ) and 78197 or 0 ) }, 
					questName={ ( ( ns.race == "Troll" ) and "亡靈的秘密 (1)" or "" ), 
							( ( ns.race == "Troll" ) and "亡靈的秘密 (2)" or "" ) } },							
}

points[ 1442 ] = { -- 石爪山脈
	[43303880] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[45104600] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[50904380] = { title="破損的箱子", icon=3, tip=ns.chest3, continent=true },
	[53603580] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[63504020] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[66304550] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[66505080] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[71906270] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[72206040] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[72906140] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[73006000] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[73006150] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[73006280] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[73305900] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[73608560] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[74105930] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[77009150] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[80608950] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[84308420] = { title="破損的箱子", icon=3, tip=ns.chest3 },

	[39604990] = { name="一堆泥土", title="舒適睡袋", icon=6, guide=ns.cozySleepingBag,				
					quest={ ( ( ns.faction == "Alliance" ) and 79008 or 79007 ), 79192, 79980, 79974, 79975, 79976 }, 
					questName={ "...還有你找到的那張紙條", "踏腳石", "翻找", "濕活", "鷹爪",
						"就是這裡了" }, tip="第四步" },
	[40805250] = { name="口袋垃圾", title="舒適睡袋", icon=6, guide=ns.cozySleepingBag,				
					quest={ ( ( ns.faction == "Alliance" ) and 79008 or 79007 ), 79192, 79980, 79974, 79975, 79976 }, 
					questName={ "...還有你找到的那張紙條", "踏腳石", "翻找", "濕活", "鷹爪",
						"就是這裡了" }, tip="第三步", continent=true },
}

points[ 1446 ] = { -- 塔納利斯
	[37802730] = { title=ns.gnomereganTitle, object=424076, name="四邊測量信標 003", icon=9, guide=ns.gnomeregan,
					quest={ 79626, 79705, 79981, 79984, 79982 }, continent=true,
					questName={ "回收機器 9000！", "搶救回收機器", "腐蝕的核心",
						"四邊測量", "保修索賠" }, },
}

points[ 1438 ] = { -- 泰達希爾
	[31503170] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[33202850] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[33903560] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[34202820] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[34203440] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[35403480] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[35603880] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[36303790] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[37204300] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[37504160] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[43806130] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[43905990] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[43906190] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[44506040] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[44606260] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[44805890] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[47207780] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[47907790] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[50006300] = { title="破損的箱子", icon=1, tip=ns.chest1, continent=true },
	[51605000] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[51904860] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[52005130] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[53005020] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[56307550] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[65806480] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[66006350] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[68705190] = { title="破損的箱子", icon=1, tip=ns.chest1 },
	[69605320] = { title="破損的箱子", icon=1, tip=ns.chest1 },

	[53807680] = { npc=14430, name="暮色潛行者", title="最佳獵人寵物", icon=5, class="HUNTER", guide=ns.bestPet, continent=true },
	[60207560] = { npc=14430, name="暮色潛行者", title="最佳獵人寵物", icon=5, class="HUNTER", guide=ns.bestPet },
}

points[ 1413 ] = { -- The Barrens
	[42102470] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[43402370] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[43602650] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[43702120] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[45102000] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[46603900] = { title="破損的箱子", icon=2, tip=ns.chest2, continent=true },
	[46502280] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[46601810] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[47001590] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[47701950] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[47901790] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[48903880] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[52501070] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[52501160] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[52904440] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[53404050] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[53904300] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[54504680] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[55902700] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[55904580] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[56600880] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[56804350] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[56902550] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[57104120] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[58802750] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[59102440] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[62804970] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[63504610] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[63704920] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[64304730] = { title="破損的箱子", icon=2, tip=ns.chest2 },
	[37601630] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[38401310] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[39201190] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[40001600] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[42905510] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[43304830] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[43305220] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[45005140] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[45305430] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[46905360] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[51105750] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[51305490] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[52605230] = { title="破損的箱子", icon=3, tip=ns.chest3, continent=true },
	[53605400] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[59605400] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[59600280] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[60400350] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[61700520] = { title="破損的箱子", icon=3, tip=ns.chest3 },
	[62000420] = { title="破損的箱子", icon=3, tip=ns.chest3 },

	[62043955] = { npc=214208, name="諾拉·安妮希尔特", title=ns.voidTouchedTitle, icon=4, guide=ns.voidTouched,
					tip="在完成之前的步驟之前，\n不要來找她。\n\n"
						.."變換鱗片護符是一個\n非常有價值的 +5 精神飾品",
					quest={ 78909 }, questName={ "變換鱗片護符" }, continent=true },

	[50001660] = { npc=5865, name="迪舒", title="最佳獵人寵物", icon=5, class="HUNTER", guide=ns.bestPet, continent=true },
	[51802800] = { npc=5865, name="迪舒", title="最佳獵人寵物", icon=5, class="HUNTER", guide=ns.bestPet },
	[62603440] = { npc=5828, name="獅王胡瑪", title="最佳獵人寵物", icon=5, class="HUNTER", guide=ns.bestPet },

	[46407390] = { name="燒毀的殘骸", title="舒適睡袋", icon=6, guide=ns.cozySleepingBag,
					quest={ ( ( ns.faction == "Alliance" ) and 79008 or 79007 ), 79192, 79980, 79974, 79975, 79976 }, 
					questName={ "...還有你找到的那張紙條", "踏腳石", "翻找", "濕活", "鷹爪",
						"就是這裡了" },
						tip="聯盟：第二步\n部落：第一步", continent=true },

	[42808180] = { name="惡魔裂隙", title="惡魔傳送門", icon=7, tip=ns.felPortals, continent=true },
	[43208020] = { name="惡魔裂隙", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[43808380] = { name="惡魔裂隙", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[46108550] = { name="惡魔裂隙", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[47808360] = { name="惡魔裂隙", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[48408120] = { name="惡魔裂隙", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[48408300] = { name="惡魔裂隙", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[48608300] = { name="惡魔裂隙", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[50208060] = { name="惡魔裂隙", title="惡魔傳送門", icon=7, tip=ns.felPortals },

	[38601540] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[39501380] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals, continent=true },
	[40001840] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[40801440] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[42001420] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[43404420] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[44405000] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[44405460] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[45004580] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[45805120] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[46405260] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[47604940] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[51805340] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[53005080] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[54205260] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[54404850] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[55602560] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[55805100] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[56002480] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[57602350] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[58204980] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[58802560] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[59002920] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[59003200] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[59203650] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[59802750] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[60203600] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[60802900] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
	[61803200] = { name="惡魔碎片", title="惡魔傳送門", icon=7, tip=ns.felPortals },
}

points[ 1441 ] = { -- Thousand Needles
}

points[ 1456 ] = { -- Thunder Bluff
}

--=======================================================================================================
--
-- MISCELLANY
--
--=======================================================================================================

-- Choice of texture
-- Note that these textures are all repurposed and as such have non-uniform sizing
-- I should also allow for non-uniform origin placement as well as adjust the x,y offsets
ns.textures[1] = "Interface\\PlayerFrame\\MonkLightPower"
ns.textures[2] = "Interface\\PlayerFrame\\MonkDarkPower"
ns.textures[3] = "Interface\\Common\\Indicator-Red"
ns.textures[4] = "Interface\\Common\\Indicator-Yellow"
ns.textures[5] = "Interface\\Common\\Indicator-Green"
ns.textures[6] = "Interface\\Common\\Indicator-Gray"
ns.textures[7] = "Interface\\Common\\Friendship-ManaOrb"	
ns.textures[8] = "Interface\\TargetingFrame\\UI-PhasingIcon"
ns.textures[9] = "Interface\\Store\\Category-icon-pets"
ns.textures[10] = "Interface\\Store\\Category-icon-featured"
ns.textures[11] = "Interface\\HelpFrame\\HelpIcon-CharacterStuck"	
ns.textures[12] = "Interface\\PlayerFrame\\UI-PlayerFrame-DeathKnight-Frost"
ns.textures[13] = "Interface\\TargetingFrame\\PetBadge-Magical"
ns.textures[14] = "Interface\\Vehicles\\UI-Vehicles-Raid-Icon"
ns.textures[15] = "Interface\\AddOns\\HandyNotes_Chests\\Textures\\Adrenaline"
ns.textures[16] = "Interface\\AddOns\\HandyNotes_Chests\\Textures\\Arcane"
ns.textures[17] = "Interface\\AddOns\\HandyNotes_Chests\\Textures\\Demonic"
ns.textures[18] = "Interface\\AddOns\\HandyNotes_Chests\\Textures\\Duty"
ns.textures[19] = "Interface\\AddOns\\HandyNotes_Chests\\Textures\\Frozen"
ns.textures[20] = "Interface\\AddOns\\HandyNotes_Chests\\Textures\\Metamorphosis"

ns.scaling[1] = 0.41
ns.scaling[2] = 0.41
ns.scaling[3] = 0.41
ns.scaling[4] = 0.41
ns.scaling[5] = 0.41
ns.scaling[6] = 0.41
ns.scaling[7] = 0.49
ns.scaling[8] = 0.46
ns.scaling[9] = 0.56
ns.scaling[10] = 0.56
ns.scaling[11] = 0.43
ns.scaling[12] = 0.37
ns.scaling[13] = 0.36
ns.scaling[14] = 0.32
ns.scaling[15] = 0.33
ns.scaling[16] = 0.33
ns.scaling[17] = 0.33
ns.scaling[18] = 0.33
ns.scaling[19] = 0.33
ns.scaling[20] = 0.33
