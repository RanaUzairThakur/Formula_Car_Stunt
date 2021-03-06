using System;
using System.IO;
using System.Collections.Generic;
using System.Runtime.Serialization.Formatters.Binary;
using UnityEngine;

[System.Serializable]
public class Prefs_Data {


    [SerializeField] private bool gameAudio = true;
    [SerializeField] private bool gameSound = true;

    [SerializeField] private float soundVolume = 1.0f;
    [SerializeField] private float musicVolume = 0.4f;

    [SerializeField] private int goldCoins = 0;
    [SerializeField] private GameData[] gamedata;
    //[SerializeField] private int highScore = 0;

    //[SerializeField] private string playerName;
    [SerializeField] private bool modesautoscroller = false;
    [SerializeField] private bool firstRun = true;
    [SerializeField] private bool megaofferpanelShowed = false;
    [SerializeField] private bool appRated = false;
    [SerializeField] private bool userConsent = false;

    [SerializeField] private int lastLevelStartAnimation = 0;

    //[SerializeField] private GameMode[] gamemode;

    [SerializeField] private int lastSelectedGameMode = 0;
    [SerializeField] private string lastSelectedscenename= "";

    [SerializeField] private bool mode2Unlocked = false;
    [SerializeField] private bool megaOfferPurchased = false;


    [SerializeField] private int lastSelectedVehicle = 0;
    [SerializeField] private bool[] vehiclesUnlocked;


    [SerializeField] private int dailyRewardDay = 0;
    [SerializeField] private DateTime nextDailyRewardTime;
    [SerializeField] private string   dailyRewardTime;

    //[SerializeField] private DateTime classicMode_unlockDateTime= DateTime.Now.AddDays(2);
    [SerializeField] private bool noAdsPurchased = false;
    [SerializeField] private bool unlockallLevel=false;
    [SerializeField] private bool unlockallVehicles=false;
    [SerializeField] private bool unlockallModes = false;

    [SerializeField] private bool dailyrewardclaimed = false;
    [SerializeField] private bool purchasingInapp = false;
    [SerializeField] private bool deviceSpecificationCheck = false;
    [SerializeField] private bool isDetectVeryCheapDevice = false;
    [SerializeField] private bool isDetectLowCheapDevice = false;
    [SerializeField] private bool isDetectMediumCheapDevice = false;

    [SerializeField] private bool tutorialshowfirsttime = false;
    private int dynamicDailyRewardItemNumber1 = -1;

    //[SerializeField] private int scheduledNotificationId = -1;


    public int Get_LastUnlockedLevelofCurrentGameMode()
    {
        for (int i = 0; i < GameData[LastSelectedGameMode].LevelUnlocked.Length; i++)
        {
            if (!GameData[LastSelectedGameMode].LevelUnlocked[i])
            {
                return i - 1;
            }
        }
        return GameData[LastSelectedGameMode].LevelUnlocked.Length - 1;
        //for (int i = 0; i < Gamemode[LastSelectedGameMode].Gamedata[lastSelectedchapter_of_gamemode].LevelUnlocked.Length; i++)
        //{
        //    if (!Gamemode[LastSelectedGameMode].Gamedata[lastSelectedchapter_of_gamemode].LevelUnlocked[i])
        //    {
        //        if (i > Gamemode[LastSelectedGameMode].Gamedata[lastSelectedchapter_of_gamemode].LevelUnlocked.Length)

        //            return Gamemode[LastSelectedGameMode].Gamedata[lastSelectedchapter_of_gamemode].LevelUnlocked.Length - 1;
        //        else
        //            return i - 1;
        //    }
        //}
        //return Gamemode[LastSelectedGameMode].Gamedata[lastSelectedchapter_of_gamemode].LevelUnlocked.Length - 1;
    }

