using UnityEngine;
//using UnityEngine.Scripting;
public class LevelsManager : MonoBehaviour
{
    

    private void Start()
    {
      //  GarbageCollector.GCMode = GarbageCollector.Mode.Disabled;
        LevelStartHandling();
    }
    private void LevelStartHandling()
    {
        LevelDataHandling();
        SpawnLevel();

    }

    private void SpawnLevel()
    {
        GameObject levelObj;
     //   print("Path :"+ Constants.folderPath_Prefabs + Constants.folderPath_Prefabs_Levels_Mode + Toolbox.DB.Prefs.LastSelectedGameMode + "/" + Toolbox.DB.Prefs.Get_LastSelectedLevelOfCurrentGameMode());
        levelObj = Resources.Load<GameObject>(Constants.folderPath_Prefabs + Constants.folderPath_Prefabs_Levels_Mode + Toolbox.DB.Prefs.LastSelectedGameMode+ "/" + Toolbox.DB.Prefs.Get_LastSelectedLevelOfCurrentGameMode());
        Instantiate(levelObj, Vector3.zero, Quaternion.identity, this.transform);
    }

    private void LevelDataHandling()
    {
         print("Path :"+ Constants.folderPath_Scriptables + Constants.folderPath_Scriptables_Levels + Toolbox.DB.Prefs.LastSelectedGameMode + "/" + Toolbox.DB.Prefs.Get_LastSelectedLevelOfCurrentGameMode());
        Toolbox.GameplayController.SelectedLevelData = Resources.Load<LevelsData>(Constants.folderPath_Scriptables + Constants.folderPath_Scriptables_Levels + Toolbox.DB.Prefs.LastSelectedGameMode + "/" + Toolbox.DB.Prefs.Get_LastSelectedLevelOfCurrentGameMode());
        //Toolbox.HUDListner.SetTime(levelData.time);
        Toolbox.HUDListner.SetTotalLives(Toolbox.GameplayController.SelectedLevelData.Lives);
        Toolbox.GameplayController.Lives = Toolbox.GameplayController.SelectedLevelData.Lives;
    }

}
