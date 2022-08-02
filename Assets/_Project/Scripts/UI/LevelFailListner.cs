//using GameAnalyticsSDK;
//using GoogleMobileAds.Api;
using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class LevelFailListner : MonoBehaviour
{
    public GameObject ReviveRewardBtn;
    public Text cashearnedTxt;
   
    int curearnedBonus =0 ;
    int earnedBonus = 100;
    int coinIncVal = 5;

    private void OnEnable()
    {
        //Toolbox.GameManager.Add_ActiveUI(this.gameObject);
 Toolbox.GameplayController.UnloadAssetsFromMemory();
    }

    private void OnDisable()
    {
    //    Toolbox.AdsManager.Hide_BAd();
       // Toolbox.GameManager.Remove_ActiveUI(this.gameObject);
    }

    private void Start()
    {
        try
        {

            if (FindObjectOfType<MediationHandler>())
            {
                FindObjectOfType<MediationHandler>().hideSmallBanner();
                FindObjectOfType<MediationHandler>().ShowMediumBanner(GoogleMobileAds.Api.AdPosition.TopLeft);
                FindObjectOfType<MediationHandler>().LoadInterstitial();
            }
        }

        catch (Exception e)
        {
            //GameAnalytics.NewErrorEvent(GAErrorSeverity.Info, "AdsManager Instance Not Found!");
        }

        Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.levelFail);
        Toolbox.GameManager.FBAnalytic_EventLevel_Fail(Toolbox.GameManager.Get_CurGameModeName(), Toolbox.DB.Prefs.Get_LastSelectedLevelOfCurrentGameMode());
        Toolbox.GameManager.Analytics_ProgressionEvent_Fail(Toolbox.GameManager.Get_CurGameModeName(), Toolbox.DB.Prefs.Get_LastSelectedLevelOfCurrentGameMode());
        StartCoroutine(CR_CoinsAnimation());
    }
   

    IEnumerator CR_CoinsAnimation()

    { 
        yield return new WaitForSeconds(1f);
        while (curearnedBonus <= earnedBonus && curearnedBonus <= earnedBonus - coinIncVal)
        {
            curearnedBonus += coinIncVal;
            cashearnedTxt.text = curearnedBonus.ToString();
            Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.singleCoinsSound);
            yield return new WaitForSeconds(0.012345f);
        }
        Toolbox.DB.Prefs.GoldCoins += earnedBonus;
        StopCoroutine(CR_CoinsAnimation());
    }

    public void OnPress_Home()
    {
        Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.GameUIclicks); 
        Toolbox.GameManager.Back_to_mainmenu = true;
        Toolbox.GameManager.Analytics_DesignEvent(Toolbox.GameManager.Get_CurGameModeName() + "_" + Toolbox.DB.Prefs.Get_LastSelectedLevelOfCurrentGameMode().ToString() + "_" + "LevelFail_Home_Pressed");
        Toolbox.HUDListner.Loadingpanel.SetActive(true);
        Toolbox.GameManager.Load_MenuScene(true);
        this.gameObject.SetActive(false);
    //    Destroy(this.gameObject);
    }

    public void OnPress_Restart()
    {
        Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.GameUIclicks);
        Toolbox.GameManager.Analytics_DesignEvent(Toolbox.GameManager.Get_CurGameModeName() + "_" + Toolbox.DB.Prefs.Get_LastSelectedLevelOfCurrentGameMode().ToString() + "_" + "LevelFail_Restart_Pressed");
        Toolbox.GameManager.Call_ad_after_restart = true;
        Toolbox.HUDListner.Loadingpanel.SetActive(true);
        Toolbox.GameManager.Load_GameScene(true, Toolbox.DB.Prefs.Get_LastSelectedGameModeSceneIndex(),3f);
        this.gameObject.SetActive(false);
        //Destroy(this.gameObject);
    }
   
}
