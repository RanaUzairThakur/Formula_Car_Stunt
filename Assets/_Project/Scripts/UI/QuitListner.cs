//using GoogleMobileAds.Api;
using GameAnalyticsSDK;
using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class QuitListner : MonoBehaviour
{
   // private ConsoliAdsBannerView bannerview;

    private void OnEnable()
    {

        try
        {
            if (FindObjectOfType<MediationHandler>())
                FindObjectOfType<MediationHandler>().ShowInterstitial();
        }

        catch (Exception e)
        {
            GameAnalytics.NewErrorEvent(GAErrorSeverity.Info, "MediationHandler Not Found!");
        }
    }

    private void OnDisable()
    {
        try
        {
            if (FindObjectOfType<MediationHandler>())
                FindObjectOfType<MediationHandler>().LoadInterstitial();
        }

        catch (Exception e)
        {
            GameAnalytics.NewErrorEvent(GAErrorSeverity.Info, "MediationHandler Not Found!");
        }
    }
    #region Button Listner

    public void OnPress_Yes()
    {
        Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.buttonPress);
        Toolbox.GameManager.FBAnalytic_EventDesign("Quit_Press_Yes");
        //    Destroy(this.gameObject);
        this.gameObject.SetActive(false);
        Application.Quit();
      //  AdsManager.Instance.ShowInterstitialAd();
    }
    public void OnPress_No()
    {
        Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.buttonPress);
        Toolbox.GameManager.FBAnalytic_EventDesign("Quit_Press_No");
     //   Destroy(this.gameObject);
        this.gameObject.SetActive(false);

    }


    #endregion
}
