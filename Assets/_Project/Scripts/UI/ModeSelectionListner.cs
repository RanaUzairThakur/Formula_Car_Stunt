using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using Random = UnityEngine.Random;
using Coffee.UIEffects;

public class ModeSelectionListner : MonoBehaviour
{
    public Text coinstext;
    public GameObject content;
    public List<GameObject> ModesItem;
    public List<GameObject> EnableItem;
    public List<GameObject> Hover;
    public List<GameObject> Locked;
    public GameObject UnlockallBtn;
    private void OnEnable()
    {
       
        foreach (GameObject h in Hover)
            h.SetActive(false);
        ModesItem[Toolbox.DB.Prefs.LastSelectedGameMode].transform.GetComponent<UIShiny>().enabled = true;
        Hover[Toolbox.DB.Prefs.LastSelectedGameMode].SetActive(true);
        //if (!Toolbox.DB.Prefs.Modesautoscroller)
        //{
        //    LeanTween.moveX(content.GetComponent<RectTransform>(), -4755.472f, 1f).setDelay(1f).setOnComplete(scrollerback);
        //    Toolbox.DB.Prefs.Modesautoscroller = true;
        //}
        InitmodeButtonsState();
        UpdateTxts();
        CheckStatus_UnlockallModes();
    }

    private void scrollerback()
    {
        //LeanTween.moveX(content.GetComponent<RectTransform>(), 0f, 1f).setDelay(1f);
    }


    private void OnDisable()
    {
        //Toolbox.GameManager.Remove_ActiveUI(this.gameObject);
       
        CancelInvoke();
    
    }
    public void UpdateTxts()
    {
        coinstext.text = Toolbox.DB.Prefs.GoldCoins.ToString();
    }
    private void InitmodeButtonsState()
    {
        for (int i = 0; i < content.transform.childCount; i++)
        {
            ModebtnListner modeListner = content.transform.GetChild(i).GetComponent<ModebtnListner>();
            bool modeUnlocked = Toolbox.DB.Prefs.Get_ModeUnlockStatus(i);
            modeListner.Lock_Status(!modeUnlocked);
            modeListner.Set_Nameofmode(Toolbox.DB.Prefs.Get_CurGameModeName(i));
        }
    }
    private void ModeLockCheck()
    {
        foreach (GameObject Lock in Locked)
        {
            Lock.transform.parent.transform.GetComponent<Button>().interactable = true;
            Lock.SetActive(false);
        }
    }
    public void CheckStatus_UnlockallModes()
    {
        if (Toolbox.DB.Prefs.UnlockallModes)
        {
            UnlockallBtn.SetActive(false);
            InitmodeButtonsState();
        }
        else
        {
            UnlockallBtn.SetActive(true);
        }

    }



    #region ButtonListners

