using System;
using UnityEngine;
using Random = System.Random;

public static class Constants{

    #region Links

    public const string link_StoreInitial = "https://play.google.com/store/apps/details?id=";
    public const string link_MoreGames = "https://play.google.com/store/apps/developer?id=Hi+Gamez";
    public const string link_Facebook = "https://www.facebook.com/pages/category/Software-Company/The-Gaminators-Studio-476426059466936/";
    public const string link_PrivacyPolicy = "https://higames266.blogspot.com/2020/11/hi-gamez.html";

    #endregion
    #region InApps

    public const string inAppId_coins_5000 = "packone";
    public const string inAppId_coins_15000 = "packtwo";
    public const string inAppId_coins_20000 = "packthree";
    public const string inAppId_coins_30000 = "packfour";
    public const string inAppId_coins_40000 = "packfive";
    public const string inAppId_unlockAllGuns = "unlockallguns";
    public const string inAppId_unlockAllChaptes = "unlockallchapters";
    public const string inAppId_unlockAllLevels = "unlockalllevels";
    public const string inAppId_noAds = "noads";
    public const string inAppId_megaOffer = "megaoffer";


    public const int inAppId_CoinsReward_5000 = 5000;
    public const int inAppId_CoinsReward_15000 = 15000;
    public const int inAppId_CoinsReward_20000 = 20000;
    public const int inAppId_CoinsReward_30000 = 30000;
    public const int inAppId_CoinsReward_40000 = 40000;

    #endregion

    #region Paths
    public const string folderPath_UI = "UI/";
    public const string folderPath_Scriptables = "ScriptableObj/";
    public const string folderPath_Scriptables_Levels = "LevelsData/LevelMode";
    
    
    public const string folderPath_Effects = "Effects/";
    public const string folderPath_Prefabs = "Prefabs/";
    public const string folderPath_Scriptables_VehicleSelection_Vehicles = "SelectionVehicles/";
    public const string folderPath_Prefabs_PlayerVehicles = "Vehicles/";
    public const string folderPath_Prefabs_Levels_Mode = "Levels_Mode";
    public const string folderPath_Prefabs_VehicleSelection_Vehicles = "SelectionVehicles/";
    public const string folderPath_DayModeLightingData = "LightingData/Day/";


    #endregion

    #region Names

    public const string gameModeName_Mode1 = "TrainerMode";
    public const string gameModeName_Mode2 = "MasterMode";
    public const string gameModeName_Mode3 = "EndlessMode";
    public const string gameModeName_Mode4 = "MultiplayerMode";
    public const string gameModeName_Mode5 = "HighwayMode";
    public const string gameModeName_Mode6 = "FreeMode";

    public const string prefsFileName = "data";
    public const string uiCoinEffect = "CoinsEffect";

    public const string uiName_Main = "Main";
    public const string uiName_HUD = "HUD";
    public const string uiGameplay_Loading = "Gameplay_Loading";
    public const string uiName_Loading = "Loading";
    public const string uiName_FakeLoading = "Loading";
    public const string uiName_DummmyLoading = "DummyLoading";
    public const string uiName_Pause = "Pause";
    public const string uiName_Settings = "Settings";
    public const string uiName_ModeSelection = "ModeSelection";
    public const string uiName_RampMissionLevelSelection = "RampMissionLevelSelection";
    public const string uiName_VehicleSelection = "VehicleSelection";
    public const string uiName_Quit = "Quit";
    public const string uiName_Store = "Store";
    public const string uiName_RateUs = "RateUs";
    public const string uiName_LevelComplete = "LevelComplete";
    public const string uiName_LevelFail = "LevelFail";
    public const string uiName_Revive = "Revive";
    public const string uiName_OutOfTime = "OutOfTime";
    public const string uiName_Blink = "Blink";
    public const string uiName_PrivacyPolicy = "PrivacyPolicy";
    public const string uiName_DailyReward = "DailyReward";
    public const string uiName_Sure = "Sure";
    public const string uiName_Message = "Message";
    public const string uiName_SufficientMessage = "SufficeintMessage";
    public const string uiName_ModeLockedMessage = "ModeLockedMessage";
    public const string uiName_UnlockCarMsg = "UnlockCarMsg";
    public const string uiName_WatchVideo = "MessageWatchVideo";
    public const string uiName_MegaOffer = "MegaOffer";
    public const string uiName_LowCoinVehicleBuy = "LowCoinVehicleBuy";


