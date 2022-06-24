using System;
using UnityEngine;

public class UIManager : MonoBehaviour
{
    public int curUiIndex = 0;
    bool vehicleSelLoaded = false;
    private GameObject curUIObj;
    //private readonly List<GameObject> uiList = new List<GameObject>();
    public GameObject[] uiList;
    [SerializeField] private bool directShowingShop = false;
    //[SerializeField] private bool directShowingLevelSelection = false;
    public int shopIndex = 3;
    //public int LevelselectionIndex = 2;
    //public Text coinsTxt;


    // UI Menus 
    public GameObject ModeLockPopup;
    public GameObject MessagePopup;
    public GameObject LowCoinUnlockCar_Panel;
    public GameObject Quit_Panel;
    public GameObject Settings_Panel;
    public GameObject Gameplay_Loading;
    public GameObject UIDummy_Loading;
    public GameObject Shop_Panel;
    public GameObject MegaOffers;
    public GameObject PrivacyPolicy;
    public GameObject SurePop;
    public GameObject TD_MainMenu;
    public GameObject LiveMainmenu;
    //public GameObject DailyReward;
    public bool DirectShowingShop { get => directShowingShop; set => directShowingShop = value; }

    void Awake()
    {
        Toolbox.Soundmanager.PlayMusic_Menu();
        Toolbox.Set_Uimanager(this);
        curUiIndex = 0;

        if (Toolbox.GameManager.DirectShowVehicleSelectionOnMenu)
        {
            DirectShowShopAfterLevelComplete();
            Toolbox.GameManager.DirectShowVehicleSelectionOnMenu = false;
        }
        else
        {
            ShowUI(curUiIndex);
        }
        Optimization();
    }

    private void Start()
    {
        ShowBanner();
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
    //public void refreshstatus()
    //   {
    //	UpdateTxts();

    //   }
    //public void UpdateTxts()
    //{
    //	coinsTxt.text = Toolbox.DB.Prefs.GoldCoins.ToString();
    //}
    public void ShowUI(int _index)
    {

        if (curUiIndex >= uiList.Length || curUiIndex < 0)
        {
            return;
        }
        else
        {
            uiList[_index].SetActive(true);

            if (curUIObj)
                curUIObj.SetActive(false);

            curUiIndex = _index;
            curUIObj = uiList[_index];
        }
    }

    public void ShowPrevUI()
    {
        curUiIndex--;

        if (curUiIndex < 0)
        {
            curUiIndex = 0;
        }
        else
        {
            //	Toolbox.GameManager.loading_Delay(3f);
            ShowUI(curUiIndex);
        }

    }

    public void ShowNextUI()
    {

        curUiIndex++;

        if (curUiIndex >= uiList.Length)
        {

            Toolbox.GameManager.Loading_GameScene(true, Toolbox.DB.Prefs.Get_LastSelectedGameModeSceneIndex());
            //Toolbox.GameManager.Loading_GameScene(true, Toolbox.DB.Prefs.Get_LastSelectedGameModeSceneIndex());
            //Destroy(this.gameObject);
        }
        else
        {

            ShowUI(curUiIndex);
        }
    }

    //public void DirectShowShop()
    //{

    //    DirectShowingShop = true;
    //    ShowUI(shopIndex);
    //}
    public void DirectShowLevelSelection()
    {

        //directShowingLevelSelection = true;
        //ShowUI(LevelselectionIndex);
    }
    public void DirectShowShopAfterLevelComplete()
    {
        DirectShowingShop = true;
        for (int i = 0; i < uiList.Length; i++)
            uiList[i].SetActive(false);

        ShowUI(shopIndex);
    }

    public void DirectShowMain()
    {
        //Go_BackDirectWeaponShop_To_MainMenu();
        //DirectShowingShop = false;
        ShowUI(0);
    }
    //For Button Sounds 
    public void Onclick(AudioClip sound)
    {
        Toolbox.Soundmanager.PlaySound(sound);
    }

    public void Optimization()
    {
        if (Toolbox.DB.Prefs.IsDetectVeryCheapDevice)
        {
            TD_MainMenu.SetActive(true);
            LiveMainmenu.SetActive(false);
        }
        else if (Toolbox.DB.Prefs.IsDetectLowCheapDevice)
        {
            TD_MainMenu.SetActive(false);
            LiveMainmenu.SetActive(true);
        }
        else if (Toolbox.DB.Prefs.IsDetectMediumCheapDevice)
        {
            TD_MainMenu.SetActive(false);
            LiveMainmenu.SetActive(true);
        }

        else
        {
            TD_MainMenu.SetActive(false);
            LiveMainmenu.SetActive(true);
        }

    }
    //public void Go_Chapterselection()
    //{
    //	anim.SetBool("ChapterSelection", true);
    //}
    //public void Go_Back_From_Chapselection()
    //{
    //	anim.SetBool("ChapterSelection", false);
    //}
    //public void Go_Levelselection()
    //{
    ////	anim.SetBool("ChapterSelection", false);
    //	anim.SetBool("LevelSelection", true);
    //}
    //public void Go_BackFromLevelselection()
    //{
    //	anim.SetBool("LevelSelection", false);
    //}
    //public void Go_GunSelection()
    //{
    //	anim.SetBool("WeaponSelection", true);
    //}
    //public void Go_BackFromWeaponselection()
    //{
    //	//anim.SetBool("LevelSelection", false);
    //	anim.SetBool("WeaponSelection", false);
    //}
    //public void Go_DirectWeaponShop()
    //{ 
    //	anim.SetBool("DirectShop", true);
    //}
    //public void Go_BackDirectWeaponShop_To_MainMenu()
    //{
    //	anim.SetBool("DirectShop", false);
    //}
}