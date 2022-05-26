//using GameAnalyticsSDK;
//using GoogleMobileAds.Api;
using CnControls;
using System;
using System.Collections;
using UnityEngine;
using UnityEngine.UI;
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
    public Text LevelText;
    public GameObject Missioncompletetext;
    public GameObject MissionFailtext;
    public GameObject ObjectiveClear;
    public GameObject PlayerHudCanvas;
    public Button pauseBtn;
    public Button skipStartCinematicBtn;
    public GameObject playerControlsPanel;
    public CanvasGroup canvasGroup;
    //private int time;



    private void OnEnable()
    {
        Toolbox.Set_HUD(this);
    }


    private void Start()
    {
       
       // Invoke("OnPress_OkTutorial", 0.5f);

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
        }

        catch (Exception e)
        {
            //GameAnalytics.NewErrorEvent(GAErrorSeverity.Info, "AdsManager Instance Not Found!");

        }

    }

    public void SetTime(int _val)
    {
        //time = _val;
        //int min = time / 60;
        //   timeTxt.text = string.Format("{0:D2}:{1:D2}", min, time - (min * 60));
    }

    public void SetLives(int _val)
    {
        //   livesTxt.text = _val.ToString();
    }

    public void SetTotalLives(int _val)
    {
        //     totalLivesTxt.text = _val.ToString();
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
                break;
            case 1:
                RCC.SetMobileController(RCC_Settings.MobileController.Gyro);
                break;
            case 2:
                RCC.SetMobileController(RCC_Settings.MobileController.TouchScreen);
                break;
            default:
                RCC.SetMobileController(RCC_Settings.MobileController.TouchScreen);
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

    public void OnPress_Injection()
    {
        Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.GameUIclicks);
        Time.timeScale = 0.03f;
        WatchVideoPanel.SetActive(true);
        WatchVideoPanel.GetComponent<WatchVideoListner>().UpdateTxt("To Get The Health on Watch Video", "Watch Video");
        // Toolbox.GameManager.Instantiate_WatchVideoMsg("To Get The Health on Watch Video","Watch Video");
    }


    public void OnPress_OkTutorial()
    {
        //print("OnPress_OkTutorial");
        Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.GameUIclicks);
        //Toolbox.ObjectiveHandler.player.levelLoadFadeObj.GetComponent<LevelLoadFade>().FadeAndLoadLevel(Color.black, 1.5f, true);
        Set_PlayerControls(true);
        Set_PlayerStatus(true);


        SetStatus_SkipAnimationButton(false);
        // pauseBtn.gameObject.SetActive(true);
        set_statusLevelCounter();
    }

    public void SkipSAnimations()
    {
       
        OnPress_OkTutorial();
    }

    public void handleplayerhud(bool _Val)
    {
        PlayerHudCanvas.gameObject.SetActive(_Val);
    }
  

    public void OnPress_resetButton()
    {
        Toolbox.GameplayController.Resetvehicle();
    }
    public void OnPress_nos()
    {
        //N = true;
        
        if (Toolbox.GameplayController.SelectedVehicleRccv3.direction == -1)
            return;

        Toolbox.GameplayController.SelectedVehicleRccv3.nos_IsActive = true;
    }
    public void OnPress_nosRelease()
    {
        if (Toolbox.GameplayController.SelectedVehicleRccv3.direction == -1)
            return;
        //N = false;
        Toolbox.GameplayController.SelectedVehicleRccv3.nos_IsActive = false;
        Toolbox.GameplayController.SelectedVehicleRccv3.Nos_stop();
    }
    #endregion

    #region FadeInout

    public void setstatus_FadeEffect(bool _val)
    {
        Fadeimage.SetActive(_val);
    }

   
    #endregion

}
