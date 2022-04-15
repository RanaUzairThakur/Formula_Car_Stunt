using UnityEngine;
using UnityEngine.UI;


public class MainMenu_Handler : MonoBehaviour
{
    public GameObject MainPanel, LoadingPanel, QuitPanel, InAppPanel, Cross;
    private bool isloading = false;
    public static bool Env;
    public Button[] CarrierButtons, TimeButtons, MegaButtons, ExpressButtons, HighwayButtons, Mode_Button;
    public Text Cashin, modeCash;
    public static bool imposible = false;
    public GameObject ModeSelection, Weather, City, TimeLevel, CarrierLevel, MegaLevel, ExpressLevel, HighwayLevel;
    public GameObject[] CarrierLock, TimeLock, MegaLock, ExpressLock, HighwayLock, Mode_Lock_Images, StarsCarrier, StarsTime, MegaStar, StarExpress, StarHighway;
    public GameObject EventSystem;
    public static MainMenu_Handler inst;



    void Awake()
    {
        inst = this;
    }

    void Start()
    {

        Invoke("CrossDelay", 2f);
        Time.timeScale = 1;
        AudioListener.volume = 1;
        SoundsManager._instance.PlayMusic_Menu();
        Cashin.text = ("" + PlayerPrefs.GetInt("cashin"));
        modeCash.text = ("" + PlayerPrefs.GetInt("cashin"));

        int unlok = PlayerPrefs.GetInt("compare");
        for (int k = 0; k <= unlok; k++)
        {
            CarrierButtons[k].interactable = true;
            CarrierLock[k].SetActive(false);
            //StarsCarrier[k].SetActive(true);
        }
        int unlok2 = PlayerPrefs.GetInt("compare2");
        for (int k = 0; k <= unlok2; k++)
        {
            TimeButtons[k].interactable = true;
            TimeLock[k].SetActive(false);
            //StarsTime[k].SetActive(true);
        }
        int unlok3 = PlayerPrefs.GetInt("compare3");
        for (int k = 0; k <= unlok3; k++)
        {
            MegaButtons[k].interactable = true;
            MegaLock[k].SetActive(false);
            //MegaStar[k].SetActive(true);
        }
        int unlok4 = PlayerPrefs.GetInt("compare4");
        for (int k = 0; k <= unlok4; k++)
        {
            ExpressButtons[k].interactable = true;
            ExpressLock[k].SetActive(false);
            //StarExpress[k].SetActive(true);
        }
        int unlok5 = PlayerPrefs.GetInt("compare5");
        for (int k = 0; k <= unlok5; k++)
        {
            HighwayButtons[k].interactable = true;
            HighwayLock[k].SetActive(false);
            //StarHighway[k].SetActive(true);
        }
        CarrierButtons[PlayerPrefs.GetInt("compare")].gameObject.transform.GetChild(0).gameObject.SetActive(true);
        CarrierButtons[PlayerPrefs.GetInt("compare")].gameObject.GetComponent<Animator>().enabled = true;
        TimeButtons[PlayerPrefs.GetInt("compare2")].gameObject.transform.GetChild(0).gameObject.SetActive(true);
        TimeButtons[PlayerPrefs.GetInt("compare2")].gameObject.GetComponent<Animator>().enabled = true;
        MegaButtons[PlayerPrefs.GetInt("compare3")].gameObject.transform.GetChild(0).gameObject.SetActive(true);
        MegaButtons[PlayerPrefs.GetInt("compare3")].gameObject.GetComponent<Animator>().enabled = true;
        ExpressButtons[PlayerPrefs.GetInt("compare4")].gameObject.transform.GetChild(0).gameObject.SetActive(true);
        ExpressButtons[PlayerPrefs.GetInt("compare4")].gameObject.GetComponent<Animator>().enabled = true;
        Mode_Button[PlayerPrefs.GetInt("mode")].gameObject.GetComponent<Animator>().enabled = true;

        //if (PlayerPrefs.GetInt("compare2") == 0)
        //{
        //    Mode_Button[2].interactable = true;
        //    Mode_Button[2].gameObject.transform.GetChild(2).gameObject.SetActive(true);
        //    Mode_Lock_Images[2].SetActive(false);
        //}
        if (GamePlayManager.isnextClick == true)
        {

            MainPanel.SetActive(false);
            InAppPanel.SetActive(false);
            Weather.SetActive(true);

        }
    }
    public void Unlock_Level_Reward()
    {
        if (PlayerPrefs.GetInt("mode") == 1)
        {

            TimeButtons[PlayerPrefs.GetInt("LevelVideo")].interactable = true;
            TimeLock[PlayerPrefs.GetInt("LevelVideo")].SetActive(false);

        }
        else if (PlayerPrefs.GetInt("mode") == 0)
        {

            CarrierButtons[PlayerPrefs.GetInt("LevelVideo")].interactable = true;
            CarrierLock[PlayerPrefs.GetInt("LevelVideo")].SetActive(false);

        }
    }
    public void Prefrence(int pref)
    {
        PlayerPrefs.SetInt("LevelVideo", pref);
    }
    //-------------------------------------Buttons_Functions----------------------
    public void CrossDelay()
    {
        Cross.SetActive(true);
    }
    public void OnPlay()
    {
        MainPanel.SetActive(false);
        ModeSelection.SetActive(true);
        SoundsManager._instance.PlaySound(SoundsManager._instance.GameUIclicks);
        //CarrierLevel.SetActive(true);
        //Weather.SetActive(true);
    }