    public void OnPress_Mode(int mode)
    {

        Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.PrivacyPolicyPress);
        foreach (GameObject h in Hover)
            h.SetActive(false);
        Hover[mode].SetActive(true);
        for (int u = 0; u < ModesItem.Count; u++)
        {
           ModesItem[u].transform.GetComponent<UIShiny>().enabled = false;
        }
        ModesItem[mode].transform.GetComponent<UIShiny>().enabled = true;
        switch (mode)
        {
            case 0:
                Toolbox.DB.Prefs.LastSelectedGameMode = mode;
                this.GetComponentInParent<UIManager>().ShowNextUI();
                Toolbox.GameManager.FBAnalytic_EventDesign("Press_campaignMode");
                break;
            case 1:
                Toolbox.DB.Prefs.LastSelectedGameMode = mode;
                this.GetComponentInParent<UIManager>().ShowNextUI();
                Toolbox.GameManager.FBAnalytic_EventDesign("Press_AssualtRiffleMode");
                break;
            case 2:
                Toolbox.DB.Prefs.LastSelectedGameMode = mode;
                this.GetComponentInParent<UIManager>().ShowNextUI();
                Toolbox.GameManager.FBAnalytic_EventDesign("Press_SMGGunMode");
                break;
            case 3:
                Toolbox.DB.Prefs.LastSelectedGameMode = mode;
                this.GetComponentInParent<UIManager>().ShowNextUI();
                Toolbox.GameManager.FBAnalytic_EventDesign("Press_PistolGunMode");
                break;
            case 4:
                Toolbox.DB.Prefs.LastSelectedGameMode = mode;
                this.GetComponentInParent<UIManager>().ShowNextUI();
                Toolbox.GameManager.FBAnalytic_EventDesign("Press_MachineGunMode");
                break;
            case 5:
                Toolbox.DB.Prefs.LastSelectedGameMode = mode;
                this.GetComponentInParent<UIManager>().ShowNextUI();
                Toolbox.GameManager.FBAnalytic_EventDesign("Press_ShotGunMode");
                break;
            case 6:
                Toolbox.DB.Prefs.LastSelectedGameMode = mode;
                this.GetComponentInParent<UIManager>().ShowNextUI();
                Toolbox.GameManager.FBAnalytic_EventDesign("Press_SniperMode");
                break;
        }
    }

    private void Delay_Due_to_Ad()
    {
        this.GetComponentInParent<UIManager>().ShowNextUI();
        Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.OnPressCompaignMode);
    }
    private void LevelSelection_Menu ()
    {
        this.GetComponentInParent<UIManager>().DirectShowLevelSelection();
        Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.OnPressCompaignMode);
    }
    public void OnPress_Mode2()
    {
            Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.OnPresslockedbutton);
          //  this.GetComponentInParent<UIManager>().DirectShowingShop = false;
            Toolbox.GameManager.FBAnalytic_EventDesign("ModeSelection_Press_Sniper");
            Toolbox.UIManager.ModeLockPopup.SetActive(true);
            Toolbox.UIManager.ModeLockPopup.GetComponent<MessageListner>().UpdateTxt("This mode will be available soon with all the amazing features.", "LOCKED");
            Invoke("Popupsound", 0.3f);
    }
    public void OnPress_StartMission()
    {
        Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.weaponPress);
        Toolbox.GameManager.FBAnalytic_EventDesign("ModeSelection_Press_Shop");
        switch (Toolbox.DB.Prefs.LastSelectedGameMode)
        {
            case 0:
                Toolbox.GameManager.Godirectlevelselectionfrommode = false;
                Toolbox.GameManager.loading_Delay(5f);
                Invoke("Delay_Due_to_Ad", 5f);
                //if (Toolbox.DB.Prefs.Speciallevel)
                //{
                //    Toolbox.GameManager.Loading_GameScene(true, Toolbox.DB.Prefs.Get_LastSelectedGameModeSceneIndex());
                //}
                //else
                //{
                //    Toolbox.GameManager.loading_Delay(5f);
                //    Invoke("Delay_Due_to_Ad", 5f);
                //}
                break;

            case 1:
                Toolbox.GameManager.loading_Delay(5f);
                Toolbox.GameManager.Godirectlevelselectionfrommode = true;
                Invoke("LevelSelection_Menu", 5.01f);
                break;
            case 2:
                Toolbox.GameManager.loading_Delay(5f);
                Toolbox.GameManager.Godirectlevelselectionfrommode = true;
                Invoke("LevelSelection_Menu", 5.01f);
                break;
            case 3:
                Toolbox.GameManager.loading_Delay(5f);
                Toolbox.GameManager.Godirectlevelselectionfrommode = true;
                Invoke("LevelSelection_Menu", 5.01f);
                break;
            case 4:
                Toolbox.GameManager.loading_Delay(5f);
                Toolbox.GameManager.Godirectlevelselectionfrommode = true;
                Invoke("LevelSelection_Menu", 5.01f);
                break;
            case 5:
                Toolbox.GameManager.loading_Delay(5f);
                Toolbox.GameManager.Godirectlevelselectionfrommode = true;
                Invoke("LevelSelection_Menu", 5.01f);
                break;
            case 6:
                Toolbox.GameManager.loading_Delay(5f);
                Toolbox.GameManager.Godirectlevelselectionfrommode = true;
                Invoke("LevelSelection_Menu", 5.01f);
                break;
            case 7:
                Toolbox.GameManager.loading_Delay(5f);
                Toolbox.GameManager.Godirectlevelselectionfrommode = true;
                Invoke("LevelSelection_Menu", 5.01f);
                break;
            case 8:
                Toolbox.GameManager.loading_Delay(5f);
                Toolbox.GameManager.Godirectlevelselectionfrommode = true;
                Invoke("LevelSelection_Menu", 5.01f);
                break;
            case 9:
                Toolbox.GameManager.loading_Delay(5f);
                Toolbox.GameManager.Godirectlevelselectionfrommode = true;
                Invoke("LevelSelection_Menu", 5.01f);
                break;
            case 10:
                Toolbox.GameManager.loading_Delay(5f);
                Toolbox.GameManager.Godirectlevelselectionfrommode = true;
                Invoke("LevelSelection_Menu", 5.01f);
                break;
            case 11:
                Toolbox.GameManager.Loading_GameScene(true, Toolbox.DB.Prefs.Get_LastSelectedGameModeSceneIndex());
                break;
            case 12:
                Toolbox.GameManager.loading_Delay(5f);
                Toolbox.GameManager.Godirectlevelselectionfrommode = true;
                Invoke("LevelSelection_Menu", 5.01f);
                break;
        }
    }
    public void OnPress_Back()
    {
        Toolbox.GameManager.Analytics_DesignEvent("ModeSelection_OnPress_Back");
        Toolbox.GameManager.FBAnalytic_EventDesign("ModeSelection_OnPress_Back");
        Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.BackButtonAnySelectionclick);
        this.GetComponentInParent<UIManager>().ShowPrevUI();
    }
    public void OnPress_UnlockAllModes()
    {
        Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.buttonPress);
        InAppHandler.Instance.Buy_AllModes();
    }
    public void OnPress_ModeLockButton()
    {
        Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.OnPresslockedbutton);
        Toolbox.UIManager.ModeLockPopup.SetActive(true);
        Toolbox.UIManager.ModeLockPopup.GetComponent<MessageListner>().UpdateTxt("This Mode is currently locked. Coming Soon!", "LOCKED");
    }
    private void Popupsound()
    {
        Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.OnAnyPopupAppear);

    }
    #endregion

}
