//using GameAnalyticsSDK;
//using GoogleMobileAds.Api;
//using CnControls;
using System;
using UnityEngine;
using UnityEngine.UI;


[Serializable]
public class InputValues
{

    public float Throtle = 0f;
    public float Brake = 0f;
    public float steering = 0f;
    public float Boostinput = 0f;
    public float Handbrake = 0f;
}



public class HUDListner : MonoBehaviour
{
    /// <summary>
    /// UI menus
    /// </summary>
    public GameObject PausePanel;
    public GameObject FailPanel;
    public GameObject CompletePanel;
    public GameObject RevivePanel;
    public GameObject WatchVideoPanel;
    public GameObject RateUs_Panel;
    public GameObject Mega_OfferPanel;
    public GameObject Loadingpanel;
    public GameObject Message;
    public GameObject Fadeimage;
    /// <summary>
    /// Other Text 
    /// </summary>
    /// 
    public Text Speed;
    public Text totalLivesTxt;
    public Text LevelText;
    public GameObject Missioncompletetext;
    public GameObject MissionFailtext;
    public GameObject ObjectiveClear;
    public GameObject PlayerHudCanvas;
    public Button pauseBtn;
    public Button skipStartCinematicBtn;
    public GameObject playerControlsPanel;
    public CanvasGroup canvasGroup;
    //Controls 
    public GameObject Left, right, brake, race;
    public GameObject Steering;
    private Vector3 orgBrakeButtonPos;
    //private int time;
    private bool brakeinput;
    private bool brakepress;
    private  Rigidbody RCCV3rigidbody;
    private  RCC_CarControllerV3 RCCV3;

    public bool ShowInput = false;
    public InputValues inputs;
    public static float Throtle = 0f;
    public static float Brake = 0f;
    public static float steering = 0f;
    public static float Boostinput = 0f;
    public static float Handbrake = 0f;

    private void OnEnable()
    {
        Toolbox.Set_HUD(this);
    }


    private void Start()
    {
        if (brake)
            orgBrakeButtonPos = brake.transform.position;
        // Invoke("OnPress_OkTutorial", 0.5f);

        //if (!RCCV3)
        //{
        //    if (RCC_SceneManager.Instance.activePlayerVehicle)
        //    {
        //        RCCV3 = RCC_SceneManager.Instance.activePlayerVehicle;
        //        RCCV3rigidbody = RCC_SceneManager.Instance.activePlayerVehicle.GetComponent<Rigidbody>();
        //    }
        //}

        Throtle = 0f;
        Brake = 0f;
        steering = 0f;
        Boostinput = 0f;
        Handbrake = 0f;
    }
    private void OnDisable()
    {
    }

    private void Awake()
    {


        Toolbox.Set_HUD(this);

        if (Toolbox.GameManager.Call_ad_after_restart || Toolbox.GameManager.Call_ad_before_gameplay)
        {
            Toolbox.GameManager.Call_ad_after_restart = false;
            Toolbox.GameManager.Call_ad_before_gameplay = false;
            //try
            //{
            //    if (FindObjectOfType<AbstractAdsmanager>())
            //        FindObjectOfType<AbstractAdsmanager>().ShowInterstitial();
            //}
            //catch(Exception  e)
            //{
            //    //GameAnalytics.NewErrorEvent(GAErrorSeverity.Info, "AdsManager Instance Not Found!");


            //}

        }

        ShowBanner();
        Set_PlayerControls(false);

    }


    public void ShowBanner()
    {

        try
        {
            //if (FindObjectOfType<AbstractAdsmanager>())
            //    FindObjectOfType<AbstractAdsmanager>().ShowSmallBanner(GoogleMobileAds.Api.AdPosition.Top);
            if (FindObjectOfType<AdsManager>())
                FindObjectOfType<AdsManager>().ShowBanner("Default");
        }

        catch (Exception e)
        {
            //GameAnalytics.NewErrorEvent(GAErrorSeverity.Info, "AdsManager Instance Not Found!");

        }

    }

    void Update()
    {

        //if (Brake >0)
        //{
        //    if (RCCV3.direction == -1)
        //        RCCV3rigidbody.drag = 0.05f;
        //    else
        //        RCCV3rigidbody.drag = 5f;
        //}

        if (RCC_SceneManager.Instance.activePlayerVehicle)
            Setstatus_speed(RCC_SceneManager.Instance.activePlayerVehicle.speed);
        if (ShowInput)
        {
            inputs.Throtle = Throtle;
            inputs.Brake = Brake;
            inputs.steering = steering;
            inputs.Boostinput = Boostinput;
            inputs.Handbrake = Handbrake;
        }

    }

    public void SetTime(int _val)
    {
        //time = _val;
        //int min = time / 60;
        //   timeTxt.text = string.Format("{0:D2}:{1:D2}", min, time - (min * 60));
    }

    public void Setstatus_Lives()
    {
        totalLivesTxt.text = Toolbox.GameplayController.Lives.ToString();
    }
    public void Setstatus_speed(float speed)
    {
        Speed.text = speed.ToString("0");
    }

    public void SetTotalLives(int _val)
    {
        totalLivesTxt.text = _val.ToString();
    }

    //public float Get_Time() {

    //   return time;
    //}

    public void Set_PlayerControls(bool _val)
    {

        playerControlsPanel.SetActive(_val);
    }

    public void SetStatus_SkipAnimationButton(bool _val)
    {
        if (skipStartCinematicBtn.gameObject)
            skipStartCinematicBtn.gameObject.SetActive(_val);
    }

    public void Set_PlayerStatus(bool _val)
    {
        PlayerHudCanvas.SetActive(_val);
    }


