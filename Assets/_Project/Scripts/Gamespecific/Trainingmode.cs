using GameAnalyticsSDK;
using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Trainingmode : MonoBehaviour
{
    // Start is called before the first frame update
    //public ConsoliAdsBannerView consoliAdsBannerView = new ConsoliAdsBannerView();
    void Awake()
    {
      //  Toolbox.GameManager.FBAnalytic_EventLevel_Started(Toolbox.GameManager.Get_CurGameModeName(), Toolbox.DB.Prefs.LastSelectedchapter_of_gamemode, Toolbox.DB.Prefs.Get_LastSelectedLevelOfCurrentGameMode());
       // Toolbox.GameManager.Analytics_ProgressionEvent_Start(Toolbox.GameManager.Get_CurGameModeName(), Toolbox.DB.Prefs.LastSelectedchapter_of_gamemode, Toolbox.DB.Prefs.Get_LastSelectedLevelOfCurrentGameMode());
       
        ShowBanner();
    }

    public void Go_Back_Main()
    {
        //try
        //{
        //    if (FindObjectOfType<AbstractAdsmanager>())
        //        FindObjectOfType<AbstractAdsmanager>().ShowInterstitial();
        //}

        //catch (Exception e)
        //{
        //    GameAnalytics.NewErrorEvent(GAErrorSeverity.Info, "Trainingmode AdsManager Instance Not Found!");
        //    Toolbox.GameManager.Back_to_mainmenu = false;
        //}
        Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.GameUIclicks);    
            Toolbox.GameManager.Load_MenuScene(true);
    }
    public void ShowBanner()
    {

        //try
        //{
        //    //if (AdsManager.Instance)
        //    //AdsManager.Instance.ShowSmallBanner(GoogleMobileAds.Api.AdPosition.Top);
        //    if (FindObjectOfType<AbstractAdsmanager>())
        //        FindObjectOfType<AbstractAdsmanager>().ShowSmallBanner(GoogleMobileAds.Api.AdPosition.Top);
        //}

        //catch (Exception e)
        //{
        //   GameAnalytics.NewErrorEvent(GAErrorSeverity.Info, "AdsManager Instance Not Found!");

        //}

    }
}
