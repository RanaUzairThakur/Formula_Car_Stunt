using System.Collections;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class GamePlayManager : MonoBehaviour
{
    public GameObject RcPanel, PausePanel, CarSelectionPanel, rccam, buybtn, Selectbtn, PurchasedText, LowCashText, LockImage, unlockcarbtn, addloading, Skip, Header, Footer;
    public GameObject CompletePanel, VictoryPanel;

    public GameObject GiftPanel, SelectionCamera;
    public GameObject Fadescreen;
    public GameObject Startpoint/*,boundery,//Boundry2, //Boundry3, //Boundry4*/;
    public GameObject[] CarrierLevels, MegaLevels, CarModle, carButton, CarScpecification/*, //Endpoint*/;
    public GameObject Car1, Car2, Car3, Car4, Car5, Car6, Car7, Car8, Car9, Car10;
    public GameObject[] CutScene_Cam;
    public GameObject[] Counting_Text;
    public Material[] Skyboxes;
    public int ModleNum;
    private int SpecificNum;
    public static bool isnextClick = false;
    // public static bool Env;
    public Text cash, modeCash, CashRequired, LevelText;
    public static GamePlayManager inst;
    public Animator SettingA, uianim;
    public static bool tfunction = false;
    public GameObject Nos_Button, Nos_Button2, NosHover, TimeBar, TutorailPanel, TrigerObject, TrigerObject2, LeftRightPanel, left, right;
    public GameObject Driver, DanceGirl;
    public bool Cars;
    public bool Testing;
    public int LevelNumber, carIndex;
    RCC_CarControllerV3 RCC;
    void Awake()
    {
        inst = this;
    }
    void Start()
    {

        if (Testing)
        {
            PlayerPrefs.SetInt("level_number", LevelNumber);
        }
        LevelText.text = (PlayerPrefs.GetInt("level_number", LevelNumber) + 1).ToString();
        //PlayerPrefs.SetInt("cashin",50000);

        //RenderSettings.skybox = Skyboxes[PlayerPrefs.GetInt("Weather")];

        if (PlayerPrefs.GetInt("carunlock1") == 1)
        {
            unlockcarbtn.SetActive(false);
        }

        ModleNum = PlayerPrefs.GetInt("MNum");
        CarModle[ModleNum].SetActive(true);
        RCC = RCC_SceneManager.Instance.activePlayerVehicle;
        SpecificNum = PlayerPrefs.GetInt("MNum");
        CarScpecification[SpecificNum].SetActive(true);
        Time.timeScale = 1;
        AudioListener.volume = 1;
        cash.text = (" " + PlayerPrefs.GetInt("cashin"));

        //if (PlayerPrefs.GetInt("mode") == 0)
        //{
        //    this.gameObject.GetComponent<Level_Time>().enabled = false;
        //    TimeBar.SetActive(false);
        //    LevelSelection();

        //}
        //else if(PlayerPrefs.GetInt("mode") == 1)
        //{
        //    this.gameObject.GetComponent<Level_Time>().enabled = true;
        //    TimeBar.SetActive(true);
        //    LevelSelection();
        //}
        //else if (PlayerPrefs.GetInt("mode") == 2)
        //{
        //    this.gameObject.GetComponent<Level_Time>().enabled = true;
        //    TimeBar.SetActive(true);
        //    LevelSelection1();
        //}
        //else if (PlayerPrefs.GetInt("mode") == 3)
        //{
        //    this.gameObject.GetComponent<Level_Time>().enabled = true;
        //    TimeBar.SetActive(true);
        //    LevelSelection();
        //}
        //else if (PlayerPrefs.GetInt("mode") == 4)
        //{
        //    this.gameObject.GetComponent<Level_Time>().enabled = true;
        //    TimeBar.SetActive(true);
        //    LevelSelection1();
        //}

        if (PlayerPrefs.GetInt("Gift") == 1)
        {
            ModleSelctionBtn();
            PlayerPrefs.SetInt("Gift", 0);

        }
        //if (PlayerPrefs.GetInt("Carselection") == 1)
        //{
        //    CarSelectionPanel.SetActive(false);
        //    Driver.SetActive(false);
        //    DanceGirl.SetActive(false);
        //}
        //if (PlayerPrefs.GetInt("RewindOk") == 0)
        //{
        //    TrigerObject.SetActive(true);
        //    TrigerObject2.SetActive(true);
        //    PlayerPrefs.SetInt("RewindOk", 1);
        //}
    }
    //-------------------------------Button_Functions---------------------------
    public void Rewind()
    {
        TutorailPanel.SetActive(false);

        TimeRevive.Instance.StartRewind(3);
    }
    public void moreApps()
    {

        Application.OpenURL("https://play.google.com/store/apps/developer?id=Hi+Gamez");
        SoundsManager1._instance.PlaySound(SoundsManager1._instance.GameUIclicks);

    }
    public void OnPause()
    {
        RcPanel.SetActive(false);
        PausePanel.SetActive(true);
        SoundsManager1._instance.PlaySound(SoundsManager1._instance.GameUIclicks);
        AudioListener.volume = 0;
        Time.timeScale = 0;
    }
    public void OnResume()
    {
        RcPanel.SetActive(true);
        PausePanel.SetActive(false);
        SoundsManager1._instance.PlaySound(SoundsManager1._instance.GameUIclicks);
        Time.timeScale = 1;
        AudioListener.volume = 1;
    }
  
    public void OnRestart()
    {

        SoundsManager1._instance.PlaySound(SoundsManager1._instance.GameUIclicks);
        SceneManager.LoadScene("GameplayStunt");
    }
    public void OnCompleteRestart()
    {

        PlayerPrefs.SetInt("level_number", PlayerPrefs.GetInt("level_number") - 1);
        SceneManager.LoadScene("GameplayStunt");
    }
    public void OnHome()
    {
        isnextClick = true;
        SoundsManager1._instance.PlaySound(SoundsManager1._instance.GameUIclicks);
        SceneManager.LoadScene("MainStunt");
    }
    public void OnNext()
    {

        SceneManager.LoadScene("GameplayStunt");
        if (PlayerPrefs.GetInt("level_number") <= 9)
        {
            //PlayerPrefs.SetInt("MNum", PlayerPrefs.GetInt("level_number"));

        }
        if (PlayerPrefs.GetInt("mode") == 0 && PlayerPrefs.GetInt("level_number") > 14)
        {
            //Debug.LogError("00000000");
            PlayerPrefs.SetInt("level_number", 0);
            PlayerPrefs.SetInt("mode", 1);
            this.gameObject.GetComponent<Level_Time>().enabled = true;
            TimeBar.SetActive(true);
            LevelSelection();
        }
        if (PlayerPrefs.GetInt("mode") == 1 && PlayerPrefs.GetInt("level_number") > 14)
        {
            //Debug.LogError("11111111");
            PlayerPrefs.SetInt("level_number", 0);
            PlayerPrefs.SetInt("mode", 2);
            this.gameObject.GetComponent<Level_Time>().enabled = true;
            TimeBar.SetActive(true);
            LevelSelection1();
        }
        if (PlayerPrefs.GetInt("mode") == 2 && PlayerPrefs.GetInt("level_number") > 14)
        {
            //Debug.LogError("11111111");
            PlayerPrefs.SetInt("level_number", 0);
            PlayerPrefs.SetInt("mode", 3);
            this.gameObject.GetComponent<Level_Time>().enabled = true;
            TimeBar.SetActive(true);
            LevelSelection();
        }
        if (PlayerPrefs.GetInt("mode") == 3 && PlayerPrefs.GetInt("level_number") > 14)
        {
            //Debug.LogError("11111111");
            PlayerPrefs.SetInt("level_number", 0);
            PlayerPrefs.SetInt("mode", 4);
            this.gameObject.GetComponent<Level_Time>().enabled = true;
            TimeBar.SetActive(true);
            LevelSelection1();
        }
        PlayerPrefs.SetInt("Gift", 1);
        // PlayerPrefs.SetInt("Carselection", 1);
        CompletePanel.SetActive(false);
        GiftPanel.SetActive(true);
        SoundsManager1._instance.PlaySound(SoundsManager1._instance.GameUIclicks);

    }
    public void Complete()
    {
        set_StatusVictorPanel();
    }

    public void toglee()
    {
        if (tfunction == false)
        {

            uianim.SetBool("Open", true);
            tfunction = true;

        }
        else if (tfunction)
        {
            tfunction = false;
            uianim.SetBool("Open", false);

        }
        SoundsManager1._instance.PlaySound(SoundsManager1._instance.GameUIclicks);
    }
    public void FirstSkipOn()
    {
        CancelInvoke(nameof(FirstSkipOn));
        DemoManager.Instance.SkipButton.SetActive(true);
    }
    //---------------------------------------------------------------------------

    //----------------------------------Functions--------------------------------
    public int Num;
    public void LevelSelection()
    {
         Num = PlayerPrefs.GetInt("level_number");
        if (CarrierLevels[Num].GetComponent<Leveldata>())
        {
            CarModle[PlayerPrefs.GetInt("MNum", ModleNum)].transform.position = CarrierLevels[Num].GetComponent<Leveldata>().Playerspawnpoint.position;
            CarModle[PlayerPrefs.GetInt("MNum", ModleNum)].transform.rotation = CarrierLevels[Num].GetComponent<Leveldata>().Playerspawnpoint.rotation;
        }

        if (Num == 0)
        {
            CarrierLevels[0].SetActive(true);

        }
        else if (Num == 1)
        {
            CarrierLevels[1].SetActive(true);

        }
        else if (Num == 2)
        {
            CarrierLevels[2].SetActive(true);

        }
        else if (Num == 3)
        {
            //Boundry2.SetActive(true);
            CarrierLevels[3].SetActive(true);

        }
        else if (Num == 4)
        {
            CarrierLevels[4].SetActive(true);
        }
        else if (Num == 5)
        {
            CarrierLevels[5].SetActive(true);

        }
        else if (Num == 6)
        {
            CarrierLevels[6].SetActive(true);

        }
        else if (Num == 7)
        {
            CarrierLevels[7].SetActive(true);
        }
        else if (Num == 8)
        {
            CarrierLevels[8].SetActive(true);

        }
        else if (Num == 9)
        {
            CarrierLevels[9].SetActive(true);

        }
        else if (Num == 10)
        {
            CarrierLevels[10].SetActive(true);

        }
        else if (Num == 11)
        {
            CarrierLevels[11].SetActive(true);

        }
        else if (Num == 12)
        {
            CarrierLevels[12].SetActive(true);


        }
        else if (Num == 13)
        {
            CarrierLevels[13].SetActive(true);

        }
        else if (Num == 14)
        {
            CarrierLevels[14].SetActive(true);

        }
        else if (Num == 15)
        {
            CarrierLevels[15].SetActive(true);

        }
        else if (Num == 16)
        {
            CarrierLevels[16].SetActive(true);

        }
        else if (Num == 17)
        {
            CarrierLevels[17].SetActive(true);

        }
        else if (Num == 18)
        {
            CarrierLevels[18].SetActive(true);
        }
        else if (Num == 19)
        {
            CarrierLevels[19].SetActive(true);

        }
        else if (Num == 20)
        {
            CarrierLevels[20].SetActive(true);

        }
        else if (Num == 21)
        {
            CarrierLevels[21].SetActive(true);

        }
        else if (Num == 22)
        {
            CarrierLevels[22].SetActive(true);

        }
        else if (Num == 23)
        {
            CarrierLevels[23].SetActive(true);

        }
        else if (Num == 24)
        {
            CarrierLevels[24].SetActive(true);

        }

    }

    public void LevelSelection1()
    {
        int Num = PlayerPrefs.GetInt("level_number");
        if (Num == 0)
        {
            MegaLevels[0].SetActive(true);
          

        }
        else if (Num == 1)
        {
            MegaLevels[1].SetActive(true);
          
        }
        else if (Num == 2)
        {
            MegaLevels[2].SetActive(true);
          
        }
        else if (Num == 3)
        {
            MegaLevels[3].SetActive(true);
          
        }
        else if (Num == 4)
        {
            MegaLevels[4].SetActive(true);
        
        }
        else if (Num == 5)
        {
            MegaLevels[5].SetActive(true);
           
        }
        else if (Num == 6)
        {
            MegaLevels[6].SetActive(true);
          
        }
        else if (Num == 7)
        {
            MegaLevels[7].SetActive(true);
         
        }
        else if (Num == 8)
        {
            MegaLevels[8].SetActive(true);
          
        }
        else if (Num == 9)
        {
            MegaLevels[9].SetActive(true);
         
        }
        else if (Num == 10)
        {
            MegaLevels[10].SetActive(true);
        
        }
        else if (Num == 11)
        {
            MegaLevels[11].SetActive(true);

        }
        else if (Num == 12)
        {
            MegaLevels[12].SetActive(true);
          
        }
        else if (Num == 13)
        {
            MegaLevels[13].SetActive(true);
           

        }
        else if (Num == 14)
        {
            MegaLevels[14].SetActive(true);
           
        }
        else if (Num == 15)
        {
            MegaLevels[15].SetActive(true);
           

        }
        else if (Num == 16)
        {
            MegaLevels[16].SetActive(true);
           
        }
        else if (Num == 17)
        {
            MegaLevels[17].SetActive(true);
           

        }
        else if (Num == 18)
        {
            MegaLevels[18].SetActive(true);
           
        }
        else if (Num == 19)
        {
            MegaLevels[19].SetActive(true);
           
        }
        else if (Num == 20)
        {
            MegaLevels[20].SetActive(true);
          
        }
        else if (Num == 21)
        {
            MegaLevels[21].SetActive(true);
          
        }
        else if (Num == 22)
        {
            MegaLevels[22].SetActive(true);
          
        }
        else if (Num == 23)
        {
            MegaLevels[23].SetActive(true);
          
        }
        else if (Num == 24)
        {
            MegaLevels[24].SetActive(true);
           
        }
    }

    //------------------------------------CarSelection------------------------------


    public void NextModleBtn()
    {

        if (ModleNum < 9)
        {
            NextCar();
        }
        else
        {
            for (int k = 0; k < 10; k++)
            {
                CarModle[k].SetActive(false);
                CarScpecification[k].SetActive(false);
            }
            CarModle[0].SetActive(true);
            ModleNum = 0;
            SpecificNum = 0;
            CarCheck();
        }
        SoundsManager1._instance.PlaySound(SoundsManager1._instance.GameUIclicks);
    }
    public void PreviousModleBtn()
    {

        if (ModleNum > 0)
        {
            PreviousCar();

        }
        else
        {
            for (int k = 0; k < 10; k++)
            {
                CarModle[k].SetActive(false);
                CarScpecification[k].SetActive(false);
            }
            CarModle[9].SetActive(true);
            ModleNum = 9;
            SpecificNum = 9;
            CarCheck();
        }
        SoundsManager1._instance.PlaySound(SoundsManager1._instance.GameUIclicks);

    }
    public void ModleSelctionBtn()
    {
        StartCoroutine(Active_levelsandCar());
       // Invoke(nameof(FirstSkipOn), 5f);
        RenderSettings.skybox = Skyboxes[/*PlayerPrefs.GetInt("Weather")*/ Num];
        SoundsManager1._instance.PlaySound(SoundsManager1._instance.GameUIclicks);
        SoundsManager1._instance.Stop_PlayingMusic();

    }

    private IEnumerator Active_levelsandCar()
    {
        addloading.SetActive(true);
        yield return new WaitForSeconds(2.5f);
        if (PlayerPrefs.GetInt("mode") == 0)
        {
           // this.gameObject.GetComponent<Level_Time>().enabled = false;
          //  TimeBar.SetActive(false);
            LevelSelection();
            FirebaseHandler.instance.logLevelStarted("_TrainerMode", PlayerPrefs.GetInt("level_number").ToString());

        }
        else if (PlayerPrefs.GetInt("mode") == 1)
        {
            //  this.gameObject.GetComponent<Level_Time>().enabled = true;
            //   TimeBar.SetActive(true);
            //  LevelSelection();
            LevelSelection1();
            FirebaseHandler.instance.logLevelStarted("_MasterMode", PlayerPrefs.GetInt("level_number").ToString());
        }
        else if (PlayerPrefs.GetInt("mode") == 2)
        {
            this.gameObject.GetComponent<Level_Time>().enabled = true;
            TimeBar.SetActive(true);
            LevelSelection1();
        }
        else if (PlayerPrefs.GetInt("mode") == 3)
        {
            this.gameObject.GetComponent<Level_Time>().enabled = true;
            TimeBar.SetActive(true);
            LevelSelection();
        }
        else if (PlayerPrefs.GetInt("mode") == 4)
        {
            this.gameObject.GetComponent<Level_Time>().enabled = true;
            TimeBar.SetActive(true);
            LevelSelection1();
        }
        CarModle[ModleNum].SetActive(false);
        PlayerPrefs.SetInt("MNum", ModleNum);
        CarSelectionPanel.SetActive(false);
        //DemoManager.Instance.Demos[PlayerPrefs.GetInt("level_number")].SetActive(true);
        //DemoManager.Instance.Car_List[PlayerPrefs.GetInt("MNum")].SetActive(true);
        DemoManager.Instance.Swpan();
        SelectionCamera.SetActive(false);
        addloading.SetActive(false);
        StopCoroutine(Active_levelsandCar());
        SoundsManager1._instance.PlaySound(SoundsManager1._instance.GameUIclicks);

    }
    public void ActiveCar()
    {
        CarModle[PlayerPrefs.GetInt("MNum", ModleNum)].SetActive(true);
        RCC = RCC_SceneManager.Instance.activePlayerVehicle;
        SoundsManager1._instance.PlaySound(SoundsManager1._instance.GameUIclicks);
    }
    public void OneTwoThreeGo()
    {
        StartCoroutine(Cut_Scene());  //ali
    }
    IEnumerator Go_Off()
    {
        Counting_Text[3].SetActive(true);
        yield return new WaitForSeconds(2f);
        Counting_Text[3].SetActive(false);
        Driver.SetActive(false);
        DanceGirl.SetActive(false);
    }
    public void Skip_CutScene()
    {
        Skip.SetActive(false);
        CarSelectionPanel.SetActive(false);
        RcPanel.SetActive(true);
        rccam.SetActive(true);
        StartCoroutine(Go_Off());
        CutScene_Cam[0].SetActive(false);
        CutScene_Cam[1].SetActive(false);
        CutScene_Cam[2].SetActive(false);
        Counting_Text[0].SetActive(false);
        Counting_Text[1].SetActive(false);
        Counting_Text[2].SetActive(false);
        StopAllCoroutines();
        SoundsManager1._instance.PlayMusic_Game(Random.Range(0, SoundsManager1._instance.gameBG.Length));
        //Header.SetActive(false);
        //Footer.SetActive(false);

    }
    IEnumerator Cut_Scene()
    {
        CutScene_Cam[0].SetActive(true);
        Counting_Text[0].SetActive(true);
        yield return new WaitForSeconds(2f);
        Counting_Text[0].SetActive(false);
        Counting_Text[1].SetActive(true);
        CutScene_Cam[0].SetActive(false);
        CutScene_Cam[1].SetActive(true);
        yield return new WaitForSeconds(2f);
        Counting_Text[2].SetActive(true);
        Counting_Text[1].SetActive(false);
        CutScene_Cam[1].SetActive(false);
        CutScene_Cam[2].SetActive(true);
        // Header.gameObject.GetComponent<Animator>().enabled = true;
        //Footer.gameObject.GetComponent<Animator>().enabled = true;
        yield return new WaitForSeconds(2f);
        StartCoroutine(Go_Off());
        Counting_Text[2].SetActive(false);
        CutScene_Cam[2].SetActive(false);
        CarSelectionPanel.SetActive(false);
        //Header.SetActive(false);
        //Footer.SetActive(false);
        Skip.SetActive(false);
        RcPanel.SetActive(true);
        rccam.SetActive(true);
        SoundsManager1._instance.PlayMusic_Game(Random.Range(0, SoundsManager1._instance.gameBG.Length));
    }
    public void PreviousCar()
    {
        for (int counter = 0; counter < CarScpecification.Length; counter++)
        {
            CarScpecification[counter].SetActive(false);
        }
        CarModle[carIndex].SetActive(false);

        CarModle[ModleNum].SetActive(false);
        ModleNum--;
        SpecificNum--;
        CarModle[ModleNum].SetActive(true);
        CarScpecification[SpecificNum].SetActive(true);
        CarCheck();

    }
    public void NextCar()
    {
        for (int counter = 0; counter < CarScpecification.Length; counter++)
        {
            CarScpecification[counter].SetActive(false);
        }
        CarModle[carIndex].SetActive(false);

        CarModle[ModleNum].SetActive(false);
        ModleNum++;
        SpecificNum++;
        CarModle[ModleNum].SetActive(true);
        CarScpecification[SpecificNum].SetActive(true);
        CarCheck();

    }
    //public bool N;
    //private void Update()
    //{
    //    if (N)
    //    {
    //        CarModle[ModleNum].GetComponent<RCC_CarControllerV3>()._boostInput = 1.6f;
    //        CarModle[ModleNum].GetComponent<RCC_CarControllerV3>().NoS = 6f;

    //    }
    //}
    public void LeftRightOff()
    {
        Time.timeScale = 1;
        RcPanel.SetActive(true);
        LeftRightPanel.SetActive(false);
        left.GetComponent<Animator>().enabled = false;
        right.GetComponent<Animator>().enabled = false;

    }

    public void nos_Up()
    {
        //N = true;
        if (!RCC)
        {
            RCC = RCC_SceneManager.Instance.activePlayerVehicle;
            Debug.LogWarning("Rcc is Null");
        }
        if (RCC.direction == -1)
            return;

        RCC.nos_IsActive = true;
    }
    public void nos_Down()
    {
        if (RCC.direction == -1)
            return;
        //N = false;
        RCC.nos_IsActive = false;
        RCC.Nos_stop();
        NosHover.SetActive(true);
    }
    //----------------Car_shop----------------------------------------------------

    private void CarCheck()
    {
        if (ModleNum == 0)
        {
            buybtn.SetActive(false);
            Selectbtn.SetActive(true);
            LockImage.SetActive(false);
            // Car1.SetActive(true);

        }
        else if (ModleNum == 1 && PlayerPrefs.GetInt("car1") == 1)
        {
            buybtn.SetActive(false);
            Selectbtn.SetActive(true);
            LockImage.SetActive(false);
            // Car2.SetActive(true);

        }
        else if (ModleNum == 2 && PlayerPrefs.GetInt("car2") == 1)
        {
            buybtn.SetActive(false);
            Selectbtn.SetActive(true);
            LockImage.SetActive(false);
            //Car3.SetActive(true);

        }
        else if (ModleNum == 3 && PlayerPrefs.GetInt("car3") == 1)
        {
            buybtn.SetActive(false);
            Selectbtn.SetActive(true);
            LockImage.SetActive(false);
            //Car4.SetActive(true);

        }
        else if (ModleNum == 4 && PlayerPrefs.GetInt("car4") == 1)
        {
            buybtn.SetActive(false);
            Selectbtn.SetActive(true);
            LockImage.SetActive(false);
            // Car5.SetActive(true);

        }
        else if (ModleNum == 5 && PlayerPrefs.GetInt("car5") == 1)
        {
            buybtn.SetActive(false);
            Selectbtn.SetActive(true);
            LockImage.SetActive(false);
            //Car6.SetActive(true);

        }
        else if (ModleNum == 6 && PlayerPrefs.GetInt("car6") == 1)
        {
            buybtn.SetActive(false);
            Selectbtn.SetActive(true);
            LockImage.SetActive(false);
            //Car7.SetActive(true);

        }
        else if (ModleNum == 7 && PlayerPrefs.GetInt("car7") == 1)
        {
            buybtn.SetActive(false);
            Selectbtn.SetActive(true);
            LockImage.SetActive(false);
            //Car8.SetActive(true);

        }
        else if (ModleNum == 8 && PlayerPrefs.GetInt("car8") == 1)
        {
            buybtn.SetActive(false);
            Selectbtn.SetActive(true);
            LockImage.SetActive(false);
            //Car9.SetActive(true);
        }
        else if (ModleNum == 9 && PlayerPrefs.GetInt("car9") == 1)
        {
            buybtn.SetActive(false);
            Selectbtn.SetActive(true);
            LockImage.SetActive(false);
            // Car10.SetActive(true);

        }
        else
        {
            buybtn.SetActive(true);
            Selectbtn.SetActive(false);
            LockImage.SetActive(true);
            if (ModleNum == 1)
            {
                CashRequired.text = (" 1500");
            }
            else if (ModleNum == 2)
            {
                CashRequired.text = (" 2000");
            }
            else if (ModleNum == 3)
            {
                CashRequired.text = (" 3000");
            }
            else if (ModleNum == 4)
            {
                CashRequired.text = (" 3500");
            }
            else if (ModleNum == 5)
            {
                CashRequired.text = (" 4000");
            }
            else if (ModleNum == 6)
            {
                CashRequired.text = (" 4500");
            }
            else if (ModleNum == 7)
            {
                CashRequired.text = (" 5000");
            }
            else if (ModleNum == 8)
            {
                CashRequired.text = (" 5500");
            }
            else if (ModleNum == 9)
            {
                CashRequired.text = (" 6000");
            }


        }
    }

    public void UnlockCar()
    {
        PlayerPrefs.SetInt("carunlock1", 1);
        PlayerPrefs.SetInt("car1", 1);
        PlayerPrefs.SetInt("car2", 1);
        PlayerPrefs.SetInt("car3", 1);
        PlayerPrefs.SetInt("car4", 1);
        PlayerPrefs.SetInt("car5", 1);
        PlayerPrefs.SetInt("car6", 1);
        PlayerPrefs.SetInt("car7", 1);
        PlayerPrefs.SetInt("car8", 1);
        PlayerPrefs.SetInt("car9", 1);
        SoundsManager1._instance.PlaySound(SoundsManager1._instance.GameUIclicks);

        CarCheck();
    }

    public void buyCars()
    {

        if (ModleNum == 1 && PlayerPrefs.GetInt("cashin") >= 1500)
        {
            PlayerPrefs.SetInt("cashin", PlayerPrefs.GetInt("cashin") - 1500);
            PlayerPrefs.SetInt("car1", 1);
            cash.text = (" " + PlayerPrefs.GetInt("cashin"));
            buybtn.SetActive(false);
            PurchasedText.SetActive(true);
            Invoke("textoff", 3f);
        }

        else if (ModleNum == 2 && PlayerPrefs.GetInt("cashin") >= 2000)
        {
            PlayerPrefs.SetInt("cashin", PlayerPrefs.GetInt("cashin") - 2000);
            PlayerPrefs.SetInt("car2", 1);
            cash.text = (" " + PlayerPrefs.GetInt("cashin"));
            buybtn.SetActive(false);
            PurchasedText.SetActive(true);
            Invoke("textoff", 3f);
        }

        else if (ModleNum == 3 && PlayerPrefs.GetInt("cashin") >= 2500)
        {
            PlayerPrefs.SetInt("cashin", PlayerPrefs.GetInt("cashin") - 2500);
            PlayerPrefs.SetInt("car3", 1);
            cash.text = (" " + PlayerPrefs.GetInt("cashin"));
            buybtn.SetActive(false);
            PurchasedText.SetActive(true);
            Invoke("textoff", 3f);
        }

        else if (ModleNum == 4 && PlayerPrefs.GetInt("cashin") >= 3000)
        {
            PlayerPrefs.SetInt("cashin", PlayerPrefs.GetInt("cashin") - 3000);
            PlayerPrefs.SetInt("car4", 1);
            cash.text = (" " + PlayerPrefs.GetInt("cashin"));
            buybtn.SetActive(false);
            PurchasedText.SetActive(true);
            Invoke("textoff", 3f);
        }
        else if (ModleNum == 5 && PlayerPrefs.GetInt("cashin") >= 3500)
        {
            PlayerPrefs.SetInt("cashin", PlayerPrefs.GetInt("cashin") - 3500);
            PlayerPrefs.SetInt("car5", 1);
            cash.text = (" " + PlayerPrefs.GetInt("cashin"));
            buybtn.SetActive(false);
            PurchasedText.SetActive(true);
            Invoke("textoff", 3f);
        }

        else if (ModleNum == 6 && PlayerPrefs.GetInt("cashin") >= 4000)
        {
            PlayerPrefs.SetInt("cashin", PlayerPrefs.GetInt("cashin") - 4000);
            PlayerPrefs.SetInt("car6", 1);
            cash.text = (" " + PlayerPrefs.GetInt("cashin"));
            buybtn.SetActive(false);
            PurchasedText.SetActive(true);
            Invoke("textoff", 3f);
        }
        else if (ModleNum == 7 && PlayerPrefs.GetInt("cashin") >= 4500)
        {
            PlayerPrefs.SetInt("cashin", PlayerPrefs.GetInt("cashin") - 4500);
            PlayerPrefs.SetInt("car7", 1);
            cash.text = (" " + PlayerPrefs.GetInt("cashin"));
            buybtn.SetActive(false);
            PurchasedText.SetActive(true);
            Invoke("textoff", 3f);
        }
        else if (ModleNum == 8 && PlayerPrefs.GetInt("cashin") >= 5000)
        {
            PlayerPrefs.SetInt("cashin", PlayerPrefs.GetInt("cashin") - 5000);
            PlayerPrefs.SetInt("car8", 1);
            cash.text = (" " + PlayerPrefs.GetInt("cashin"));
            buybtn.SetActive(false);
            PurchasedText.SetActive(true);
            Invoke("textoff", 3f);
        }


        else if (ModleNum == 9 && PlayerPrefs.GetInt("cashin") >= 6000)
        {
            PlayerPrefs.SetInt("cashin", PlayerPrefs.GetInt("cashin") - 60000);
            PlayerPrefs.SetInt("car9", 1);
            cash.text = (" " + PlayerPrefs.GetInt("cashin"));
            buybtn.SetActive(false);
            PurchasedText.SetActive(true);
            Invoke("textoff", 3f);
        }
        else
        {
            LowCashText.SetActive(true);
            Invoke("textoff", 3f);
        }

        CarCheck();
        SoundsManager1._instance.PlaySound(SoundsManager1._instance.GameUIclicks);

    }
    private void textoff()
    {
        PurchasedText.SetActive(false);
        LowCashText.SetActive(false);
    }
    //IEnumerator loadinghide()
    //{
    //    yield return new WaitForSeconds(2f);
    //    addloading.SetActive(false);
    //}
    //-------------------------------------Shop_Ends----------------------------

    //public void RewarVideo()
    //{
    //    AdsManager.Instance.ShowRewardedInterstitialAd(1000);
    //}
    public void CarActiveOnButton(int index)
    {

        for (int k = 0; k < carButton.Length; k++)
        {
            CarModle[k].SetActive(false);
            CarScpecification[k].SetActive(false);

        }
        CarModle[index].SetActive(true);
        CarScpecification[index].SetActive(true);

        ModleNum = index;
        SpecificNum = index;
        carIndex = index;
        CarCheck();
    }

    public void set_CurrentVehiclestatus(bool val)
    {
        CarModle[ModleNum].SetActive(val);
        rccam.SetActive(val);
    }


    #region Victory
    public void set_StatusVictorPanel()
    {
        int ran = Random.Range(500, 1000);
        PlayerPrefs.SetInt("cashin", PlayerPrefs.GetInt("cashin") + ran);
        //Star.SetActive(false);
        VictoryPanel.SetActive(false);
        CompletePanel.SetActive(true);
        SoundsManager1._instance.PlaySound(SoundsManager1._instance.levelComplete);
        //Level_Time.ispause = false;
        Time.timeScale = 0;
    }
    public void Set_statusCongartulations()
    {
        VictoryPanel.SetActive(true);
        CompletePanel.SetActive(false);
        print("Set_statusCongartulations");
        PlayerPrefs.SetInt("level_number", PlayerPrefs.GetInt("level_number") + 1);
        if (PlayerPrefs.GetInt("mode") == 0)
        {
            int min = PlayerPrefs.GetInt("level_number");
            int max = PlayerPrefs.GetInt("compare");
            if (max < min)
            {
                PlayerPrefs.SetInt("compare", min);
            }
            FirebaseHandler.instance.logLevelCompleted("_TrainerMode", PlayerPrefs.GetInt("level_number").ToString());

        }

        if (PlayerPrefs.GetInt("mode") == 1)
        {
            int min1 = PlayerPrefs.GetInt("level_number");
            int max1 = PlayerPrefs.GetInt("compare2");
            if (max1 < min1)
            {
                PlayerPrefs.SetInt("compare2", min1);

            }
            FirebaseHandler.instance.logLevelCompleted("_MasterMode", PlayerPrefs.GetInt("level_number").ToString());
        }
        if (PlayerPrefs.GetInt("mode") == 2)
        {
            int min2 = PlayerPrefs.GetInt("level_number");
            int max2 = PlayerPrefs.GetInt("compare3");
            if (max2 < min2)
            {
                PlayerPrefs.SetInt("compare3", min2);

            }
        }
        if (PlayerPrefs.GetInt("mode") == 3)
        {
            int min2 = PlayerPrefs.GetInt("level_number");
            int max2 = PlayerPrefs.GetInt("compare4");
            if (max2 < min2)
            {
                PlayerPrefs.SetInt("compare4", min2);

            }
        }
        if (PlayerPrefs.GetInt("mode") == 4)
        {
            int min2 = PlayerPrefs.GetInt("level_number");
            int max2 = PlayerPrefs.GetInt("compare5");
            if (max2 < min2)
            {
                PlayerPrefs.SetInt("compare5", min2);

            }
        }

        PlayerPrefs.SetInt("Weather", Random.Range(0, 5));
        PlayerPrefs.SetInt("Gift", 0);
    }
    #endregion

    #region Vehiclestatus
    public void Resetvehicle()
    {
        if (RCC_SceneManager.Instance.activePlayerVehicle.GetComponent<PlayerTriggerListener>())
            RCC_SceneManager.Instance.activePlayerVehicle.GetComponent<PlayerTriggerListener>().set_StatusVehicleReset();
    }
    #endregion

    #region ButtonListener
    int i = 0;
    public void set_StatusRadioMusic()
    {
        SoundsManager1._instance.Stop_PlayingMusic();

        SoundsManager1._instance.PlayMusic_Game(i);
        i++;
        if (i >= SoundsManager1._instance.gameBG.Length)
        {
            i = 0;
        }
        Debug.Log(i);
    }
    #endregion
}