    public void set_statusLevelCounter()
    {

        LevelText.text = Toolbox.DB.Prefs.Get_LastSelectedLevelOfCurrentGameMode().ToString();

    }

    public void Set_PlayerHealth()
    {
        Time.timeScale = 1.0f;
        //HealthInjection.GetComponent<InjectionListner>().StartTimer();

    }
    #region ButtonListners
    int i = 0;
    public void set_StatusRadioMusic()
    {
        Toolbox.Soundmanager.Stop_PlayingMusic();

        Toolbox.Soundmanager.PlayMusic_Game(i);
        i++;
        if (i >= Toolbox.Soundmanager.gameBG.Length)
        {
            i = 0;
        }
        //Debug.Log(i);
    }
    public void setstatus_MobileController(int index)
    {

        switch (index)
        {

            case 0:
                RCC.SetMobileController(RCC_Settings.MobileController.SteeringWheel);
                Steering.SetActive(true);
                Left.SetActive(false);
                right.SetActive(false);
                brake.SetActive(true);
                race.SetActive(true);
                break;
            case 1:
                RCC.SetMobileController(RCC_Settings.MobileController.Gyro);
                Steering.SetActive(false);
                Left.SetActive(false);
                right.SetActive(false);
                brake.SetActive(true);
                race.SetActive(true);
                brake.transform.position = Left.transform.position;
                break;
            case 2:
                RCC.SetMobileController(RCC_Settings.MobileController.TouchScreen);
                brake.transform.position = orgBrakeButtonPos;
                Steering.SetActive(false);
                Left.SetActive(true);
                right.SetActive(true);
                brake.SetActive(true);
                race.SetActive(true);
                break;
            default:
                RCC.SetMobileController(RCC_Settings.MobileController.TouchScreen);
                brake.transform.position = orgBrakeButtonPos;
                Steering.SetActive(false);
                Left.SetActive(true);
                right.SetActive(true);
                brake.SetActive(true);
                race.SetActive(true);
                break;

        }

    }
    public void OnPress_Pause()
    {
        Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.GameUIclicks);
        Toolbox.GameManager.Analytics_DesignEvent(Toolbox.GameManager.Get_CurGameModeName() + "_" + Toolbox.DB.Prefs.Get_LastSelectedLevelOfCurrentGameMode().ToString() + "Pause_sPress");
        Toolbox.GameManager.FBAnalytic_EventDesign(Toolbox.GameManager.Get_CurGameModeName() + "_" + Toolbox.DB.Prefs.Get_LastSelectedLevelOfCurrentGameMode().ToString() + "Pause_Press");
        PausePanel.SetActive(true);
        // Toolbox.GameManager.InstantiateUI_Pause();
    }



    public void OnPress_OkTutorial()
    {
        //print("OnPress_OkTutorial");
        Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.GameUIclicks);
        Set_PlayerControls(true);
        Set_PlayerStatus(true);
        SetStatus_SkipAnimationButton(false);
        set_statusLevelCounter();
    }

    public void SkipSAnimations()
    {
        Toolbox.CutsceneManager.SkipAnimation();
        // OnPress_OkTutorial();
    }

    public void handleplayerhud(bool _Val)
    {
        PlayerHudCanvas.gameObject.SetActive(_Val);
    }


    public void OnPress_resetButton()
    {
        Toolbox.GameplayController.Resetvehicle();
    }

    public static void onpress_Gas()
    {
        Throtle = 1f;
    }
    public static void onpress_ReleaseGas()
    {
        Throtle = 0f;
    }
    public static void onpress_Left()
    {
        steering = -1f;
    }
    public static void onpress_ReleaseLeft()
    {
        steering = 0f;
    }
    public static void onpress_Right()
    {
        steering = 1f;
    }
    public static void onpress_ReleaseRight()
    {
        steering = 0f;
    }
    public static void OnPress_Nos()
    {
        //N = true;

        if (Toolbox.GameplayController.SelectedVehicleRccv3.direction == -1)
            return;

        Toolbox.GameplayController.SelectedVehicleRccv3.nos_IsActive = true;
        Boostinput = 2f;
        Throtle = 1f;
    }
    public static void OnPress_ReleaseNos()
    {
        if (Toolbox.GameplayController.SelectedVehicleRccv3.direction == -1)
            return;
        //N = false;
        Toolbox.GameplayController.SelectedVehicleRccv3.nos_IsActive = false;
       // Toolbox.GameplayController.SelectedVehicleRccv3.Nos_stop();
        Boostinput = 0f;
        Throtle = 0f;
    }
    public static void Onpress_Brake()
    {

        Brake = 1f;
    }
    public static void Onpress_ReleaseBrake()
    {
        Brake = 0f;
    }
    public  void Onpress_InstantBrake()
    {
        if (!RCCV3)
        {
            if (RCC_SceneManager.Instance)
            {
                RCCV3rigidbody = RCC_SceneManager.Instance.activePlayerVehicle.GetComponent<Rigidbody>();
                RCCV3 = RCC_SceneManager.Instance.activePlayerVehicle;
                if (RCCV3.goingFalldown)
                    Toolbox.GameplayController.Resetvehicle();
            }
        }

        //  Handbrake = 1f;
    }
    public  void Onpress_ReleaseinstantBrake()
    {
        if (RCCV3 && RCCV3rigidbody)
        {
            RCCV3rigidbody.drag = 0.05f;
        }
    }
    #endregion

    #region FadeInout

    public void setstatus_FadeEffect(bool _val)
    {
        Fadeimage.SetActive(_val);
    }


    #endregion

}
