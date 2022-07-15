//using GoogleMobileAds.Api;
using System;
using UnityEngine;
using UnityEngine.UI;
using System.Collections.Generic;
//using GameAnalyticsSDK;

public class MainMenuListner : MonoBehaviour
{
    public Text coinsTxt;
    //public RectTransform bannerAd;
    //public RectTransform IconAd;
    public GameObject noAdsButton;
    public GameObject TutorialArrow;
    public List<GameObject> Tutotialobj;
    
    private void Awake()
    {
      //  ShowBannner();
    }
    public void OnEnable()
    {
        Time.timeScale = 1;

        //if (DateTime.Now >= Toolbox.DB.Prefs.NextDailyRewardTime)
        //{
        //    Toolbox.UIManager.DailyReward.SetActive(true);
        //    Toolbox.DB.Prefs.Dailyrewardclaimed = false;
        //}
        //else
        //{
        //    Invoke("MegaOffer", 1.0f);
        //}
        // Invoke("MegaOffer", 1.0f);
        set_StatusTutorial();
        NoAdsButtonHandling();
        UpdateTxts();
    }

   

    private void Start()
    {
        if (Toolbox.GameManager.Back_to_mainmenu)
        {

            try
            {
                //if (FindObjectOfType<AbstractAdsmanager>())
                //    FindObjectOfType<AbstractAdsmanager>().ShowInterstitial();
            }

            catch (Exception e)
            {
                // GameAnalytics.NewErrorEvent(GAErrorSeverity.Info, "AdsManager Instance Not Found!");
                Toolbox.GameManager.Back_to_mainmenu = false;
            }
        }

    }

    private void set_StatusTutorial()
    {
        if (Toolbox.DB.Prefs.Tutorialshowfirsttime)
        {
            foreach (GameObject g in Tutotialobj)
                g.GetComponent<Button>().interactable = false;
            TutorialArrow.SetActive(true);
        }
        else
        {
            foreach (GameObject g in Tutotialobj)
                g.GetComponent<Button>().interactable = true;
            TutorialArrow.SetActive(false);
        }
    }
    private void MegaOffer()
    {
        if (!Toolbox.GameManager.FirstShowMegaOffer && !Toolbox.DB.Prefs.MegaOfferPurchased)
        {
            //Toolbox.GameManager.Instantiate_MegaOffer();
            Toolbox.UIManager.MegaOffers.SetActive(true);
            Toolbox.GameManager.FirstShowMegaOffer = true;
        }
    }

    public void NoAdsButtonHandling()
    {
        if (Toolbox.DB.Prefs.NoAdsPurchased)
            noAdsButton.GetComponent<Button>().interactable = false;
    }
    public void ShowBannner()
    {
        //if (AdsManager.Instance)
        //    AdsManager.Instance.ShowSmallBanner(GoogleMobileAds.Api.AdPosition.Top);
        //if (FindObjectOfType<AbstractAdsmanager>())
        //    FindObjectOfType<AbstractAdsmanager>().ShowSmallBanner(GoogleMobileAds.Api.AdPosition.Top);
    }

     public void UpdateTxts()
    {
        coinsTxt.text = Toolbox.DB.Prefs.GoldCoins.ToString();
    }



    #region ButtonListners

    public void OnPress_Next()
    {
        Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.PrivacyPolicyPress);
        Toolbox.GameManager.FBAnalytic_EventDesign("MainMenu_Press_Next");
        this.GetComponentInParent<UIManager>().ShowNextUI();
        //Toolbox.GameManager.loading_Delay(5f);
        //Invoke("Next", 5.01f);
    }

    private void Next()
    {
        this.GetComponentInParent<UIManager>().ShowNextUI();
        Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.PlayButtonMainMenuclick);
    }

    public void OnPress_Settings()
    {
        //Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.buttonPress);
        Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.settingpopup);
        Toolbox.GameManager.FBAnalytic_EventDesign("MainMenu_Press_Settings");
        //  Toolbox.GameManager.InstantiateUI_Settings();
        Toolbox.UIManager.Settings_Panel.SetActive(true);
    }

    public void OnPress_RateUs()
    {
        Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.On_PressMoreGameRateus);
        Toolbox.GameManager.FBAnalytic_EventDesign("MainMenu_Press_RateUs");
        Application.OpenURL(Toolbox.GameManager.Get_RateUsLink());
    }

    public void OnPress_MoreGames()
    {
        Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.On_PressMoreGameRateus);
        Toolbox.GameManager.FBAnalytic_EventDesign("MainMenu_Press_MoreGames");
        Application.OpenURL(Constants.link_MoreGames);
    }

    public void OnPress_PrivacyPolicy()
    {
        Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.PrivacyPolicyPress);
        Application.OpenURL(Constants.link_PrivacyPolicy);
    }

    public void OnPress_Quit()
    {
        //try {
        //    if (FindObjectOfType<AdsManager>())
        //        FindObjectOfType<AdsManager>().ShowInterstitial();
        //}

        //catch (Exception e)
        //{
        //    GameAnalytics.NewErrorEvent(GAErrorSeverity.Info, "AdsManager Instance Not Found!");
        //}
        Toolbox.UIManager.Quit_Panel.SetActive(true);
        Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.Quit);

    }
    public void OnPress_WatchVideo()
    {
        Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.buttonPress);
        //if (FindObjectOfType<AbstractAdsmanager>())
        //    FindObjectOfType<AbstractAdsmanager>().ShowRewardedVideo(RewardType.FREEREWARD);

    }

    public void OnPress_FB()
    {
        Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.buttonPress);
        Toolbox.GameManager.FBAnalytic_EventDesign("MainMenu_Press_FB");
        Application.OpenURL(Constants.link_Facebook);
    }

    public void OnPress_AdsScene()
    {

        Toolbox.GameManager.LoadLevel(4, false);
    }
    public void OnPress_RemoveAds()
    {
        Toolbox.GameManager.FBAnalytic_EventDesign("MainMenu_Press_RemoveAds");
        InAppHandler.Instance.Buy_NoAds();
    }

    public void OnPress_Store()
    {

        Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.OnPressCompaignMode);
        Toolbox.GameManager.FBAnalytic_EventDesign("MainMenu_Press_Store");
        //  Toolbox.GameManager.InstantiateUI_Shop();
        Toolbox.UIManager.Shop_Panel.SetActive(true);
    }
    public void On_Press_Shop()
    {
        Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.OnPressCompaignMode);
        Toolbox.GameManager.FBAnalytic_EventDesign("MainMenu_Press_Shop");
       // this.GetComponentInParent<UIManager>().DirectShowShop();
        Toolbox.GameManager.GodirectshopfromMenu = true;
    }
    public void On_Press_Dailrewards()
    {
        Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.OnPressCompaignMode);
        Toolbox.GameManager.FBAnalytic_EventDesign("On_Press_Dailrewards");
        //Toolbox.UIManager.DailyReward.SetActive(true);

    }
    #endregion

}