    public int Get_LastUnlockedLevelOfGameMode(int _mode)
    {

        for (int i = 0; i < GameData[_mode].LevelUnlocked.Length; i++)
        {
            if (!GameData[LastSelectedGameMode].LevelUnlocked[i])
            {
                return i - 1;
            }
        }
        return GameData[LastSelectedGameMode].LevelUnlocked.Length - 1;
        //for (int i = 0; i < Gamemode[LastSelectedGameMode].Gamedata[lastSelectedchapter_of_gamemode].LevelUnlocked.Length; i++)
        //{
        //    if (!Gamemode[LastSelectedGameMode].Gamedata[lastSelectedchapter_of_gamemode].LevelUnlocked[i])
        //    {
        //        if (i >= Gamemode[LastSelectedGameMode].Gamedata[lastSelectedchapter_of_gamemode].LevelUnlocked.Length)
        //            return Gamemode[LastSelectedGameMode].Gamedata[lastSelectedchapter_of_gamemode].LevelUnlocked.Length - 1;
        //        else
        //            return i - 1;
        //    }
        //}

        //return Gamemode[LastSelectedGameMode].Gamedata[lastSelectedchapter_of_gamemode].LevelUnlocked.Length - 1;

    }

    public int Get_LastSelectedLevelOfCurrentGameMode() {

        //  return GameData[LastSelectedGameMode].LastselectedlevelofMode;
        //if (Gamemode[LastSelectedGameMode].Gamedata[lastSelectedchapter_of_gamemode].LastselectedlevelofChapter > Gamemode[LastSelectedGameMode].Gamedata[lastSelectedchapter_of_gamemode].LevelUnlocked.Length)
        //    return Gamemode[LastSelectedGameMode].Gamedata[lastSelectedchapter_of_gamemode].LevelUnlocked.Length-1;
        //else
        //return Gamemode[LastSelectedGameMode].Gamedata[lastSelectedchapter_of_gamemode].LastselectedlevelofChapter;
        if (GameData[LastSelectedGameMode].LastselectedlevelofChapter > GameData[LastSelectedGameMode].LevelUnlocked.Length)
            return GameData[LastSelectedGameMode].LevelUnlocked.Length - 1;
        else
            return GameData[LastSelectedGameMode].LastselectedlevelofChapter;
    }

    public void Set_LastSelectedLevelOfCurrentGameMode(int _level)
    {
        //if (Gamemode[LastSelectedGameMode].Gamedata[lastSelectedchapter_of_gamemode].LastselectedlevelofChapter > Gamemode[LastSelectedGameMode].Gamedata[lastSelectedchapter_of_gamemode].LevelUnlocked.Length)
        //    return;
        //else
        //Gamemode[LastSelectedGameMode].Gamedata[lastSelectedchapter_of_gamemode].LastselectedlevelofChapter = _level;
        if (GameData[LastSelectedGameMode].LastselectedlevelofChapter > GameData[LastSelectedGameMode].LevelUnlocked.Length)
            return;
        else
            GameData[LastSelectedGameMode].LastselectedlevelofChapter = _level;
    }

    public int Get_LengthOfLevelsOfCurrentGameMode()
    {
         return GameData[LastSelectedGameMode].LevelUnlocked.Length;
         //return Gamemode[LastSelectedGameMode].Gamedata[lastSelectedchapter_of_gamemode].LevelUnlocked.Length;
    }

    public void Change_LastSelectedLevelOfCurrentGameMode(int _val)
    {
        //    GameData[LastSelectedGameMode].LastselectedlevelofMode += _val;
        //if (Gamemode[LastSelectedGameMode].Gamedata[lastSelectedchapter_of_gamemode].LastselectedlevelofChapter > Gamemode[LastSelectedGameMode].Gamedata[lastSelectedchapter_of_gamemode].LevelUnlocked.Length)
        //    return;
        //else
        //Gamemode[LastSelectedGameMode].Gamedata[lastSelectedchapter_of_gamemode].LastselectedlevelofChapter += _val;
        if (GameData[LastSelectedGameMode].LastselectedlevelofChapter > GameData[LastSelectedGameMode].LevelUnlocked.Length)
            return;
        else
            GameData[LastSelectedGameMode].LastselectedlevelofChapter += _val;
    }


