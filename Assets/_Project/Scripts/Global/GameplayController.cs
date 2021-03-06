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
    public StuntCameraHandler stuntcamera;
    public Transform VehicleSpawnPoint;
    private GameObject selectedVehiclePrefab;
    private RCC_CarControllerV3 selectedVehicleRccv3;
    private EffectListener effectsfx;
    private LevelHandler levelhandler;
    private LevelsData selectedLevelData;

    private bool levelComplete = false;
    private bool levelFail = false;
    private bool isRevived = false;
    private bool isFinish = false;
    private int lives = 3;

    public bool LevelComplete { get => levelComplete; set => levelComplete = value; }
    public bool LevelFail { get => levelFail; set => levelFail = value; }
    public bool IsRevived { get => isRevived; set => isRevived = value; }
    public GameObject SelectedVehiclePrefab { get => selectedVehiclePrefab; set => selectedVehiclePrefab = value; }
    public LevelHandler Levelhandler { get => levelhandler; set => levelhandler = value; }
    public RCC_CarControllerV3 SelectedVehicleRccv3 { get => selectedVehicleRccv3; set => selectedVehicleRccv3 = value; }
    public int Lives { get => lives; set => lives = value; }
    public LevelsData SelectedLevelData { get => selectedLevelData; set => selectedLevelData = value; }
    public bool IsFinish { get => isFinish; set => isFinish = value; }
    public EffectListener Effectsfx { get => effectsfx; set => effectsfx = value; }

    void Awake()
    {
        Toolbox.Set_GameplayScript(this);
        Time.timeScale = 1;
        LevelFail = false;
        LevelComplete = false;
        IsRevived = false;
        IsFinish = false;
    }
    void Start()
    {
        //if (Toolbox.DB.Prefs.LastSelectedGameMode < 2)
        //    Toolbox.Soundmanager.PlayMusic_Game(Random.Range(0, Toolbox.Soundmanager.gameBG.Length));
        //else
        //    Toolbox.Soundmanager.Set_MusicVolume(0.25f);

        if (Toolbox.DB.Prefs.LastSelectedGameMode > 2)
            Toolbox.Soundmanager.Set_MusicVolume(0.25f);
        else
            Toolbox.Soundmanager.Stop_PlayingMusic();


        Toolbox.GameManager.FBAnalytic_EventLevel_Started(Toolbox.GameManager.Get_CurGameModeName(), Toolbox.DB.Prefs.Get_LastSelectedLevelOfCurrentGameMode());
        Toolbox.GameManager.Analytics_ProgressionEvent_Start(Toolbox.GameManager.Get_CurGameModeName(), Toolbox.DB.Prefs.Get_LastSelectedLevelOfCurrentGameMode());
        if (Toolbox.DB.Prefs.LastSelectedGameMode > 1)
            RCC_Settings.Instance.behaviorSelectedIndex = 5;
        else
            RCC_Settings.Instance.behaviorSelectedIndex = 6;
    }




    public void SpawnVehicle()
    {
        if (SelectedVehiclePrefab)
        {
            Toolbox.GameManager.Log("SpawnVehicle");
            selectedVehiclePrefab = Instantiate(selectedVehiclePrefab, VehicleSpawnPoint.position, VehicleSpawnPoint.rotation);
            selectedVehicleRccv3 = selectedVehiclePrefab.GetComponent<RCC_CarControllerV3>();
            Effectsfx = selectedVehiclePrefab.GetComponent<EffectListener>();
            Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.StartEngineVoiceOver);
            Toolbox.HUDListner.set_statusEnginebutton(true);
           // Invoke(nameof(Startenginesound),2f);
            Toolbox.Soundmanager.Stop_PlayingMusic();
            // HUD_Status(true);
            // Rcccamera.SetActive(true);
            //Invoke(nameof(GamePlaysoundPlay), 5.5f);
            //if (selectedVehiclePrefab.GetComponent<EffectListener>())
            //    selectedVehiclePrefab.GetComponent<EffectListener>().Startcountdown();
            //else
            //{
            //    HUD_Status(true);
            //}
            Rcccamera.SetActive(true);
        }

    }

    public void Startenginesound()
    {
        Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.StartEngine);
        selectedVehicleRccv3.StartEngine(true);
        Toolbox.HUDListner.set_statusEnginebutton(false);
        if (selectedVehiclePrefab.GetComponent<EffectListener>())
            selectedVehiclePrefab.GetComponent<EffectListener>().Startcountdown();
        else
        {
            HUD_Status(true);
            Toolbox.Soundmanager.PlayMusic_Game(Random.Range(0, Toolbox.Soundmanager.gameBG.Length));
        }
        //CancelInvoke(nameof(Startenginesound));
    }
    private void GamePlaysoundPlay()
    {
        Toolbox.Soundmanager.PlayMusic_Game(Random.Range(0, Toolbox.Soundmanager.gameBG.Length));
        CancelInvoke(nameof(GamePlaysoundPlay));
    }
    public void Level_Andcutscenehandling()
    {


        if (SelectedLevelData.Hascutscene)
        {

            Optimization();
            //Invoke(nameof(Toolbox.CutsceneManager.FinishCutscene), Toolbox.CutsceneManager.Completetime);
            // levelhandler.Custcene.SetActive(true);
        }
        else
        {
            SpawnVehicle();
        }
    }

    private void Optimization()
    {
        if (Toolbox.DB.Prefs.IsDetectVeryCheapDevice)
        {
            foreach (GameObject g in levelhandler.Custcene)
                g.SetActive(false);
            SpawnVehicle();
        }
        else if (Toolbox.DB.Prefs.IsDetectLowCheapDevice)
        {
            // levelhandler.Custcene.SetActive(true);
            selectcutscene();
            //Toolbox.CutsceneManager.FinishCutscene();
        }
        else if (Toolbox.DB.Prefs.IsDetectMediumCheapDevice)
        {
            // levelhandler.Custcene.SetActive(true);
            selectcutscene();
            //Toolbox.CutsceneManager.FinishCutscene();
        }
        else
        {
            // levelhandler.Custcene.SetActive(true);
            selectcutscene();
            // Toolbox.CutsceneManager.FinishCutscene();
        }
    }

    private void selectcutscene()
    {
        int ran = Random.Range(0, levelhandler.Custcene.Count);
        if (levelhandler.Custcene[ran])
        {
            levelhandler.Custcene[ran].SetActive(true);
            Toolbox.CutsceneManager.FinishCutscene();
            //print("select cutscene :" + ran);
        }
    }
    public void UnloadAssetsFromMemory()
    {
        Resources.UnloadAsset(SelectedLevelData);
    }
    public void finish_Effect()
    {
        HUD_Status(false);
        SelectedVehiclePrefab.GetComponent<Rigidbody>().drag = 2f;
        Levelhandler.Fireworks.SetActive(true);
        Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.AudienceAppreciation);
        Toolbox.Soundmanager.Stop_PlayingMusic();
        if (Levelhandler.CharacterModel && Levelhandler.Finalvehicleslist.Count > 0)
        {
            Toolbox.HUDListner.setstatus_FadeEffect(true);
            Invoke(nameof(EndEffect_character), 2f);
            StartCoroutine(LevelComplete_Delay(6f));
        }
        else
        {
            Rcccamera.SetActive(false);
            Levelhandler.endCamera.SetActive(true);
            StartCoroutine(LevelComplete_Delay(3f));
        }
        IsFinish = true;
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
        // Toolbox.HUDListner.gameObject.SetActive(_val);
        // Toolbox.HUDListner.set_statusLevelCounter();
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
        //if ((!Toolbox.DB.Prefs.AppRated && Toolbox.DB.Prefs.Get_LastSelectedLevelOfCurrentGameMode() == 2) || (!Toolbox.DB.Prefs.AppRated && Toolbox.DB.Prefs.Get_LastSelectedLevelOfCurrentGameMode() == 5))
        //{
        //    Toolbox.HUDListner.RateUs_Panel.SetActive(true);
        //}

        //else
        //{
        //    Toolbox.HUDListner.CompletePanel.SetActive(true);
        //}
        Toolbox.HUDListner.CompletePanel.SetActive(true);

    }
    public void LevelFail_Delay(float delay)
    {
        if (LevelFail)
            return;
        if (Lives >= 0)
        {
            Resetvehicle();
        }
        else
        {
            if (Toolbox.HUDListner.MissionFailtext)
                Toolbox.HUDListner.MissionFailtext.SetActive(true);
            HUD_Status(false);
            Invoke("LevelFailHandling", delay);
        }

    }
    public void LevelFailHandling()
    {

        if (LevelComplete || LevelFail)
            return;

        LevelFail = true;
        Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.levelFail);
        if (Toolbox.HUDListner.MissionFailtext)
            Toolbox.HUDListner.MissionFailtext.SetActive(false);
        //HUD_Status(false);
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
        {
            SelectedVehiclePrefab.GetComponent<PlayerTriggerListener>().set_StatusVehicleReset();
            Toolbox.HUDListner.Setstatus_Lives();
        }
    }
    #endregion

}