    #endregion

    #region GamePlay

    public static bool Headshot = false;
    public static bool slomoBulletTime =false;
    public static int DayNight = 0;
    public static int MovePointcounter = 0;
    //public static bool tryweapon = false;
    //public static int tryweaponindex = 0;
    #endregion

    public const int reviveCoinsCost = 100;
    public const int PlayerHealthOnInjection = 100;

    public const int sceneIndex_Menu = 1;
    public const int sceneIndex_GameMode1 = 2;
    public const int sceneIndex_GameMode2 = 2;
    public const int sceneIndex_GameMode3 = 2;
    public const int sceneIndex_GameMode4 = 2;
    public const int sceneIndex_GameMode5 = 2;
    public const int sceneIndex_GameMode6 = 2;
    public const string scenename_Gameplay = "Gameplay";
   

    public const int gameModeIndex_Mode1 = 0;
    public const int gameModeIndex_Mode2 = 1;
    public const int gameModeIndex_Mode3 = 2;
    public const int gameModeIndex_Mode4 = 3;
    public const int gameModeIndex_Mode5 = 4;
    public const int gameModeIndex_Mode6 = 5;
    public const int gameModeIndex_Mode7 = 6;
    public const int gameModeIndex_Mode8 = 7;
    public const int gameModeIndex_Mode9 = 8;
    public const int gameModeIndex_Mode10 = 9;
    public const int gameModeIndex_Mode11 = 10;
    public const int gameModeIndex_Mode12 = 11;
    public const int gameModeIndex_Mode13 = 12;
    public const int gameModeIndex_Mode14 = 13;
    public const int gameModeIndex_Mode15 = 14;

    public const int delay_LevelComplete = 2;

    public const float slowmoEffectTimeVal = 0.4f;

    public const int outOfTime_CoinsTimeCost = 100;

    public const int outOfTime_CoinsTimeReward = 30;
    public const int rewardedVideo_TimeReward = 60;
    public const int rewardedVideo_StoreCoinReward = 50;
    public  enum RewardType
    {
        STORE_COINS = 0,
        UNLOCK_NEXT_DAY = 1,
        UNLOCK_NEXT_Level = 1,
        FREEREWARD = 2,
        ADD_LEVEL_TIME = 3,
        LEVEL_COMPLETE_2XCOINS = 4,
        HEALTHONINJECTION = 5,
        REVIVEREWARD = 6,
        TRYWEAPON = 7,
        CLAIM_NEXT_DAY_DAILYREWARD = 8

    }
    public static RewardType rewardType;

    #region DailyReward
    public static readonly int[] dailyReward = {
        50,
        120,
        200,
        260,
        400,
        550,
        750
    };
    public static int Firstdynamicreward = 1;
    public static int Seconndynamicreward = 6;
    public static int Thirddynamicreward = 3;
    #endregion





    public const int mode2UnlockAfterLevels = 3;
    //public const string admob_IAd_ID = "ca-app-pub-6263347419612757/6754971262";
    //public const string admob_RAd_ID = "ca-app-pub-6263347419612757/5441889594";
    //public const string admob_BAd_ID = "ca-app-pub-6263347419612757/8068052937";
    //public const string admob_NAd_ID = "ca-app-pub-6263347419612757/4128807924";
    //Test ID S
    public const string admob_IAd_ID = "ca-app-pub-3940256099942544/1033173712";
    public const string admob_RAd_ID = "ca-app-pub-3940256099942544/5224354917";
    public const string admob_BAd_ID = "ca-app-pub-3940256099942544/6300978111";
}