    public void WeatherSelection(int Env)
    {

        PlayerPrefs.SetInt("Weather", Env);
        CarrierLevel.SetActive(false);
        Weather.SetActive(false);
        City.SetActive(true);
        SoundsManager._instance.PlaySound(SoundsManager._instance.GameUIclicks);

        //StartCoroutine(Onload());

    }
    public void CitySelection()
    {
        City.SetActive(false);
        LoadingPanel.SetActive(true);
        SoundsManager._instance.PlaySound(SoundsManager._instance.GameUIclicks);


    }
    public void WeatherBack()
    {
        if (PlayerPrefs.GetInt("mode") == 0)
        {
            CarrierLevel.SetActive(true);
        }
        if (PlayerPrefs.GetInt("mode") == 1)
        {
            TimeLevel.SetActive(true);
        }
        if (PlayerPrefs.GetInt("mode") == 2)
        {
            MegaLevel.SetActive(true);
        }
        if (PlayerPrefs.GetInt("mode") == 3)
        {
            ExpressLevel.SetActive(true);
        }
        if (PlayerPrefs.GetInt("mode") == 4)
        {
            HighwayLevel.SetActive(true);
        }
        if (PlayerPrefs.GetInt("mode") == 5)
        {
            CarrierLevel.SetActive(true);
        }
        SoundsManager._instance.PlaySound(SoundsManager._instance.buttonPress);

    }
    public void Carrier()
    {
        if (ModeSelection)
            ModeSelection.SetActive(false);
        if (CarrierLevel)
            CarrierLevel.SetActive(true);
        PlayerPrefs.SetInt("mode", 0);
        int unlok = PlayerPrefs.GetInt("compare");
        for (int k = 0; k <= unlok; k++)
        {
            
            CarrierButtons[k].interactable = true;
            CarrierLock[k].SetActive(false);
            if (k < unlok)
            {
                CarrierButtons[k].gameObject.transform.GetChild(1).gameObject.SetActive(true);
                CarrierButtons[k].gameObject.transform.GetChild(0).gameObject.SetActive(false);
            }
            //StarsCarrier[k].SetActive(true);
        }
        CarrierButtons[PlayerPrefs.GetInt("compare")].gameObject.transform.GetChild(0).gameObject.SetActive(true);
        CarrierButtons[PlayerPrefs.GetInt("compare")].gameObject.GetComponent<Animator>().enabled = true;
        SoundsManager._instance.PlaySound(SoundsManager._instance.GameUIclicks);

        print("compare :" + unlok);
    }
    public void TimeMode()
    {
        if (ModeSelection)
            ModeSelection.SetActive(false);
        if (TimeLevel)
            TimeLevel.SetActive(true);
        PlayerPrefs.SetInt("mode", 1);
        int unlok2 = PlayerPrefs.GetInt("compare2");
        for (int k = 0; k <= unlok2; k++)
        {
            TimeButtons[k].interactable = true;
            TimeLock[k].SetActive(false);
            if (k < unlok2)
            {
                TimeButtons[k].gameObject.transform.GetChild(1).gameObject.SetActive(true);
                TimeButtons[k].gameObject.transform.GetChild(0).gameObject.SetActive(false);
            }
            //StarsTime[k].SetActive(true);
        }
        TimeButtons[PlayerPrefs.GetInt("compare2")].gameObject.transform.GetChild(0).gameObject.SetActive(true);
        TimeButtons[PlayerPrefs.GetInt("compare2")].gameObject.GetComponent<Animator>().enabled = true;
        SoundsManager._instance.PlaySound(SoundsManager._instance.GameUIclicks);

        print("compare2 :" + unlok2);
    }
    public void Mega()
    {
        if (ModeSelection)
            ModeSelection.SetActive(false);
        if (MegaLevel)
            MegaLevel.SetActive(true);
        PlayerPrefs.SetInt("mode", 2);
        int unlok3 = PlayerPrefs.GetInt("compare3");
        for (int k = 0; k <= unlok3; k++)
        {
            MegaButtons[k].interactable = true;
            if (k < unlok3)
            {
                MegaButtons[k].gameObject.transform.GetChild(1).gameObject.SetActive(true);
                MegaButtons[k].gameObject.transform.GetChild(0).gameObject.SetActive(false);
            }
            MegaLock[k].SetActive(false);
            //MegaStar[k].SetActive(true);
        }
        MegaButtons[PlayerPrefs.GetInt("compare3")].gameObject.transform.GetChild(0).gameObject.SetActive(true);
        MegaButtons[PlayerPrefs.GetInt("compare3")].gameObject.GetComponent<Animator>().enabled = true;
        SoundsManager._instance.PlaySound(SoundsManager._instance.GameUIclicks);

        print("compare3 :" + unlok3);
    }
    public void Express()
    {
        if (ModeSelection)
            ModeSelection.SetActive(false);
        if (ExpressLevel)
            ExpressLevel.SetActive(true);
        PlayerPrefs.SetInt("mode", 3);
        int unlok4 = PlayerPrefs.GetInt("compare4");
        for (int k = 0; k <= unlok4; k++)
        {
            ExpressButtons[k].interactable = true;
            ExpressLock[k].SetActive(false);
            if (k < unlok4)
            {
                ExpressButtons[k].gameObject.transform.GetChild(1).gameObject.SetActive(true);
                ExpressButtons[k].gameObject.transform.GetChild(0).gameObject.SetActive(false);
            }
            //StarExpress[k].SetActive(true);
        }
        ExpressButtons[PlayerPrefs.GetInt("compare4")].gameObject.transform.GetChild(0).gameObject.SetActive(true);
        ExpressButtons[PlayerPrefs.GetInt("compare4")].gameObject.GetComponent<Animator>().enabled = true;
        SoundsManager._instance.PlaySound(SoundsManager._instance.GameUIclicks);

        print("compare4 :" + unlok4);
    }
    public void Highway()
    {
        if (ModeSelection)
            ModeSelection.SetActive(false);
        if (HighwayLevel)
            HighwayLevel.SetActive(true);
        PlayerPrefs.SetInt("mode", 4);
        int unlok5 = PlayerPrefs.GetInt("compare5");
        for (int k = 0; k <= unlok5; k++)
        {
            HighwayButtons[k].interactable = true;
            HighwayLock[k].SetActive(false);
            if (k < unlok5)
            {
                HighwayButtons[k].gameObject.transform.GetChild(1).gameObject.SetActive(true);
                HighwayButtons[k].gameObject.transform.GetChild(0).gameObject.SetActive(false);
            }
            //StarHighway[k].SetActive(true);
        }
        HighwayButtons[PlayerPrefs.GetInt("compare4")].gameObject.transform.GetChild(0).gameObject.SetActive(true);
        HighwayLock[PlayerPrefs.GetInt("compare4")].gameObject.GetComponent<Animator>().enabled = true;
        SoundsManager._instance.PlaySound(SoundsManager._instance.GameUIclicks);

        print("compare5 :" + unlok5);
    }
    public void Free()
    {
        if (ModeSelection)
            ModeSelection.SetActive(false);
        if (CarrierLevel)
            CarrierLevel.SetActive(true);
        PlayerPrefs.SetInt("mode", 5);
        SoundsManager._instance.PlaySound(SoundsManager._instance.GameUIclicks);

    }
    public void OnQuit()
    {
        MainPanel.SetActive(false);
        QuitPanel.SetActive(true);
        SoundsManager._instance.PlaySound(SoundsManager._instance.buttonPress);

    }

