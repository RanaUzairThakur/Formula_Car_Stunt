//using Cinemachine;
using System.Collections;
using UnityEngine;

/// <summary>
/// This script will hold everything that is needed to be global only in Game scene
/// </summary>
public class GameplayController : MonoBehaviour
{

    //public Material[] skyboxes;
    public GameObject Rcccamera;
    public Transform VehicleSpawnPoint;
    private LevelsData selecetdLevelData;
    private GameObject selectedVehiclePrefab;
    private RCC_CarControllerV3 selectedVehicleRccv3;
    private LevelHandler levelhandler;

    private bool levelComplete = false;
    private bool levelFail = false;
    private bool isRevived = false;
    private int lives = 3;
    public bool LevelComplete { get => levelComplete; set => levelComplete = value; }
    public bool LevelFail { get => levelFail; set => levelFail = value; }
    public bool IsRevived { get => isRevived; set => isRevived = value; }
    public LevelsData SelecetdLevelData { get => selecetdLevelData; set => selecetdLevelData = value; }
    public GameObject SelectedVehiclePrefab { get => selectedVehiclePrefab; set => selectedVehiclePrefab = value; }
    public LevelHandler Levelhandler { get => levelhandler; set => levelhandler = value; }
    public RCC_CarControllerV3 SelectedVehicleRccv3 { get => selectedVehicleRccv3; set => selectedVehicleRccv3 = value; }
    public int Lives { get => lives; set => lives = value; }

    void Awake()
    {
        Toolbox.Set_GameplayScript(this);
        Time.timeScale = 1;
    }
    void Start()
    {
        Toolbox.Soundmanager.PlayMusic_Game(Random.Range(0, Toolbox.Soundmanager.gameBG.Length));
        Toolbox.GameManager.FBAnalytic_EventLevel_Started(Toolbox.GameManager.Get_CurGameModeName(), Toolbox.DB.Prefs.Get_LastSelectedLevelOfCurrentGameMode());
        Toolbox.GameManager.Analytics_ProgressionEvent_Start(Toolbox.GameManager.Get_CurGameModeName(), Toolbox.DB.Prefs.Get_LastSelectedLevelOfCurrentGameMode());
    }

    public void SpawnVehicle()
    {
        if (selectedVehiclePrefab)
        {
            selectedVehiclePrefab = Instantiate(selectedVehiclePrefab, VehicleSpawnPoint.position, VehicleSpawnPoint.rotation);
            selectedVehicleRccv3 = selectedVehiclePrefab.GetComponent<RCC_CarControllerV3>();
          //  Rcccamera.GetComponent<RCC_Camera>().SetTarget(selectedVehiclePrefab);
            Rcccamera.SetActive(true);
            HUD_Status(true);
            
        }

    }

    public void finish_Effect()
    {
        HUD_Status(false);
        SelectedVehiclePrefab.GetComponent<Rigidbody>().drag = 2f;
        Toolbox.HUDListner.setstatus_FadeEffect(true);
        Levelhandler.Fireworks.SetActive(true);
        Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.AudienceAppreciation);
        Toolbox.Soundmanager.Stop_PlayingMusic();
        Invoke(nameof(EndEffect_character),1.5f);
        StartCoroutine(LevelComplete_Delay(6f));
    }

    private void EndEffect_character()
    {
        Toolbox.HUDListner.setstatus_FadeEffect(false);
        Rcccamera.SetActive(false);
        Levelhandler.endCamera.SetActive(true);
        selectedVehiclePrefab.SetActive(false);
        levelhandler.CharacterModel.SetActive(true);
        levelhandler.Finalvehicleslist[Toolbox.DB.Prefs.LastSelectedVehicle].SetActive(true);
    }
    public void HUD_Status(bool _val)
    {
        Toolbox.HUDListner.handleplayerhud(_val);
        Toolbox.HUDListner.Set_PlayerControls(_val);
        Toolbox.HUDListner.pauseBtn.gameObject.SetActive(_val);
        Toolbox.HUDListner.gameObject.SetActive(_val);
        Toolbox.HUDListner.set_statusLevelCounter();
    }
    public IEnumerator LevelComplete_Delay(float delay)
    {
        yield return new WaitForSeconds(delay + 1f);
        LevelCompleteHandling();
        StopCoroutine(LevelComplete_Delay(0.1f));
        // Invoke("LevelCompleteHandling",delay+1);
    }
    public void LevelCompleteHandling()
    {

        if (LevelComplete || LevelFail)
            return;

        LevelComplete = true;

        //HUD_Status(false);
        if ((!Toolbox.DB.Prefs.AppRated && Toolbox.DB.Prefs.Get_LastSelectedLevelOfCurrentGameMode() == 2) || (!Toolbox.DB.Prefs.AppRated && Toolbox.DB.Prefs.Get_LastSelectedLevelOfCurrentGameMode() == 5))
        {
            Toolbox.HUDListner.RateUs_Panel.SetActive(true);
            // Toolbox.GameManager.InstantiateUI_RateUs();
        }

        else
        {
            Toolbox.HUDListner.CompletePanel.SetActive(true);
            // Toolbox.GameManager.InstantiateUI_LevelComplete();
        }
    }
    public void LevelFail_Delay(float delay)
    {
        if (Lives > 0)
        {
            Resetvehicle();
        }
        else
        {
            if (Toolbox.HUDListner.MissionFailtext)
                Toolbox.HUDListner.MissionFailtext.SetActive(true);
            Invoke("LevelFailHandling", delay);
        }
       
    }
    public void LevelFailHandling()
    {
        
        if (LevelComplete || LevelFail)
            return;

        LevelFail = true;
        Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.levelFail);
        HUD_Status(false);
        Toolbox.HUDListner.FailPanel.SetActive(true);
    }

    public void CR_Revive()
    {
        HUD_Status(false);
        Toolbox.HUDListner.RevivePanel.SetActive(true);
        Toolbox.GameManager.Reviveplayer = true;

    }

    IEnumerator CR_ReviveAfterDelay()
    {

        yield return new WaitForSeconds(1);
        HUD_Status(false);
        Toolbox.HUDListner.RevivePanel.SetActive(true);

    }

    public void RevivePlayer()
    {

        if (LevelComplete || LevelFail)
            return;
        Time.timeScale = 1;
        LevelFail = false;
        IsRevived = true;
        HUD_Status(true);
        Toolbox.GameManager.FBAnalytic_EventDesign(Toolbox.GameManager.Get_CurGameModeName() + "_" + Toolbox.DB.Prefs.Get_LastSelectedLevelOfCurrentGameMode());

    }

    #region Vehiclestatus
    public void Resetvehicle()
    {
        if (SelectedVehiclePrefab)
            SelectedVehiclePrefab.GetComponent<PlayerTriggerListener>().set_StatusVehicleReset();
    }
    #endregion

}
