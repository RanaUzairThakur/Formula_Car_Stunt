using UnityEngine;
using System.Collections.Generic;

public class LevelHandler : MonoBehaviour
{
    public Transform vehicleSpawnPoint;
    public GameObject endCamera;
    public GameObject Fireworks;
    public GameObject CharacterModel;
    public List<GameObject> Finalvehicleslist;

    //[Tooltip("This is only used in level 1 for tutorial")]
    //public AudioSource audienceAudioSource;
    //[Tooltip("This is only used in level 1 for tutorial")]
    //public GameObject tutorialCam;

    private void Start()
    {
        //vehicleSpawnPoint = this.GetComponentInChildren<StartAnimationHandler>().GetSpawnPoint();

        LevelStartHandling();
        //if(audienceAudioSource)
        //    Toolbox.GameplayController.Level3DAudioSource = audienceAudioSource;
        //if (tutorialCam)
        //    Toolbox.GameplayController.TutorialCamera = tutorialCam;
    }
  

    public void LevelStartHandling() {

        FetchCurrentLevelData();
        SpawnVehicle();
        Toolbox.GameplayController.Levelhandler = this;
        //Toolbox.GameplayController.LevelEndCamera = endCamera;
    }

    private void FetchCurrentLevelData()
    {
        Toolbox.GameplayController.SelecetdLevelData = Resources.Load<LevelsData>(Constants.folderPath_Scriptables + Constants.folderPath_Scriptables_Levels + Toolbox.DB.Prefs.LastSelectedGameMode + "/" + Toolbox.DB.Prefs.Get_LastSelectedLevelOfCurrentGameMode());
    }

    private void SpawnVehicle()
    {
        Toolbox.GameplayController.SelectedVehiclePrefab = Resources.LoadAll<GameObject>(Constants.folderPath_Prefabs + Constants.folderPath_Prefabs_PlayerVehicles)[Toolbox.DB.Prefs.LastSelectedVehicle];
        Toolbox.GameplayController.VehicleSpawnPoint = vehicleSpawnPoint;
        Toolbox.GameplayController.SpawnVehicle();
    }
}