    public int Get_LastSelectedGameModeSceneIndex()
    {
        if (LastSelectedGameMode == 0)
        {
            lastSelectedscenename = Constants.scenename_Gameplay;
            return Constants.sceneIndex_GameMode1;
        }
        else if(LastSelectedGameMode == 1 )
        {
            lastSelectedscenename = Constants.scenename_Gameplay;
            return Constants.sceneIndex_GameMode2;
        }
        else if(LastSelectedGameMode == 2)
        {
            lastSelectedscenename = Constants.scenename_HighwayracerGameplay;
            return Constants.sceneIndex_GameMode3;
        }
        else if (LastSelectedGameMode == 3 )
        {
            lastSelectedscenename = Constants.scenename_Gameplay;
            return Constants.sceneIndex_GameMode4;
        }
        else if (LastSelectedGameMode == 4 )
        {
            lastSelectedscenename = Constants.scenename_Gameplay;
            return Constants.sceneIndex_GameMode5;
        }
        else if (LastSelectedGameMode == 5)
        {
            lastSelectedscenename = Constants.scenename_Gameplay;
            return Constants.sceneIndex_GameMode5;
        }
        else
        {
            lastSelectedscenename = Constants.scenename_Gameplay;
            return Constants.sceneIndex_GameMode1;
        }
    }

    public void Unlock_NextLevelOfCurrentGameMode()
    {
       
        if (!AreAllLevelsUnlocked())
            GameData[LastSelectedGameMode].LevelUnlocked[Get_LastUnlockedLevelOfGameMode(LastSelectedGameMode) + 1] = true;
        // Gamemode[LastSelectedGameMode].Gamedata[lastSelectedchapter_of_gamemode].LevelUnlocked[Get_LastUnlockedLevelOfGameMode(LastSelectedGameMode)+1]= true;
    }

    public bool Get_LevelUnlockStatusOfCurrentGameMode(int _level) 
    {
        // return Gamemode[LastSelectedGameMode].Gamedata[lastSelectedchapter_of_gamemode].LevelUnlocked[_level];
        return GameData[LastSelectedGameMode].LevelUnlocked[_level];

    }

    public bool Get_ModeUnlockStatus(int mode)
    {
        //if (mode > Gamemode[LastSelectedGameMode].Gamedata.Length)
        //    return true;
        //else
        //    return Gamemode[LastSelectedGameMode].Gamedata[mode].Modeunlocked;
        if (mode > GameData.Length)
            return true;
        else
            return GameData[mode].Modeunlocked;
    }
    public string Get_CurGameModeName(int index)
    {


        switch (index)
        {
            case 0:
                return Constants.gameModeName_Mode1;
                break;
            case 1:
                return Constants.gameModeName_Mode2;
                break;
            case 2:
                return Constants.gameModeName_Mode3;
                break;
            case 3:
                return Constants.gameModeName_Mode4;
                break;
            case 4:
                return Constants.gameModeName_Mode5;
                break;
            case 5:
                return Constants.gameModeName_Mode6;
                break;
            default:
                return Constants.gameModeName_Mode1;
                break;
        }
    }
    public string Get_CurGameLevelName(int index)
    {


        switch (index)
        {
            case 0:
                return Constants.gameLevel1;
                break;
            case 1:
                return Constants.gameLevel2;
                break;
            case 2:
                return Constants.gameLevel3;
                break;
            case 3:
                return Constants.gameLevel4;
                break;
            case 4:
                return Constants.gameLevel4;
                break;
            case 5:
                return Constants.gameLevel5;
                break;
            case 6:
                return Constants.gameLevel6;
                break;
            case 7:
                return Constants.gameLevel7;
                break;
            case 8:
                return Constants.gameLevel8;
                break;
            case 9:
                return Constants.gameLevel9;
                break;
            case 10:
                return Constants.gameLevel10;
                break;
            case 11:
                return Constants.gameLevel11;
                break;
            case 12:
                return Constants.gameLevel12;
                break;
            case 13:
                return Constants.gameLevel13;
                break;
            case 14:
                return Constants.gameLevel14;
                break;
            case 15:
                return Constants.gameLevel15;
                break;
            case 16:
                return Constants.gameLevel16;
                break;
            case 17:
                return Constants.gameLevel17;
                break;
            default:
                return Constants.gameLevel18;
                break;
        }
    }
    public int Set_ModeUnlockStatus(int mode)
    {
        //for (int i = 0; i < GameData[LastSelectedGameMode].Gamedata.Length; i++)
        //{
        //    if (!Gamemode[LastSelectedGameMode].Gamedata[i].Modeunlocked)
        //    {
        //        mode--;

        //        if (mode == 0)
        //        {

        //            return i;
        //        }
        //    }
        //}
        ////Less items than value are locked
        //return -1;
        for (int i = 0; i < GameData.Length; i++)
        {
            if (!GameData[i].Modeunlocked)
            {
                mode--;

                if (mode == 0)
                {

                    return i;
                }
            }
        }
        //Less items than value are locked
        return -1;
    }

