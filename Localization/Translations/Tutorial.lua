---@type l10n
local l10n = QuestieLoader:ImportModule("l10n")

local tutorialLocals = {
    ["Welcome to Questie"] = {
        ["ptBR"] = "Bem-vindo ao Questie",
        ["ruRU"] = "Добро пожаловать в Questie",
        ["deDE"] = "Willkommen bei Questie",
        ["koKR"] = "퀘스티에 오신 것을 환영합니다",
        ["esMX"] = "Bienvenidos a Questie",
        ["enUS"] = true,
        ["zhCN"] = "欢迎来到 Questie",
        ["zhTW"] = "歡迎使用任務位置提示插件 Questie",
        ["esES"] = "Bienvenidos a Questie",
        ["frFR"] = "Bienvenue sur Questie",
    },
    ["With WotLK Phase 4 Blizzard introduced their own quest objective system.\n\nPlease choose the objective style you want to use:"] = {
        ["ptBR"] = "Com a Fase 4 de WotLK, a Blizzard introduziu seu próprio sistema de objetivos de missão.\n\nPor favor, escolha o estilo de objetivo que deseja usar:",
        ["ruRU"] = "В 4-й фазе Гнева Короля Лича разработчики Blizzard представили их собственную систему целей заданий.\n\nПожалуйста, выберите стиль целей, который вы будете использовать:",
        ["deDE"] = "Mit der Phase 4 von WotLK hat Blizzard sein eigenes Questziel-System eingeführt.\n\nBitte wähle den Stil den du nutzen möchtest:",
        ["koKR"] = "리치왕의 분노 페이즈4 에서는 블리자드 순정 퀘스트 추적기가 제공됩니다. \n\n사용하고 싶은 퀘스트 추적기 종류를 선택하여 주십시오",
        ["esMX"] = "Con la Fase 4 de WoTLK, Blizzard introdujo su propio sistema de objetivos de misiones.\n\nElija el estilo objetivo que deseas utilizar:",
        ["enUS"] = true,
        ["zhCN"] = "随着WLK的第4阶段开启，暴雪引入了自己的任务提示系统。\n\n请选择要使用的目标样式：",
        ["zhTW"] = "在巫妖王的第4階段中，暴雪導入了自家的任務提示系統。\n\n請選擇你想要使用哪種任務提示風格:",
        ["esES"] = "Con la Fase 4 de WoTLK, Blizzard introdujo su propio sistema de objetivos de misiones.\n\nElija el estilo objetivo que deseas utilizar:",
        ["frFR"] = "Avec WotLK Phase 4, Blizzard a introduit son propre système d'objectifs de quête.\n\nVeuillez choisir le style d'objectif que vous souhaitez utiliser :",
    },
    ["Questie Objectives"] = {
        ["ptBR"] = "Objetivos de Questie",
        ["ruRU"] = "Цели Questie",
        ["deDE"] = "Questie Questziele",
        ["koKR"] = "퀘스트 목표",
        ["esMX"] = "Objetivos de Questie",
        ["enUS"] = true,
        ["zhCN"] = "Questie 提示",
        ["zhTW"] = "Questie 任務圖示",
        ["esES"] = "Objetivos de Questie",
        ["frFR"] = "Objectifs de Questie",
    },
    ["pfQuest Objectives"] = {
        ["ptBR"] = "Objetivos de pfQuest",
        ["ruRU"] = "Цели pfQuest",
        ["deDE"] = "pfQuest Questziele",
        ["koKR"] = false,
        ["esMX"] = "Objetivos de pfQuest",
        ["enUS"] = true,
        ["zhCN"] = "pfQuest 提示",
        ["zhTW"] = "pfQuest 任務圖示",
        ["esES"] = "Objetivos de pfQuest",
        ["frFR"] = "Objectifs de pfQuest",
    },
    ["Blizzard Objectives"] = {
        ["ptBR"] = "Objetivos de Blizzard",
        ["ruRU"] = "Цели Blizzard",
        ["deDE"] = "Blizzard Questziele",
        ["koKR"] = "블리자드 목표",
        ["esMX"] = "Objetivos de Blizzard",
        ["enUS"] = true,
        ["zhCN"] = "暴雪自带提示",
        ["zhTW"] = "暴雪任務圖示",
        ["esES"] = "Objetivos de Blizzard",
        ["frFR"] = "Objectifs de Blizzard",
    },
    ["Questie can show you the locations of runes for your class from previous SoD Phases.\n\n"] = {
        ["ptBR"] = "Questie pode mostrar a você as localizações das runas para a sua classe das fases anteriores de SoD.\n\n",
        ["ruRU"] = "Questie может показать вам местоположения рун для вашего класса из предыдущих фаз SoD.\n\n",
        ["deDE"] = "Questie kann die Orte der Runen aus vorherigen SoD Phasen für deine Klasse anzeigen.\n\n",
        ["koKR"] = false,
        ["esMX"] = "Questie puede mostrarte las ubicaciones de las runas para tu clase de fases anteriores de SoD.\n\n",
        ["enUS"] = true,
        ["zhCN"] = false,
        ["zhTW"] = false,
        ["esES"] = "Questie puede mostrarte las ubicaciones de las runas para tu clase de fases anteriores de SoD.\n\n",
        ["frFR"] = "Questie peut vous afficher les emplacements des runes pour votre classe des phases précédentes de SoD.\n\n",
    },
    ["Rune locations are marked with the following symbol:"] = {
        ["ptBR"] = "As localizações das runas são marcadas com o seguinte símbolo:",
        ["ruRU"] = "Местоположения рун отмечены следующим символом:",
        ["deDE"] = "Runenstandorte sind mit dem folgenden Symbol markiert:",
        ["koKR"] = false,
        ["esMX"] = "Las ubicaciones de las runas están marcadas con el siguiente símbolo:",
        ["enUS"] = true,
        ["zhCN"] = false,
        ["zhTW"] = "符文位置使用以下符號標記:",
        ["esES"] = "Las ubicaciones de las runas están marcadas con el siguiente símbolo:",
        ["frFR"] = "La position des runes est indiquée par le symbole suivant:",
    },
    ["Please choose if you want to see them or not\n"] = {
        ["ptBR"] = "Por favor, escolha se deseja vê-las ou não\n",
        ["ruRU"] = "Пожалуйста, выберите, хотите вы их видеть или нет\n",
        ["deDE"] = "Bitte wähle, ob sie angezeigt werden sollen oder nicht\n",
        ["koKR"] = false,
        ["esMX"] = "Por favor, elige si deseas verlas o no\n",
        ["enUS"] = true,
        ["zhCN"] = false,
        ["zhTW"] = "請選擇是否想要看到\n",
        ["esES"] = "Por favor, elige si deseas verlas o no\n",
        ["frFR"] = "Choisissez si vous voulez les voir ou non\n",
    },
    ["(This can always be changed in the Icons tab of the settings)"] = {
        ["ptBR"] = "(Isso sempre pode ser alterado na guia de Ícones nas configurações)",
        ["ruRU"] = "(это всегда может быть изменено в настройках на вкладке Значки)",
        ["deDE"] = "(Dies kann immer im Reiter Icons der Einstellungen geändert werden)",
        ["koKR"] = false,
        ["esMX"] = "(Esto siempre se puede cambiar en la pestaña de Iconos de la configuración)",
        ["enUS"] = true,
        ["zhCN"] = false,
        ["zhTW"] = "(隨時都可以在設定選項的圖示標籤頁面中更改)",
        ["esES"] = "(Esto siempre se puede cambiar en la pestaña de Iconos de la configuración)",
        ["frFR"] = "(Ce choix peut être changé à nouveau dans l'onglet Icones des réglages)",
    },
}

for k, v in pairs(tutorialLocals) do
    l10n.translations[k] = v
end