    public void OnQuitYes()
    {

        Application.Quit();
        SoundsManager._instance.PlaySound(SoundsManager._instance.buttonPress);

    }
    public void OnQuitNo()
    {

        QuitPanel.SetActive(false);
        MainPanel.SetActive(true);
        SoundsManager._instance.PlaySound(SoundsManager._instance.buttonPress);

    }
    public void rateUs()
    {
        Application.OpenURL("https://play.google.com/store/apps/details?id=com.formula.car.mega.ramp.racing.game");
        SoundsManager._instance.PlaySound(SoundsManager._instance.GameUIclicks);


    }
    public void moreApps()
    {

        Application.OpenURL("https://play.google.com/store/apps/developer?id=Hi+Gamez");
        SoundsManager._instance.PlaySound(SoundsManager._instance.GameUIclicks);


    }
    public void LevelSelection(int num)
    {
        PlayerPrefs.SetInt("level_number", num);
        //FirebaseHandler.instance.logLevelStarted("Selected_Level_", (PlayerPrefs.GetInt("level_number")).ToString());
        TimeLevel.SetActive(false);
        CarrierLevel.SetActive(false);
        MegaLevel.SetActive(false);
        Weather.SetActive(true);
        SoundsManager._instance.PlaySound(SoundsManager._instance.GameUIclicks);


        //isloading = true;
    }

    public void LevelBackbtn()
    {
        CarrierLevel.SetActive(false);
        TimeLevel.SetActive(false);
        MegaLevel.SetActive(false);
        HighwayLevel.SetActive(false);
        ExpressLevel.SetActive(false);
        ModeSelection.SetActive(true);
        SoundsManager._instance.PlaySound(SoundsManager._instance.buttonPress);

    }
    public void UnloackLevels()
    {

        PlayerPrefs.SetInt("btnof", 1);
        PlayerPrefs.SetInt("compare", 24);
        int unlok = PlayerPrefs.GetInt("compare");
        for (int k = 0; k <= unlok; k++)
        {
            CarrierButtons[k].interactable = true;
        }

    }
    //-----------------------------------User_Function----------------------------
    //IEnumerator Onload()
    //{
    //       Env = true;
    //       yield return new WaitForSeconds (5f);
    //       SceneManager.LoadScene("GameplayStunt");
    //   }
    //----------------------------------------------------------------------------
    public void SoundOn()
    {
        AudioListener.volume = 1;
        SoundsManager._instance.PlaySound(SoundsManager._instance.GameUIclicks);

    }
    public void SoundOff()
    {
        AudioListener.volume = 0;

    }

}