    public int Get_LevelStarsOfCurrentGameMode(int _level)
    {
          return  GameData[LastSelectedGameMode].Levelstar[_level];
        //return Gamemode[lastSelectedGameMode].Gamedata[lastSelectedchapter_of_gamemode].Levelstar[_level];
    }

    //wiil return the _val number locked item from the store. e.g 1 will return the first locked
    public int GetLockedItemIndex(int _val) {

        for (int i = 0; i < vehiclesUnlocked.Length; i++)
        {
          //  Debug.Log("i :"+i); 
            if (!vehiclesUnlocked[i]) {

                _val--;

                if (_val == 0) {

                    return i;
                }
            }
        }

        //Less items than value are locked
        return -1;
    }
    public void WeaponUnlock_Try(int weapon,bool _val)
    {
        vehiclesUnlocked[weapon] = _val;
    }

    public bool AreAllLevelsUnlocked()
    {
        //for (int i = 0; i < Gamemode[LastSelectedGameMode].Gamedata[lastSelectedchapter_of_gamemode].LevelUnlocked.Length; i++)
        //{

        //    if (!Gamemode[LastSelectedGameMode].Gamedata[lastSelectedchapter_of_gamemode].LevelUnlocked[i])
        //        return false;

        //}
        //return true
        for (int i = 0; i < GameData[LastSelectedGameMode].LevelUnlocked.Length; i++)
        {

            if (!GameData[LastSelectedGameMode].LevelUnlocked[i])
                return false;

        }
        return true;
    }
    public void AllLevelslocked()
    {
        //for (int i = 0; i < Gamemode[LastSelectedGameMode].Gamedata[lastSelectedchapter_of_gamemode].LevelUnlocked.Length; i++)
        //{
        //    if (i == 0)
        //    {
        //        Gamemode[LastSelectedGameMode].Gamedata[lastSelectedchapter_of_gamemode].LevelUnlocked[i] = true;
        //        Gamemode[LastSelectedGameMode].Gamedata[lastSelectedchapter_of_gamemode].LastselectedlevelofChapter = i;
        //    }
        //    else
        //        Gamemode[LastSelectedGameMode].Gamedata[lastSelectedchapter_of_gamemode].LevelUnlocked[i] = false;
        //} 
        for (int i = 0; i < GameData[LastSelectedGameMode].LevelUnlocked.Length; i++)
        {
            if (i == 0)
            {
               GameData[LastSelectedGameMode].LevelUnlocked[i] = true;
                GameData[LastSelectedGameMode].LastselectedlevelofChapter = i;
            }
            else
                GameData[LastSelectedGameMode].LevelUnlocked[i] = false;
        }
    }
    public bool AreAllVehiclesUnlocked()
    {
        for (int i = 0; i < vehiclesUnlocked.Length; i++)
        {
            if (!vehiclesUnlocked[i]) 
            {

                //Debug.LogError("All vehicles --NOT-- unlocked");
                return false;
            }
            
        }
        //Debug.LogError("All vehicles are unlocked");
        return true;
    }

    public void UnlockAllVehicles()
    {

        for (int i = 0; i < vehiclesUnlocked.Length; i++)
        {
            if (!vehiclesUnlocked[i])
            {
                vehiclesUnlocked[i] = true;
            }
        }
        unlockallVehicles = true;
    }

