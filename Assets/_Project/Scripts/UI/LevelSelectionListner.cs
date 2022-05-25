//using GameAnalyticsSDK;
using System;
using UnityEngine;
using UnityEngine.UI;
using System.Collections.Generic;
//using GoogleMobileAds.Api;
public class LevelSelectionListner : MonoBehaviour
{
    public Transform content;
    public Text coinsTxt;
    //public GameObject PlayButon;
    public GameObject UnlockallBtn;
   
    private int tileWidth = 230;
    private int tileSpacing = 40;

    private void OnEnable()
    {
        RefreshView();
  
        content.localPosition = new Vector3(
            -(Toolbox.DB.Prefs.Get_LastSelectedLevelOfCurrentGameMode() * tileWidth)
            - (Toolbox.DB.Prefs.Get_LastSelectedLevelOfCurrentGameMode() * tileSpacing), 0, 0);

       // Bg.SetActive(true);
    }

    private void OnDisable()
    {

    }

    public void RefreshView() {

        InitLevelButtonsState();
        CheckStatus_UnlockallLevels();
        UpdateTxts();
    }
    public void UpdateTxts()
    {
        coinsTxt.text = Toolbox.DB.Prefs.GoldCoins.ToString();
    }

    public void CheckStatus_UnlockallLevels()
    {
        if (Toolbox.DB.Prefs.Unlockalllevel)
        {
            UnlockallBtn.SetActive(false);
            InitLevelButtonsState();
        }
        else
        {
            UnlockallBtn.SetActive(true);
        }

    }


    private void InitLevelButtonsState() {

        bool watchVideoBtnEnabled = false;
        Toolbox.GameManager.Permanent_Log("InitLevelButtonsState");
        for (int i = 0; i < content.childCount; i++)
        {
            LevelButtonListner btnListner = content.GetChild(i).GetComponent<LevelButtonListner>();

            bool lvlUnlocked = Toolbox.DB.Prefs.Get_LevelUnlockStatusOfCurrentGameMode(i);
            btnListner.Set_LevleNameTxt((i+1).ToString());
            if (lvlUnlocked)
            {
                btnListner.Lock_Status(!lvlUnlocked);
                btnListner.buttonObj.SetActive(true);
            }
            else
            {
                btnListner.Lock_Status(!lvlUnlocked);
                btnListner.buttonObj.SetActive(false);
            }

            // Just for checkingLevel status played or not
            //if (i >0)
            //{
            //    content.GetChild(i - 1).GetComponent<LevelButtonListner>().Set_LevelstatusTxt("CLEARED");
            //}

            //Watch video Btn for Unlock Next Level
            //if (!watchVideoBtnEnabled && !lvlUnlocked)
            //{
            //    btnListner.WatchVideoUnlock_Status(true);
            //    watchVideoBtnEnabled = true;
            //}
            //else
            //    btnListner.WatchVideoUnlock_Status(false);
            //hightlight last selected level
            if (i == Toolbox.DB.Prefs.Get_LastUnlockedLevelofCurrentGameMode())
            {
                btnListner.check_OutlineStatus(true);
                btnListner.Set_LevelstatusTxt("NEW");
            }
            else if (i < Toolbox.DB.Prefs.Get_LastUnlockedLevelofCurrentGameMode())
            {
                btnListner.Set_LevelstatusTxt("CLEARED");
            }
            else
            {
                btnListner.check_OutlineStatus(false);
            }
        }
    }
    
    #region ButtonListners

    public void OnPress_LevelButton(GameObject _buttonObj) 
    {
            this.GetComponentInParent<UIManager>().ShowNextUI();

        for (int i = 0; i < content.childCount; i++)
            {
               if (_buttonObj == content.GetChild(i).gameObject) 
               {
                  Toolbox.DB.Prefs.Set_LastSelectedLevelOfCurrentGameMode(i);
                 // PlayButon.SetActive(true);
                  return;
               }
            }
    }
    public void OnPress_Play()
    {
        Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.PlayButtonMainMenuclick);
        if (Toolbox.GameManager.Godirectlevelselectionfrommode)
            Toolbox.GameManager.Loading_GameScene(true, Toolbox.DB.Prefs.Get_LastSelectedGameModeSceneIndex());
        else
        this.GetComponentInParent<UIManager>().ShowNextUI();

        Toolbox.GameManager.Permanent_Log("LastSelectedLevelOfCurrentGameMode :" + Toolbox.DB.Prefs.Get_LastSelectedLevelOfCurrentGameMode());
        Toolbox.GameManager.Permanent_Log("LastSelectedGameMode :" + Toolbox.DB.Prefs.LastSelectedGameMode);
    }
    public void OnPress_Back() {
        Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.BackButtonAnySelectionclick);
        if (Toolbox.GameManager.Godirectlevelselectionfrommode)
        {
            this.GetComponentInParent<UIManager>().ShowUI(1);
            Toolbox.GameManager.Godirectlevelselectionfrommode = false;
        }
        else
            this.GetComponentInParent<UIManager>().ShowPrevUI();
    }

    public void UnlockNextLevel_WatchVideo()
    {

        try
        {
            //if (FindObjectOfType<AbstractAdsmanager>())
            //    FindObjectOfType<AbstractAdsmanager>().ShowRewardedVideo(RewardType.UNLOCK_NEXT_Level);
        }

        catch (Exception e)
        {
            //GameAnalytics.NewErrorEvent(GAErrorSeverity.Info, "AdsManager Instance Not Found!");
        }
    }
    public void OnPress_Shop()
    {
        Toolbox.UIManager.Shop_Panel.SetActive(true);
    //    Toolbox.GameManager.InstantiateUI_Shop();
    }

    public void OnPress_UnlockAllLevel()
    {
        Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.buttonPress);
       // InAppHandler.Instance.Buy_AllLevels();
    }
    #endregion
}
