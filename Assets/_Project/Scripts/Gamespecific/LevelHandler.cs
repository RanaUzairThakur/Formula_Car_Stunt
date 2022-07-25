using System.Collections.Generic;
using UnityEngine;

public class LevelHandler : MonoBehaviour
{
    public Transform vehicleSpawnPoint;
    public GameObject endCamera;
    public GameObject Fireworks;
    public GameObject CharacterModel;
    public List<GameObject> Finalvehicleslist;
    public List<GameObject> Custcene;
    [Tooltip("This is used for skybox")]
    public Material Skybox;
    public List<GameObject> ListofProsOptmization;
    public AudioClip Soundsforspecificlevel;
    //[Tooltip("This is only used in level 1 for tutorial")]
    //public GameObject tutorialCam;

    private void Start()
    {


        // Optimization();
        LevelStartHandling();
        RenderSettings.skybox = Skybox;
    }
    private void Optimization()
    {
        if (Toolbox.DB.Prefs.IsDetectVeryCheapDevice)
        {
            foreach (GameObject g in ListofProsOptmization)
                g.SetActive(false);
        }
        else if (Toolbox.DB.Prefs.IsDetectLowCheapDevice)
        {
            foreach (GameObject g in ListofProsOptmization)
                g.SetActive(true);
        }
        else if (Toolbox.DB.Prefs.IsDetectMediumCheapDevice)
        {
            foreach (GameObject g in ListofProsOptmization)
                g.SetActive(true);
        }
        else
        {
            foreach (GameObject g in ListofProsOptmization)
                g.SetActive(true);
        }
    }

    public void LevelStartHandling()
    {


        Toolbox.GameplayController.Levelhandler = this;
        if (Soundsforspecificlevel)
            Toolbox.Soundmanager.PlayMusic_Game(Soundsforspecificlevel);
        SpawnVehicle();
    }


    private void SpawnVehicle()
    {
        print("Path :" + Constants.folderPath_Prefabs + Constants.folderPath_Prefabs_PlayerVehicles + Toolbox.DB.Prefs.LastSelectedVehicle);

        Toolbox.GameplayController.SelectedVehiclePrefab = Resources.Load<GameObject>(Constants.folderPath_Prefabs + Constants.folderPath_Prefabs_PlayerVehicles + Toolbox.DB.Prefs.LastSelectedVehicle);
        Toolbox.GameplayController.VehicleSpawnPoint = vehicleSpawnPoint;
        //Toolbox.GameplayController.SpawnVehicle();
        Toolbox.GameplayController.Level_Andcutscenehandling();
    }
}