    public void AllModeUnlocked()
    {
        for (int i = 0; i < GameData.Length; i++)
        {
            GameData[i].Modeunlocked = true;
        }
        unlockallModes = true;
        //for (int i = 0; i < Gamemode[lastSelectedGameMode].Gamedata.Length - 2; i++)
        //{
        //    Gamemode[lastSelectedGameMode].Gamedata[i].Modeunlocked = true;
        //}
        //unlockallchapter = true;
    }
    public void UnlockAllLevels()
    {
        //for (int m = 0; m<Gamemode.Length; m++)
        //{
        //    for (int i = 0; i < Gamemode[m].Gamedata.Length ; i++)
        //    {
        //        for (int l = 0; l < Gamemode[m].Gamedata[i].LevelUnlocked.Length; l++)
        //        {
        //            if (!Gamemode[m].Gamedata[i].LevelUnlocked[l])
        //            {
        //                Gamemode[m].Gamedata[i].LevelUnlocked[l] = true;
        //            }
        //        }
        //    }
        //}
        //unlockalllevel = true;
        //Mode2Unlocked = true;
        for (int i = 0; i < GameData.Length; i++)
        {
            for (int l = 0; l < GameData[i].LevelUnlocked.Length; l++)
            {
                if (!GameData[i].LevelUnlocked[l])
                {
                    GameData[i].LevelUnlocked[l] = true;
                }
            }
        }
        unlockallLevel = true;
    }

    public bool Is_DeviceConditionBad()
    {
        if (IsDetectVeryCheapDevice)
            return true;
        else if (IsDetectLowCheapDevice)
            return true;
        else if (IsDetectMediumCheapDevice)
            return false;
        else
            return false;
    }

    public bool GameAudio { get => gameAudio; set => gameAudio = value; }
    public bool GameSound { get => gameSound; set => gameSound = value; }
    public int GoldCoins { get => goldCoins; set { 

            goldCoins = value; 
            //Toolbox.GameManager.UpdateCoinsTxtHandling();
        }  
    }
    //public int HighScore { get => highScore; set => highScore = value; }
    public bool FirstRun { get => firstRun; set => firstRun = value; }
    public bool AppRated { get => appRated; set => appRated = value; }
    public Controls SelectedControltype;
    //public string PlayerName { get => playerName; set => playerName = value; }
    public int LastSelectedVehicle { get => lastSelectedVehicle; set => lastSelectedVehicle = value; }
    public bool[] VehiclesUnlocked { get => vehiclesUnlocked; set => vehiclesUnlocked = value; }
    public int LastSelectedGameMode { get => lastSelectedGameMode; set => lastSelectedGameMode = value; }
    public DateTime NextDailyRewardTime { get => nextDailyRewardTime; set => nextDailyRewardTime = value; }
    //public DateTime ClassicMode_UnlockDateTime { get => classicMode_unlockDateTime; set => classicMode_unlockDateTime = value; }
    public int DailyRewardDay { get => dailyRewardDay; set => dailyRewardDay = value; }
    public bool NoAdsPurchased { get => noAdsPurchased; set => noAdsPurchased = value; }
    public float SoundVolume { get => soundVolume; set => soundVolume = value; }
    public float MusicVolume { get => musicVolume; set => musicVolume = value; }
    public int DynamicDailyRewardItemNumber1 { get => dynamicDailyRewardItemNumber1; set => dynamicDailyRewardItemNumber1 = value; }
    public bool UserConsent { get => userConsent; set => userConsent = value; }
    public int LastLevelStartAnimation { get => lastLevelStartAnimation; set => lastLevelStartAnimation = value; }
    public bool MegaOfferPurchased { get => megaOfferPurchased; set => megaOfferPurchased = value; }
    public bool UnlockallLevel { get => unlockallLevel; set => unlockallLevel = value; }
    public bool UnlockallVehciles { get => unlockallVehicles; set => unlockallVehicles = value; }
    public string LastSelectedscenename { get => lastSelectedscenename; set => lastSelectedscenename = value; }
    public bool UnlockallModes { get => unlockallModes; set => unlockallModes = value; }
   // public GameMode[] Gamemode { get => gamemode; set => gamemode = value; }
    public bool Modesautoscroller { get => modesautoscroller; set => modesautoscroller = value; }
    public string DailyRewardTime { get => dailyRewardTime; set => dailyRewardTime = value; }
    public bool Dailyrewardclaimed { get => dailyrewardclaimed; set => dailyrewardclaimed = value; }
    public bool PurchasingInapp { get => purchasingInapp; set => purchasingInapp = value; }
    public bool DeviceSpecificationCheck { get => deviceSpecificationCheck; set => deviceSpecificationCheck = value; }
    public bool IsDetectVeryCheapDevice { get => isDetectVeryCheapDevice; set => isDetectVeryCheapDevice = value; }
    public bool IsDetectLowCheapDevice { get => isDetectLowCheapDevice; set => isDetectLowCheapDevice = value; }
    public bool IsDetectMediumCheapDevice { get => isDetectMediumCheapDevice; set => isDetectMediumCheapDevice = value; }
    public bool Tutorialshowfirsttime { get => tutorialshowfirsttime; set => tutorialshowfirsttime = value; }
    public GameData[] GameData { get => gamedata; set => gamedata = value; }
}

