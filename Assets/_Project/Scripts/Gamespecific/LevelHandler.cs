using UnityEngine;
using System.Collections.Generic;

public class LevelHandler : MonoBehaviour
{
    public Transform vehicleSpawnPoint;
    public GameObject endCamera;
    public GameObject Fireworks;
    public GameObject CharacterModel;
    public List<GameObject> Finalvehicleslist;
    public GameObject Custcene;
    [Tooltip("This is used for skybox")]
    public Material Skybox;
    //public AudioSource audienceAudioSource;
    //[Tooltip("This is only used in level 1 for tutorial")]
    //public GameObject tutorialCam;

    private void Start()
    {
        //if (Toolbox.GameplayController.SelecetdLevelData.Hascutscene)
        //{
        //    FetchCurrentVehicleData();
        //    Toolbox.HUDListner.SetStatus_SkipAnimationButton(true);
        //    Custcene.SetActive(true);
        //}
        //else
        //{  
        //LevelStartHandling();
        //}
        //Invoke(nameof(LevelStartHandling),1f);
        LevelStartHandling();
        RenderSettings.skybox = Skybox;
    }


    public void LevelStartHandling() {

       
        Toolbox.GameplayController.Levelhandler = this;
        SpawnVehicle();
    }


    private void SpawnVehicle()
    {
        print("Path :" + Constants.folderPath_Prefabs + Constants.folderPath_Prefabs_PlayerVehicles + Toolbox.DB.Prefs.LastSelectedVehicle);

        Toolbox.GameplayController.SelectedVehiclePrefab = Resources.Load<GameObject>(Constants.folderPath_Prefabs + Constants.folderPath_Prefabs_PlayerVehicles+ Toolbox.DB.Prefs.LastSelectedVehicle);
        Toolbox.GameplayController.VehicleSpawnPoint = vehicleSpawnPoint;
        //Toolbox.GameplayController.SpawnVehicle();
        Toolbox.GameplayController.Level_Andcutscenehandling();
    }
}
