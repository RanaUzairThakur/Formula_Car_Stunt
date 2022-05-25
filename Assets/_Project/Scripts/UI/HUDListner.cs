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
    public GameObject SpecialMission_CompletePanel;
    public GameObject RevivePanel;
    public GameObject WatchVideoPanel;
    public GameObject RateUs_Panel;
    public GameObject Mega_OfferPanel;
    public GameObject Loadingpanel;
    public GameObject Message;
    /// <summary>
    /// Other Text 
    /// </summary>
    public GameObject Missioncompletetext;
    public GameObject MissionFailtext;
    public GameObject ObjectiveClear;
    public GameObject PlayerHudCanvas;
    public Button pauseBtn;
    public Button skipStartCinematicBtn;
    public GameObject playerControlsPanel;
    public GameObject PlayerGadgets;
    public GameObject map;
    public GameObject headshot;
    public GameObject HealthInjection;
    public GameObject AirDrop;
    public Text EnemyCounter;
    public CanvasGroup canvasGroup;
    //private int time;
    public GameObject missionStatementPanel;
    public Text Bodytxt;
    public GameObject TapTochangePan;
    public SimpleJoystick joystick;
    public GameObject WeaponChange;
    //public ConsoliAdsBannerView consoliAdsBannerView = new ConsoliAdsBannerView();



    private void OnEnable()
    {
        //if (Toolbox.GameManager)
        //    Toolbox.GameManager.Add_ActiveUI(this.gameObject);
        Toolbox.Set_HUD(this);
    }


    private void Start()
    {
        //if (Toolbox.ObjectiveHandler.SelectedLevelData.StartAnim)
        //{
        //    Toolbox.Cutscenemanager.OnPlayCutscene();
        //    SetStatus_SkipAnimationButton(true);
        //}
        //else
        //{
        //    //Invoke("Initstatement", 0.5f);
        //    Invoke("OnPress_OkTutorial", 0.5f);
        //}
        //if (Toolbox.DB.Prefs.Speciallevel /*&& Toolbox.DB.Prefs.Gamemode[Toolbox.DB.Prefs.LastSelectedGameMode].Gamedata[Toolbox.DB.Prefs.LastSelectedchapter_of_gamemode].SpecialMissionhave*/)
        //{
        //    Toolbox.ObjectiveHandler.specialLevel.SetActive(true);
        //}
        //else
        //{
        //    if (Toolbox.ObjectiveHandler.SelectedLevelData.StartAnim)
        //    {
        //        Toolbox.Cutscenemanager.OnPlayCutscene();
        //        SetStatus_SkipAnimationButton(true);
        //    }
        //    else
        //    {
        //        //Invoke("Initstatement", 0.5f);
        //        Invoke("OnPress_OkTutorial", 0.5f);
        //    }
        //}
        Invoke("OnPress_OkTutorial", 0.5f);

    }

    private void OnDisable()
    {
        //Toolbox.GameManager.Remove_ActiveUI(this.gameObject);
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

    //private void Update()
    //{
    //    set_statusEnemyCounter();
    //}
    public void Initstatement()
    {
        //ObjectiveHandler.Instance.init();
        setstatus_MissionStatement(true);
    }

    public void setstatus_MissionStatement(bool _val)
    {

        if (_val)
        {
            Bodytxt.text = Toolbox.ObjectiveHandler.GetMissionStatment().ToString();
            missionStatementPanel.SetActive(_val);
        }
        else
        {
            missionStatementPanel.SetActive(_val);
        }
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

    public void Set_Mapstatus(bool _val)
    {

        map.SetActive(_val);
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

    public void Set_HeadshotStatus(bool _val)
    {
        headshot.SetActive(!_val);
        headshot.GetComponent<Image>().enabled = _val;
        headshot.SetActive(_val);
    }
    public void set_statusEnemyCounter()
    {

     //s   EnemyCounter.text = Toolbox.ObjectiveHandler.countKills + "/" + Toolbox.ObjectiveHandler.SelectedLevelData.totalEnemy;

    }
    public void Set_statusHealthInjection(bool _val)
    {
        if (Toolbox.ObjectiveHandler.SelectedLevelData.ObjectiveType == LevelsData.objectivetype.HealthInjection)
            HealthInjection.SetActive(_val);
        else
            HealthInjection.SetActive(!_val);
    }
    public void Set_statusAirDrop(bool _val)
    {
        if (Toolbox.ObjectiveHandler.SelectedLevelData.ObjectiveType == LevelsData.objectivetype.AirDrop)
            AirDrop.SetActive(_val);
        else
            AirDrop.SetActive(!_val);
    }

    public void Set_PlayerHealth()
    {
        Time.timeScale = 1.0f;
        //HealthInjection.GetComponent<InjectionListner>().StartTimer();

    }
    #region ButtonListners

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
        Set_Mapstatus(true);
        Set_PlayerControls(true);
        Set_PlayerStatus(true);

       
        SetStatus_SkipAnimationButton(false);
        setstatus_MissionStatement(false);
        // pauseBtn.gameObject.SetActive(true);
        set_statusEnemyCounter();
        Set_statusHealthInjection(true);
        Set_statusAirDrop(true);
        PlayerGadgets.GetComponent<Canvas>().enabled = true;

    }

    public void SkipSAnimations()
    {
       
        OnPress_OkTutorial();
    }

    public void handleplayerhud(bool _Val)
    {
        PlayerHudCanvas.gameObject.SetActive(_Val);
    }
    public void HandleJoystick(bool _Val)
    {
        joystick.gameObject.SetActive(_Val);
    }

    public void showMessagePop_Up(string title, string body)
    {
        Message.SetActive(true);
        Message.GetComponent<MessageListner>().UpdateTxt(title, body);
    }
    #endregion

    #region FadeInout
    public IEnumerator FadeLoadingScreen(float targetValue, float duration)
    {
        float startValue = canvasGroup.alpha;
        float time = 0;
        Toolbox.GameManager.Permanent_Log("FadeInout");
        while (time < duration)
        {
            canvasGroup.alpha = Mathf.Lerp(startValue, targetValue, time / duration);
            time += Time.deltaTime;
            yield return null;
        }
        canvasGroup.alpha = targetValue;
    }
    #endregion
}