[System.Serializable]
public class GameData
{
    public string Name;
    [SerializeField] private bool[] levelUnlocked;
    [SerializeField] private int[] levelstar;
    [SerializeField] private int lastselectedlevelofchapter;
    [SerializeField] private bool modeunlocked;
    //[SerializeField] private bool specialMissionhave = false;
    public bool[] LevelUnlocked { get => levelUnlocked; set => levelUnlocked = value; }
    public int[] Levelstar { get => levelstar; set => levelstar = value; }
    public int LastselectedlevelofChapter { get => lastselectedlevelofchapter; set => lastselectedlevelofchapter = value; }
    public bool Modeunlocked { get => modeunlocked; set => modeunlocked = value; }
   // public bool SpecialMissionhave { get => specialMissionhave; set => specialMissionhave = value; }

    public int GetlastUnlockedLevel()
    {
        for (int i = 0; i < levelUnlocked.Length; i++)
        {
            if (!levelUnlocked[i])
            {
                return i-1;
            }
        }
        return levelUnlocked.Length-1;
    }

}
[System.Serializable]
public class GameMode
{
    public string Name;
    [SerializeField]private GameData[] gamedata;
    public GameData[] Gamedata { get => gamedata; set => gamedata = value; }
}

public enum Controls {Touch,steering,Gyro}
public class DB : MonoBehaviour {

    [SerializeField] private Prefs_Data prefs;

    public Prefs_Data Prefs { get => prefs; set => prefs = value; }

    private void Awake()
    {
        // Load_Binary_Prefs();
        //if (PlayerPrefs.HasKey("NextDailyRewardTime"))
        //{
        //    long temp = Convert.ToInt64(PlayerPrefs.GetString("NextDailyRewardTime"));
        //    print("NextDailyRewardTime :" + temp);
        //    prefs.NextDailyRewardTime = DateTime.FromBinary(temp);
        //}
       // print("NextDailyRewardTime :"+prefs.NextDailyRewardTime);
        Initialize_Prefs();
    }


    #region Save-LOAD
    private void Initialize_Prefs()
    {
        string jsonString = JsonUtility.ToJson(prefs);
        string str = PlayerPrefs.GetString("Prefs");

        try
        {
            if (PlayerPrefs.GetInt(Application.version) == 0)
            {
                PlayerPrefs.SetInt(Application.version, 1);
               //Debug.Log("FirstRun67");
                Save_Json_Prefs();
            }
            else
            {
                if (!PlayerPrefs.HasKey("Prefs") && Prefs.FirstRun)
                {
                    Prefs.FirstRun = false;
                    //Debug.Log("jsonStringWasEmpty");
                    Save_Json_Prefs();
                }
                else
                {
                    //Debug.Log("jsonStringWasNotEmpty:");
                    Load_Json_Prefs();
                }
            }
        }
        catch (Exception E)
        {
            
        }

    }
    public void Save_Json_Prefs()
    {
        try
        {
            //Debug.Log("Data Saved");
             //prefs.Healthinjectiontime = prefs.Dailyhealthinjectiontime.ToString();
             //prefs.DailyRewardTime = prefs.NextDailyRewardTime.ToString();
             //prefs.Airdropdatetime = prefs.Airdroptime.ToString();
             string jsonString = JsonUtility.ToJson(prefs);
             PlayerPrefs.SetString("Prefs", jsonString);
            //print(" Save_Json_Prefs :"+ PlayerPrefs.GetString("Prefs"));
           // Load_Json_Prefs();
        }
        catch (Exception E)
        { 

        }
    }

