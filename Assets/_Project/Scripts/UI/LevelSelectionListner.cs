//using GameAnalyticsSDK;
using System;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
//using GoogleMobileAds.Api;
public class LevelSelectionListner : MonoBehaviour
{
    public Transform content;
    public Text coinsTxt;
    //public GameObject PlayButon;
    public GameObject UnlockallBtn;

    public int tileWidth = 446;
    public int tileSpacing = 23;
    public List<Sprite> Levelsthumbnails;
    public List<GameObject> Tutotialobj;

    private void OnEnable()
    {
        RefreshView();

        content.localPosition = new Vector3(
            -(Toolbox.DB.Prefs.Get_LastSelectedLevelOfCurrentGameMode() * tileWidth)
            - (Toolbox.DB.Prefs.Get_LastSelectedLevelOfCurrentGameMode() * tileSpacing), 0, 0);

        // Bg.SetActive(true);
    }

  



    public void RefreshView()
    {

        InitLevelButtonsState();
        CheckStatus_UnlockallLevels();
        UpdateTxts();
        set_StatusTutorial();
    }
    public void UpdateTxts()
    {
        coinsTxt.text = Toolbox.DB.Prefs.GoldCoins.ToString();
    }
    private void set_StatusTutorial()
    {
        if (Toolbox.DB.Prefs.Tutorialshowfirsttime)
        {
            foreach (GameObject g in Tutotialobj)
                g.GetComponent<Button>().interactable = false;
            UnlockallBtn.SetActive(false);
        }
        else
        {
            foreach (GameObject g in Tutotialobj)
                g.GetComponent<Button>().interactable = true;
            UnlockallBtn.SetActive(true);
        }
    }
    public void CheckStatus_UnlockallLevels()
    {
        if (Toolbox.DB.Prefs.UnlockallLevel)
        {
            UnlockallBtn.SetActive(false);
            InitLevelButtonsState();
        }
        else
        {
            UnlockallBtn.SetActive(true);
        }

    }


    private void InitLevelButtonsState()
    {

        bool watchVideoBtnEnabled = false;
        Toolbox.GameManager.Permanent_Log("InitLevelButtonsState");
        for (int i = 0; i < Toolbox.DB.Prefs.GameData[Toolbox.DB.Prefs.LastSelectedGameMode].LevelUnlocked.Length/*content.childCount*/; i++)
        {
            content.GetChild(i).gameObject.SetActive(true);

            LevelButtonListner btnListner = content.GetChild(i).GetComponent<LevelButtonListner>();

            bool lvlUnlocked = Toolbox.DB.Prefs.Get_LevelUnlockStatusOfCurrentGameMode(i);
            btnListner.Lock_Status(!lvlUnlocked);
            btnListner.buttonObj.GetComponent<Image>().sprite = Levelsthumbnails[Toolbox.DB.Prefs.LastSelectedGameMode];
            //if (lvlUnlocked)
            //{
            //    btnListner.Lock_Status(!lvlUnlocked);
            //    btnListner.buttonObj.SetActive(true);
            //}
            //else
            //{
            //    btnListner.Lock_Status(!lvlUnlocked);
            //   // btnListner.buttonObj.SetActive(false);
            //}

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
            if (i == Toolbox.DB.Prefs.GameData[Toolbox.DB.Prefs.LastSelectedGameMode].LastselectedlevelofChapter)
            {
                btnListner.check_OutlineStatus(true);
                btnListner.Set_LevelstatusTxt("PLAY", Color.cyan);
                btnListner.Set_LevleNameTxt((i + 1).ToString(), Color.cyan);
                btnListner.set_LevelName(Toolbox.DB.Prefs.Get_CurGameLevelName(i), Color.cyan);
                btnListner.Set_NewArrow(true);
                // btnListner.GetComponent<UIAnimatorCore.UIAnimator>().Paused = false;
                btnListner.GetComponent<UIAnimatorCore.UIAnimator>().enabled = true; ;
            }
            else if (i <= Toolbox.DB.Prefs.Get_LastUnlockedLevelofCurrentGameMode())
            {
                btnListner.Set_LevelstatusTxt("COMPLETE", Color.green);
                btnListner.check_OutlineStatus(false);
                btnListner.Set_LevleNameTxt((i + 1).ToString(), Color.white);
                btnListner.set_LevelName(Toolbox.DB.Prefs.Get_CurGameLevelName(i), Color.white);
                btnListner.GetComponent<UIAnimatorCore.UIAnimator>().enabled = false;
                btnListner.Set_NewArrow(false);
            }
            else
            {
                btnListner.Set_LevelstatusTxt("LOCKED", Color.gray);
                btnListner.check_OutlineStatus(false);
                btnListner.Set_LevleNameTxt((i + 1).ToString(), Color.grey);
                btnListner.set_LevelName(Toolbox.DB.Prefs.Get_CurGameLevelName(i), Color.grey);
                btnListner.GetComponent<UIAnimatorCore.UIAnimator>().enabled = false;
                btnListner.Set_NewArrow(false);
            }
        }
    }

    #region ButtonListners

    public void OnPress_LevelButton(GameObject _buttonObj)
    {
        this.GetComponentInParent<UIManager>().ShowNextUI();

        for (int i = 0; i < Toolbox.DB.Prefs.GameData[Toolbox.DB.Prefs.LastSelectedGameMode].LevelUnlocked.Length/*content.childCount*/; i++)
        {
            content.GetChild(i).GetComponent<UIAnimatorCore.UIAnimator>().enabled = false;
            content.GetChild(i).GetComponent<LevelButtonListner>().check_OutlineStatus(false);

        }
        for (int i = 0; i < Toolbox.DB.Prefs.GameData[Toolbox.DB.Prefs.LastSelectedGameMode].LevelUnlocked.Length/*content.childCount*/; i++)
        {
            if (_buttonObj == content.GetChild(i).gameObject)
            {
                Toolbox.DB.Prefs.Set_LastSelectedLevelOfCurrentGameMode(i);
                content.GetChild(i).GetComponent<LevelButtonListner>().check_OutlineStatus(true);
                content.GetChild(i).GetComponent<UIAnimatorCore.UIAnimator>().enabled = true;
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
    public void OnPress_Back()
    {
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
        InAppHandler.Instance.Buy_AllLevels();
    }
    #endregion
}
