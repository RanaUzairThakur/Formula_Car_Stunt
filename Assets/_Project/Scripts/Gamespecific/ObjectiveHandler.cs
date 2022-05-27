using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Random = UnityEngine.Random;
public class ObjectiveHandler : MonoBehaviour
{
    public static ObjectiveHandler Instance;
   
    private int level;
    private int mode;
    private LevelsData selectedleveldata;
 
    public int Mode { get => mode; set => mode = value; }
    public int Level { get => level; set => level = value; }
    public LevelsData SelectedLevelData { get => selectedleveldata; set => selectedleveldata = value; }

    public void Awake()
    {
        Instance = this;
        Toolbox.Set_objectivehandler(this);
        level = Toolbox.DB.Prefs.Get_LastSelectedLevelOfCurrentGameMode();
        mode = Toolbox.DB.Prefs.LastSelectedGameMode;
        //Toolbox.GameManager.Log("LastSelectedLevelOfCurrentGameMode :" + Toolbox.DB.Prefs.Get_LastSelectedLevelOfCurrentGameMode());
        //Toolbox.GameManager.Log("LastSelectedGameMode :" + Toolbox.DB.Prefs.LastSelectedGameMode);
        init();
    }

    [HideInInspector]
    public int waveEnemyKilled;
    string statement;
    
    public void init()
    {
        //print("Load_LevelData");
        Load_LevelData();
    }
    private  void Load_LevelData()
    {
        SelectedLevelData = Resources.Load<LevelsData>(Constants.folderPath_Scriptables + Constants.folderPath_Scriptables_Levels + mode+ "/" + level);
    } 
    //public String GetMissionStatment()
    //{
    //    return Missionstatementcontroler.Selectstatement(level);
    //}
   
    public void UnloadAssetsFromMemory()
    {
        Resources.UnloadAsset(SelectedLevelData);
    
    }
}