    private void Load_Json_Prefs()
    {
        try
        {
            
            string jsonString = PlayerPrefs.GetString("Prefs");
            prefs = JsonUtility.FromJson<Prefs_Data>(jsonString);
            //prefs.Dailyhealthinjectiontime = Convert.ToDateTime(prefs.Healthinjectiontime);
            //prefs.NextDailyRewardTime = Convert.ToDateTime(prefs.DailyRewardTime);
            //prefs.Airdroptime = Convert.ToDateTime(Prefs.Airdropdatetime);
            //print(" Load_Json_Prefs :" + PlayerPrefs.GetString("Prefs"));
            //Prefs_Data loadedprefs = JsonUtility.FromJson<Prefs_Data>(jsonString);
            //if (IsDefaultFileStructureDifferentFromSavedOne(loadedprefs))
            //{
            //    HandleChanges(loadedprefs);
            //}
            //else
            //{
            //    prefs = loadedprefs;
            //}
        }
        catch (Exception E)
        {
            
        }
    }

    //private void Update()
    //{
    //    if (Input.GetKey("escape"))
    //    {
    //        print("Save_Json_Prefs_escape");
    //        Save_Json_Prefs();
    //    }

    //}
    //public void Save_Binary_Prefs()
    //{


    //    string path = GetFilePath();

    //    BinaryFormatter formatter = new BinaryFormatter();

    //    FileStream file = new FileStream(path, FileMode.Create);

    //    formatter.Serialize(file, prefs);

    //    file.Close();
    //}

    //private void Load_Binary_Prefs()
    //{


    //    string path = GetFilePath();
    //    if (File.Exists(path))
    //    {
    //        BinaryFormatter formatter = new BinaryFormatter();

    //        FileStream file = new FileStream(path, FileMode.Open);

    //        Prefs_Data loadedPrefs = formatter.Deserialize(file) as Prefs_Data;

    //        file.Close();

    //        if (IsDefaultFileStructureDifferentFromSavedOne(loadedPrefs))
    //        {
    //            HandleChanges(loadedPrefs);
    //        }
    //        else
    //        {
    //            prefs = loadedPrefs;
    //        }
    //    }
    //    else
    //    {
    //        Save_Binary_Prefs();
    //    }
    //}

    private void HandleChanges(Prefs_Data loadedPrefs)
    {
        GameData[] mode = prefs.GameData;
       // print("Current GameData Length :" + mode.Length + "loaded GameData Length: " + loadedPrefs.Gamemode.Length);
       // print("Current GameData LEVELLength :" + mode[10].Gamedata[0].LevelUnlocked.Length + "loaded GameData LEVELLength: " + loadedPrefs.Gamemode[10].Gamedata[0].LevelUnlocked.Length);

        //for (int i = 0; i < loadedPrefs.Gamemode.Length; i++)
        //{
            for (int j = 0; j < loadedPrefs.GameData.Length; j++)
            {

                //mode[i] = loadedPrefs.GameData[j];
                //mode[i].Gamedata[j] = loadedPrefs.Gamemode[i].Gamedata[j];
                for (int k = 0; k < loadedPrefs.GameData[j].LevelUnlocked.Length; j++)
                {
                    mode[j].LevelUnlocked[k] = loadedPrefs.GameData[j].LevelUnlocked[k];
                    mode[j].Levelstar[k] = loadedPrefs.GameData[j].Levelstar[k];
                }
                //  data[i].Levelstar[j] = loadedPrefs.GameData[i].Levelstar[j];
                //data[i].LevelUnlocked[j] = loadedPrefs.GameData[i].LevelUnlocked[j];
                //data[i].Levelstar[j] = loadedPrefs.GameData[i].Levelstar[j];
            }
        //}
        // prefs = loadedPrefs;
        // prefs.Gamemode = data;

    }

    public bool IsDefaultFileStructureDifferentFromSavedOne(Prefs_Data _loadedPrefs)
    {

        if (prefs.GameData.Length != _loadedPrefs.GameData.Length)
        {
            //if (Toolbox.GameManager)
               // Toolbox.GameManager.Log("No Of Modes Different in File Structure");
            return true;
        }


        else
        {
            //if (Toolbox.GameManager)
              //  Toolbox.GameManager.Log("Same Modes File Structure :"+ prefs.Gamemode.Length);
            //for (int m = 0; m < prefs.Gamemode.Length; m++)
            //{
                for (int c = 0; c < prefs.GameData.Length; c++)
                {
                    if (prefs.GameData.Length != _loadedPrefs.GameData.Length)
                    {
                        //if (Toolbox.GameManager)
                        //    Toolbox.GameManager.Log("Different File Structure Compare Btw No of Chapters");
                        return true;
                    }
                    else
                    {
                       // if (Toolbox.GameManager)
                         //   Toolbox.GameManager.Log("Same Chapters File Structure");
                        //return false;
                    }
                    if (prefs.GameData[c].LevelUnlocked.Length != _loadedPrefs.GameData[c].LevelUnlocked.Length
                            || prefs.GameData[c].Levelstar.Length != _loadedPrefs.GameData[c].Levelstar.Length)
                    {
                        //if (Toolbox.GameManager)
                        //    Toolbox.GameManager.Log("Different File Structure Compare Btw No of Levels and Levels stars");
                        return true;
                    }
                    else
                    {
                        //if (Toolbox.GameManager)
                        //    Toolbox.GameManager.Log("Same Levels and stars File Structure");
                    }
                    //for (int L = 0; L < prefs.Gamemode[m].Gamedata[c].LevelUnlocked.Length; L++)
                    //{
                    //    if ( prefs.Gamemode[m].Gamedata[c].LevelUnlocked.Length != _loadedPrefs.Gamemode[m].Gamedata[c].LevelUnlocked.Length
                    //         || prefs.Gamemode[m].Gamedata[c].Levelstar.Length != _loadedPrefs.Gamemode[m].Gamedata[c].Levelstar.Length)
                    //    {
                    //        if (Toolbox.GameManager)
                    //            Toolbox.GameManager.Log("Different File Structure Compare Btw No of Levels and Levels stars");
                    //        return true;
                    //    }
                    //    else
                    //    {
                    //        if (Toolbox.GameManager)
                    //            Toolbox.GameManager.Log("Same Levels and stars File Structure");
                    //        print("Current GameData LEVELLength :" + prefs.Gamemode[m].Gamedata[c].LevelUnlocked.Length + "loaded GameData LEVELLength: " + _loadedPrefs.Gamemode[m].Gamedata[c].LevelUnlocked.Length);  
                    //        return false;
                    //    }
                    //}
                }
            //}
            return false;
        }
        //if (prefs.LevelsUnlocked_Mode1.Length > _loadedPrefs.LevelsUnlocked_Mode1.Length ||
        //    prefs.LevelsUnlocked_Mode2.Length > _loadedPrefs.LevelsUnlocked_Mode2.Length ||
        //    prefs.LevelsStars_Mode1.Length > _loadedPrefs.LevelsStars_Mode1.Length ||
        //    prefs.LevelsStars_Mode2.Length > _loadedPrefs.LevelsStars_Mode2.Length ||
        //    prefs.VehiclesUnlocked.Length > _loadedPrefs.VehiclesUnlocked.Length
        //    )
        //{
        //    if (Toolbox.GameManager)
        //        Toolbox.GameManager.Log("Different File Structure");

        //    return true;
        //}
        //else
        //{
        //    if (Toolbox.GameManager)
        //        Toolbox.GameManager.Log("Same File Structure");
        //    return false;
        //}
    }

    //string GetFilePath()
    //{
    //    return Application.persistentDataPath + "/" + Constants.prefsFileName;
    //}

    #endregion



}
