using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class GamePlayManager : MonoBehaviour {
	public GameObject RcPanel,PausePanel,CarSelectionPanel,rccam,buybtn,Selectbtn,PurchasedText,LowCashText,LockImage,unlockcarbtn, addloading,Skip,Header,Footer;
    public GameObject GiftPanel,SelectionCamera;
    public GameObject Fadescreen;
	public GameObject Startpoint/*,boundery,//Boundry2, //Boundry3, //Boundry4*/;
    public GameObject[] CarrierLevels,MegaLevels, CarModle, CarScpecification/*, //Endpoint*/;
    public GameObject Car1, Car2, Car3, Car4, Car5, Car6, Car7, Car8, Car9,Car10;
    public GameObject[] CutScene_Cam;
    public GameObject[] Counting_Text;
    public Material[] Skyboxes;
    public  int ModleNum;
    private int SpecificNum;
	public static bool isnextClick=false;
   // public static bool Env;
    public Text cash,CashRequired,LevelText;
	public static GamePlayManager inst;
	public Animator SettingA,uianim;
	public static bool tfunction=false;
    public GameObject Nos_Button,Nos_Button2, NosHover, TimeBar,TutorailPanel,TrigerObject,TrigerObject2,LeftRightPanel,left,right;
    public GameObject Driver, DanceGirl;
    public bool Cars;
    public bool Testing;
    public int LevelNumber;
    RCC_CarControllerV3 RCC;
	void Awake()
	{
		inst = this;
	}
	void Start () {

        if (Testing)
        {
            PlayerPrefs.SetInt("level_number", LevelNumber);
        }
        LevelText.text =( PlayerPrefs.GetInt("level_number", LevelNumber)+1).ToString();
        //PlayerPrefs.SetInt("cashin",50000);

        RenderSettings.skybox = Skyboxes[PlayerPrefs.GetInt("Weather")];
           
        if (PlayerPrefs.GetInt ("carunlock1") == 1) 
		{
			unlockcarbtn.SetActive (false);
		}

        ModleNum = PlayerPrefs.GetInt("MNum");
        CarModle[ModleNum].SetActive(true);
        RCC = CarModle[ModleNum].GetComponent<RCC_CarControllerV3>();
        SpecificNum = PlayerPrefs.GetInt("MNum");
        CarScpecification[SpecificNum].SetActive(true);
        Time.timeScale = 1;
		AudioListener.volume = 1;
		cash.text = (" " + PlayerPrefs.GetInt ("cashin"));

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
        
    }
    public void OnPause()
	{
        RcPanel.SetActive (false);
		PausePanel.SetActive (true);
		AudioListener.volume = 0;
        Time.timeScale = 0;		
	}
	public void OnResume()
	{
        RcPanel.SetActive (true);
		PausePanel.SetActive (false);
		Time.timeScale = 1;
		AudioListener.volume = 1;		
	}
    //private void Update()
    //{
    //    print("AudiListener :"+AudioListener.volume);
    //}
    public void OnRestart()
	{

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
        SceneManager.LoadScene("MainStunt");
	}
	public void OnNext()
	{
        SceneManager.LoadScene("GameplayStunt");
        if (PlayerPrefs.GetInt("level_number") <= 9)
        {
            PlayerPrefs.SetInt("MNum", PlayerPrefs.GetInt("level_number"));

        }
        if (PlayerPrefs.GetInt("mode") == 0 && PlayerPrefs.GetInt("level_number") > 24)
        {
            //Debug.LogError("00000000");
            PlayerPrefs.SetInt("level_number", 0);
            PlayerPrefs.SetInt("mode", 1);
            this.gameObject.GetComponent<Level_Time>().enabled = true;
            TimeBar.SetActive(true);
            LevelSelection();
        }
        if (PlayerPrefs.GetInt("mode") == 1 && PlayerPrefs.GetInt("level_number") > 24)
        {
            //Debug.LogError("11111111");
            PlayerPrefs.SetInt("level_number", 0);
            PlayerPrefs.SetInt("mode", 2);
            this.gameObject.GetComponent<Level_Time>().enabled = true;
            TimeBar.SetActive(true);
            LevelSelection1();
        }
        if (PlayerPrefs.GetInt("mode") == 2 && PlayerPrefs.GetInt("level_number") > 24)
        {
            //Debug.LogError("11111111");
            PlayerPrefs.SetInt("level_number", 0);
            PlayerPrefs.SetInt("mode", 3);
            this.gameObject.GetComponent<Level_Time>().enabled = true;
            TimeBar.SetActive(true);
            LevelSelection();
        }
        if (PlayerPrefs.GetInt("mode") == 3 && PlayerPrefs.GetInt("level_number") > 24)
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
        GCParkingbarScrip.instance.CompletePanel.SetActive(false);
        GiftPanel.SetActive(true);
    }
    public void Complete()
    {
        GCParkingbarScrip.instance.Success();
    }
	public void toglee()
	{
		if  (tfunction==false) 
		{

			uianim.SetBool ("Open", true);
			tfunction = true;

		}
		else if	(tfunction)
		{
			tfunction = false;
			uianim.SetBool ("Open", false);
			
		}
		
	}
    public void FirstSkipOn()
    {
        CancelInvoke(nameof(FirstSkipOn));
      DemoManager.Instance.SkipButton.SetActive(true);
    }
    //---------------------------------------------------------------------------

    //----------------------------------Functions--------------------------------

    public void LevelSelection()
	{
		int Num = PlayerPrefs.GetInt ("level_number");
		if (Num == 0) 
		{
			CarrierLevels[0].SetActive (true);
            //Endpoint[4].SetActive(true);
            //Endpoint[4].transform.position = new Vector3(5323, 117, 67);
            //Endpoint[4].transform.rotation = Quaternion.Euler(-90, 0, -90);
            //----------------------------------------------------------------------------//
            //boundery.transform.position = new Vector3 (0, -71, 0);
            //boundery.transform.rotation = Quaternion.Euler (0, 0, 0);

		}
		else if (Num == 1)
		{
			CarrierLevels [1].SetActive (true);
            //Endpoint[1].SetActive(true);
            //Endpoint[1].transform.position = new Vector3(4761.3f, 111.27f, 64);
            //Endpoint[1].transform.rotation = Quaternion.Euler(-90, -90, 0);
            //----------------------------------------------------------------------------//
            ////boundery.transform.rotation = Quaternion.Euler(0, 0, 0);
            //boundery.transform.position = new Vector3 (0, -71, 0);
		}
		else if (Num == 2)
		{
			CarrierLevels [2].SetActive (true);
   //         Endpoint[6].SetActive(true);
   //         Endpoint[6].transform.position = new Vector3 (1113.7f, -270, -3425.2f);
			//Endpoint[6].transform.rotation = Quaternion.Euler (-90,-90,90);
            //----------------------------------------------------------------------------//
            //boundery.transform.rotation = Quaternion.Euler(0, 0, 0);
            //boundery.transform.position = new Vector3 (0, -54, 161);
            //Boundry2.SetActive(true);
            //Boundry2.transform.position = new Vector3(0, -313, -3514);
            //Boundry2.transform.rotation = Quaternion.Euler(0, 0, 0);

        }
        else if (Num == 3)
		{
            //Boundry2.SetActive(true);
            CarrierLevels[3].SetActive (true);
            //Endpoint[5].SetActive(true);
            //Endpoint[5].transform.position = new Vector3 (1598, 211.6f, 1634);
			//Endpoint[5].transform.rotation = Quaternion.Euler (-90, -180f, 0);
            //----------------------------------------------------------------------------//
            //boundery.transform.rotation = Quaternion.Euler(0, 0, 0);
            //boundery.transform.position = new Vector3 (0, -54, -706);
            //Boundry2.transform.position = new Vector3(0, 327, 2385);
            //Boundry2.transform.rotation = Quaternion.Euler(-14.54f, 0, 0);
        }
        else if (Num == 4)
		{
			CarrierLevels [4].SetActive (true);
           // Endpoint[3].SetActive(true);
          //  Endpoint[3].transform.position = new Vector3 (3664, -5.7f, 313);
			//Endpoint[3].transform.rotation = Quaternion.Euler (-91, 2.2f, -1.7f);
            //----------------------------------------------------------------------------//
            //boundery.transform.rotation = Quaternion.Euler(0, 0, 0);
            //boundery.transform.position = new Vector3 (0, -84, -706);

        }
		else if (Num == 5)
		{
			CarrierLevels [5].SetActive (true);
           /// Endpoint[1].SetActive(true);
          //  Endpoint[1].transform.position = new Vector3 (3800, 120.9f, 71);
			//Endpoint[1].transform.rotation = Quaternion.Euler (-90,0,-90);
            //----------------------------------------------------------------------------//
            //boundery.transform.rotation = Quaternion.Euler(0, 0, 0);
            //boundery.transform.position = new Vector3 (-3652, -6.4f, -706);
            //Boundry2.SetActive(true);
            //Boundry2.transform.position = new Vector3(3473, 42, 543);
            //Boundry2.transform.rotation = Quaternion.Euler(0, 0, 0);

        }
        else if (Num == 6)
		{
			CarrierLevels [6].SetActive (true);
   //         Endpoint[6].SetActive(true);
   //         //Endpoint[6].transform.localScale = new Vector3(1, 1, 1);
   //         Endpoint[6].transform.position = new Vector3 (3581.3f, 165.6f, 63);
			//Endpoint[6].transform.rotation = Quaternion.Euler (-90, -90, 0);
            //----------------------------------------------------------------------------//
            //boundery.transform.rotation = Quaternion.Euler(0, 0, 0);
            //boundery.transform.position = new Vector3 (-3530, -6.4f, -706);
            //Boundry2.SetActive(true);
            //Boundry2.transform.position = new Vector3(3601, 37, 543);
            //Boundry2.transform.rotation = Quaternion.Euler(0, 0, 0);


        }
        else if (Num == 7)
		{
			CarrierLevels [7].SetActive (true);
   //         Endpoint[3].SetActive(true);
   //         Endpoint[3].transform.position = new Vector3 (836, 118.9f, -3806.3f);
			//Endpoint[3].transform.rotation = Quaternion.Euler (-91,90,0);
            //----------------------------------------------------------------------------//
            //boundery.transform.rotation = Quaternion.Euler(0, 0, 0);
            //boundery.transform.position = new Vector3 (-1121, -6.4f, -386);
            //Boundry2.SetActive(true);
            //Boundry2.transform.position = new Vector3(-1384, 64, -3577);
            //Boundry2.transform.rotation = Quaternion.Euler(0, 0, 0);

        }
        else if (Num == 8)
		{
			CarrierLevels [8].SetActive (true);
   //         Endpoint[1].SetActive(true);
   //         Endpoint[1].transform.localScale = new Vector3(60, 60, 60);
   //         Endpoint[1].transform.position = new Vector3 (5452, 367, -279);
			//Endpoint[1].transform.rotation = Quaternion.Euler (-87.857f, -90, -11);
            //----------------------------------------------------------------------------//
            //boundery.transform.rotation = Quaternion.Euler(0, 0, 0);
            //boundery.transform.position = new Vector3 (-3166, -17, -386);
            //Boundry2.SetActive(true);
            //Boundry2.transform.position = new Vector3(3942, 228, -825);
            //Boundry2.transform.rotation = Quaternion.Euler(0, 0, 3);
        }
        else if (Num == 9)
		{
			CarrierLevels [9].SetActive (true);
   //         Endpoint[3].SetActive(true);
   //         Endpoint[3].transform.position = new Vector3 (5369, 405, 595);
			//Endpoint[3].transform.rotation = Quaternion.Euler (-90, 81, -90);
            //----------------------------------------------------------------------------//
            //boundery.transform.rotation = Quaternion.Euler(0, 0, 0);
            //boundery.transform.position = new Vector3 (-3166, -17, -386);
            //Boundry2.SetActive(true);
            //Boundry2.transform.position = new Vector3(3942, 228, -64);
            //Boundry2.transform.rotation = Quaternion.Euler(0, 0, 3);
        }
		else if (Num == 10)
		{
			CarrierLevels [10].SetActive (true);
   //         Endpoint[0].SetActive(true);
   //         Endpoint[0].transform.position = new Vector3 (6365, 212, 66.5f);
			//Endpoint[0].transform.rotation = Quaternion.Euler (-90, 0,0);
            //----------------------------------------------------------------------------//
            //boundery.transform.rotation = Quaternion.Euler(0, 0, 0);
            //boundery.transform.position = new Vector3 (-1700, -17, 122);
            //Boundry2.SetActive(true);
            //Boundry2.transform.position = new Vector3(5560, 50, -4);
            //Boundry2.transform.rotation = Quaternion.Euler(0, 0, 0);
        }
        else if (Num == 11)
		{
			CarrierLevels [11].SetActive (true);
   //         Endpoint[7].SetActive(true);
   //         Endpoint[7].transform.position = new Vector3 (10240, 164, 723);
			//Endpoint[7].transform.rotation = Quaternion.Euler (0, 103.629f, 0);
			//boundery.transform.position = new Vector3 (736, -17, 297);
            //boundery.transform.rotation = Quaternion.Euler(0, -60, 0);
            //Boundry2.SetActive(true);
            //Boundry2.transform.position = new Vector3(5560, 50, 2290);
            //Boundry2.transform.rotation = Quaternion.Euler(0, 25, 0);
        }
        else if (Num == 12)
		{
			CarrierLevels [12].SetActive (true);
   //         Endpoint[3].SetActive(true);
   //         Endpoint[3].transform.position = new Vector3 (7099.4f, 52.1f, 4694.7f);
			//Endpoint[3].transform.rotation = Quaternion.Euler (-90, 0, -22);
			////boundery.transform.position = new Vector3 (1046, -17, -383);
            //boundery.transform.rotation = Quaternion.Euler(0, -24, 0);
            //Boundry2.SetActive(true);
            //Boundry2.transform.position = new Vector3(7837, -141, 2290);
            //Boundry2.transform.rotation = Quaternion.Euler(0, -115, 0);

        }
        else if (Num == 13)
		{
			CarrierLevels [13].SetActive (true);
   //         Endpoint[1].transform.localScale = new Vector3(60, 60, 60);
   //         Endpoint[1].SetActive(true);
   //         Endpoint[1].transform.position = new Vector3 (7548, 20, -1602);
			//Endpoint[1].transform.rotation = Quaternion.Euler (-90, 0, 295);
            //----------------------------------------------------------------------------//
            //boundery.transform.rotation = Quaternion.Euler(0, 0, 0);
            //boundery.transform.position = new Vector3 (1362, -17, -383);
            //Boundry2.SetActive(true);
            //Boundry2.transform.position = new Vector3(8513, -32, -1224);
            //Boundry2.transform.rotation = Quaternion.Euler(0, 0, 0);

        }
        else if (Num == 14)
		{
			CarrierLevels [14].SetActive (true);
   //         Endpoint[3].SetActive(true);
   //         Endpoint[3].transform.position = new Vector3 (1980, 102, -6397);
			//Endpoint[3].transform.rotation = Quaternion.Euler (-90,0,90);
            //----------------------------------------------------------------------------//
            //boundery.transform.rotation = Quaternion.Euler(0, 0, 0);
            //boundery.transform.position = new Vector3 (1362, -10, -1124);
            //Boundry2.SetActive(true);
            //Boundry2.transform.position = new Vector3(1964, -11, -4196);
            //Boundry2.transform.rotation = Quaternion.Euler(0, 90, 0);

        }
        else if (Num == 15)
		{
			CarrierLevels [15].SetActive (true);
   //         Endpoint[6].SetActive(true);
   //         Endpoint[6].transform.position = new Vector3 (3579, 257.6f, -1475.1f);
			//Endpoint[6].transform.rotation = Quaternion.Euler (-77.86f, -252.5f, 0);
            //----------------------------------------------------------------------------//
            //boundery.transform.rotation = Quaternion.Euler(0, 0, 0);
            //boundery.transform.position = new Vector3 (1362, -10, 707);
            //Boundry2.SetActive(true);
            //Boundry2.transform.position = new Vector3(1160, 47, -2760);
            //Boundry2.transform.rotation = Quaternion.Euler(0, 0, 0);

        }
        else if (Num == 16)
        {
            CarrierLevels[16].SetActive(true);
            //Endpoint[5].transform.localScale = new Vector3(60, 60, 60);
            //Endpoint[4].SetActive(true);
            //Endpoint[4].transform.position = new Vector3(10916.1f, 86, -2115.8f);
            //Endpoint[4].transform.rotation = Quaternion.Euler(-90, 0, -99);
            //----------------------------------------------------------------------------//
            //boundery.transform.rotation = Quaternion.Euler(0, 0, 0);
            //boundery.transform.position = new Vector3(834, -75, -321);
            //Boundry2.SetActive(true);
            //Boundry2.transform.position = new Vector3(8025, -91, -1519);
            //Boundry2.transform.rotation = Quaternion.Euler(0, 0, 0);

        }
        else if (Num == 17)
        {
            CarrierLevels[17].SetActive(true);
            //Endpoint[0].transform.localScale = new Vector3(40, 40, 40);
            //Endpoint[0].SetActive(true);
            //Endpoint[0].transform.position = new Vector3(7170.4f, -34.5f, -6067.2f);
            //Endpoint[0].transform.rotation = Quaternion.Euler(-90, 0, 100);
            //----------------------------------------------------------------------------//
            //boundery.transform.position = new Vector3(-4720, -46, -321);
            //boundery.transform.rotation = Quaternion.Euler(0, 0, 0);

            //----------------------------------------------------------------------------//
            //Boundry2.SetActive(true);
            //Boundry2.transform.position = new Vector3(2676, -9, 176);
            //Boundry2.transform.rotation = Quaternion.Euler(0, 0, 0);

            //----------------------------------------------------------------------------//
            //Boundry3.SetActive(true);
            //Boundry3.transform.position = new Vector3(9459, 376, -470);
            //Boundry3.transform.rotation = Quaternion.Euler(0, 21.3f, 0);
            //----------------------------------------------------------------------------//
            //Boundry4.SetActive(true);
            //Boundry4.transform.position = new Vector3(8296, 3.9f, -3454);
            //Boundry4.transform.rotation = Quaternion.Euler(0, 21.3f, 0);

        }
        else if (Num == 18)
        {
            CarrierLevels[18].SetActive(true);
            //Endpoint[3].SetActive(true);
            //Endpoint[3].transform.position = new Vector3(25170, 313, 6695);
            //Endpoint[3].transform.rotation = Quaternion.Euler(-90, 0, -21);
            //----------------------------------------------------------------------------//
            //boundery.transform.rotation = Quaternion.Euler(0, 90, 0);
            //boundery.transform.position = new Vector3(1329.4f, -10, -1034);
            //----------------------------------------------------------------------------//
            //Boundry2.SetActive(true);
            //Boundry2.transform.position = new Vector3(4353, 0, -4752);
            //Boundry2.transform.rotation = Quaternion.Euler(0, -24, 0);
            //----------------------------------------------------------------------------//
            //Boundry4.SetActive(true);
            //Boundry4.transform.position = new Vector3(8146, 3.9f, -375);
            //Boundry4.transform.rotation = Quaternion.Euler(0, 70, 0);
        }
        else if (Num == 19)
        {
            CarrierLevels[19].SetActive(true);
            //Endpoint[0].SetActive(true);
            //Endpoint[0].transform.localScale = new Vector3(40, 40, 40);
            //Endpoint[0].transform.position = new Vector3(11527, 83.8f, 365);
            //Endpoint[0].transform.rotation = Quaternion.Euler(-90, 121, 100);
            //----------------------------------------------------------------------------//
            //boundery.transform.rotation = Quaternion.Euler(0, 0, 0);
            //boundery.transform.position = new Vector3(1329, -10, 123);
            //----------------------------------------------------------------------------//
            //Boundry2.SetActive(true);
            //Boundry2.transform.position = new Vector3(8410, 0, -1453);
            //Boundry2.transform.rotation = Quaternion.Euler(0, -24, 0);
            //----------------------------------------------------------------------------//
            //Boundry3.SetActive(true);
            //Boundry3.transform.position = new Vector3(14591, 182, -5431);
            //Boundry3.transform.rotation = Quaternion.Euler(0, 21.3f, 0);
            //----------------------------------------------------------------------------//
            //Boundry4.SetActive(true);
            //Boundry4.transform.position = new Vector3(16707, 3.9f, -3398);
            //Boundry4.transform.rotation = Quaternion.Euler(0, -46.78f, 0);
        }
        else if (Num == 20)
        {
            CarrierLevels[20].SetActive(true);
            //Endpoint[1].SetActive(true);
            //Endpoint[1].transform.localScale = new Vector3(80, 80, 80);
            //Endpoint[1].transform.position = new Vector3(-19946, 535, -1516);
            //Endpoint[1].transform.rotation = Quaternion.Euler(-90, 0, 58);
            //----------------------------------------------------------------------------//
            //boundery.transform.rotation = Quaternion.Euler(0, 90, 0);
            //boundery.transform.position = new Vector3(838, -10, 5519);
            //----------------------------------------------------------------------------//
            //Boundry2.SetActive(true);
            //Boundry2.transform.position = new Vector3(148, 231, 8523);
            //Boundry2.transform.rotation = Quaternion.Euler(0, -91, 0);
            //----------------------------------------------------------------------------//
            //Boundry3.SetActive(true);
            //Boundry3.transform.position = new Vector3(-18900, 420, -1354);
            //Boundry3.transform.rotation = Quaternion.Euler(0, -31.83f, 0);
            //----------------------------------------------------------------------------//
            //Boundry4.SetActive(true);
            //Boundry4.transform.position = new Vector3(-2273, 143, 10417);
            //Boundry4.transform.rotation = Quaternion.Euler(0, -117.5f, 0);
        }
        else if (Num == 21)
        {
            CarrierLevels[21].SetActive(true);
            //Endpoint[5].SetActive(true);
            //Endpoint[5].transform.position = new Vector3(7761.3f, 27.8f, -196);
            //Endpoint[5].transform.rotation = Quaternion.Euler(-90, -90, 0);
            //----------------------------------------------------------------------------//
            //boundery.transform.rotation = Quaternion.Euler(0, 0, 0);
            //boundery.transform.position = new Vector3(812, -90, 192);
            //----------------------------------------------------------------------------//
            //Boundry3.SetActive(true);
            //Boundry3.transform.position = new Vector3(7965, -13, -602);
            //Boundry3.transform.rotation = Quaternion.Euler(0, 0, 0);
        }
        else if (Num == 22)
        {
            CarrierLevels[22].SetActive(true);
            //Endpoint[7].SetActive(true);
            //Endpoint[7].transform.position = new Vector3(7794.32f, 48.4f, 4789);
            //Endpoint[7].transform.rotation = Quaternion.Euler(0, 82, 0);
            //----------------------------------------------------------------------------//
            //boundery.transform.rotation = Quaternion.Euler(0, -19.56f, 0);
            //boundery.transform.position = new Vector3(812, -90, 192);
            //----------------------------------------------------------------------------//
            //Boundry2.SetActive(true);
            //Boundry2.transform.position = new Vector3(3716, -255, 5033);
            //Boundry2.transform.rotation = Quaternion.Euler(0, 0, 0);
        }
        else if (Num == 23)
        {
            CarrierLevels[23].SetActive(true);
            //Endpoint[3].SetActive(true);
            //Endpoint[3].transform.position = new Vector3(14371, 47, -10281);
            //Endpoint[3].transform.rotation = Quaternion.Euler(-90, 13, 0);
            //----------------------------------------------------------------------------//
            //boundery.transform.rotation = Quaternion.Euler(0, 22.88f, 0);
            //boundery.transform.position = new Vector3(1363, -19, 538);
            //----------------------------------------------------------------------------//
            //Boundry2.SetActive(true);
            //Boundry2.transform.position = new Vector3(8229, -255, -2224);
            //Boundry2.transform.rotation = Quaternion.Euler(0, 27.57f, 0);
            //----------------------------------------------------------------------------//
            //Boundry3.SetActive(true);
            //Boundry3.transform.position = new Vector3(7000, -222, -5339);
            //Boundry3.transform.rotation = Quaternion.Euler(0, 17.7f, 0);
            //----------------------------------------------------------------------------//
            //Boundry4.SetActive(true);
            //Boundry4.transform.position = new Vector3(-1279, -253, -5715);
            //Boundry4.transform.rotation = Quaternion.Euler(0, 105.5f, 0);
        }
        else if (Num == 24)
        {
            CarrierLevels[24].SetActive(true);
            //Endpoint[3].SetActive(true);
            //Endpoint[3].transform.position = new Vector3(7693, 44.1f, 934.9f);
            //Endpoint[3].transform.rotation = Quaternion.Euler(-90, 0, -158);
            //boundery.transform.position = new Vector3(0, -55f, 0);
        }

    }

    public void LevelSelection1()
    {
        int Num = PlayerPrefs.GetInt("level_number");
        if (Num == 0)
        {
            MegaLevels[0].SetActive(true);
            //Endpoint[1].SetActive(true);
            //Endpoint[1].transform.position = new Vector3(5346.5f, 92, 67);
            //Endpoint[1].transform.rotation = Quaternion.Euler(-90, -90, 0);
            //Endpoint[4].SetActive(true);
            //Endpoint[4].transform.position = new Vector3(5323, 117, 67);
            //Endpoint[4].transform.rotation = Quaternion.Euler(-90, 0, -90);
            //----------------------------------------------------------------------------//
            //boundery.transform.position = new Vector3(0, -71, 0);
            //boundery.transform.rotation = Quaternion.Euler(0, 0, 0);

        }
        else if (Num == 1)
        {
            MegaLevels[1].SetActive(true);
            //Endpoint[1].SetActive(true);
            //Endpoint[1].transform.position = new Vector3(4958.4f, 76, 64);
            //Endpoint[1].transform.rotation = Quaternion.Euler(-90, -90, 0);
            //----------------------------------------------------------------------------//
            //boundery.transform.rotation = Quaternion.Euler(0, 0, 0);
            //boundery.transform.position = new Vector3(0, -71, 0);
        }
        else if (Num == 2)
        {
            MegaLevels[2].SetActive(true);
            //Endpoint[0].SetActive(true);
            //Endpoint[0].transform.position = new Vector3(1081.7f, -301.3f, -3439.93f);
            //Endpoint[0].transform.rotation = Quaternion.Euler(-90, 90, 0);
            //Endpoint[6].SetActive(true);
            //Endpoint[6].transform.position = new Vector3(1113.7f, -270, -3425.2f);
            //Endpoint[6].transform.rotation = Quaternion.Euler(-90, -90, 90);
            //----------------------------------------------------------------------------//
            //boundery.transform.rotation = Quaternion.Euler(0, 0, 0);
            //boundery.transform.position = new Vector3(0, -54, 161);
            //Boundry2.SetActive(true);
            //Boundry2.transform.position = new Vector3(0, -313, -3514);
            //Boundry2.transform.rotation = Quaternion.Euler(0, 0, 0);

        }
        else if (Num == 3)
        {
            //Boundry2.SetActive(true);
            MegaLevels[3].SetActive(true);
            //Endpoint[2].SetActive(true);
            //Endpoint[2].transform.position = new Vector3(1598, 140, 2395);
            //Endpoint[2].transform.rotation = Quaternion.Euler(0, -90f, 15.76f);
            //Endpoint[5].SetActive(true);
            //Endpoint[5].transform.position = new Vector3(1598, 211.6f, 1574.6f);
            //Endpoint[5].transform.rotation = Quaternion.Euler(-90, -180f, 0);
            //----------------------------------------------------------------------------//
            //boundery.transform.rotation = Quaternion.Euler(0, 0, 0);
            //boundery.transform.position = new Vector3(0, -54, -706);
            //Boundry2.transform.position = new Vector3(0, 327, 2385);
            //Boundry2.transform.rotation = Quaternion.Euler(-14.54f, 0, 0);

        }
        else if (Num == 4)
        {
            MegaLevels[4].SetActive(true);
            //Endpoint[3].SetActive(true);
            //Endpoint[3].transform.position = new Vector3(3664, -5.7f, 313);
            //Endpoint[3].transform.rotation = Quaternion.Euler(-91, 2.2f, -1.7f);
            //----------------------------------------------------------------------------//
            //boundery.transform.rotation = Quaternion.Euler(0, 0, 0);
            //boundery.transform.position = new Vector3(0, -84, -706);

        }
        else if (Num == 5)
        {
            MegaLevels[5].SetActive(true);
            //Endpoint[1].SetActive(true);
            //Endpoint[1].transform.position = new Vector3(3800, 120.9f, 71);
            //Endpoint[1].transform.rotation = Quaternion.Euler(-90, 0, -90);
            //----------------------------------------------------------------------------//
            //boundery.transform.rotation = Quaternion.Euler(0, 0, 0);
            //boundery.transform.position = new Vector3(-3652, -6.4f, -706);
            //Boundry2.SetActive(true);
            //Boundry2.transform.position = new Vector3(3473, 42, 543);
            //Boundry2.transform.rotation = Quaternion.Euler(0, 0, 0);

        }
        else if (Num == 6)
        {
            MegaLevels[6].SetActive(true);
            ////Endpoint[2].SetActive(true);
            ////Endpoint[2].transform.localScale = new Vector3(1, 1, 1);
            ////Endpoint[2].transform.position = new Vector3(3874, 34.5f, 66);
            ////Endpoint[2].transform.rotation = Quaternion.Euler(0, 0, 0);
            //Endpoint[6].SetActive(true);
            //Endpoint[6].transform.position = new Vector3(3581.3f, 165.6f, 63);
            //Endpoint[6].transform.rotation = Quaternion.Euler(-90, -90, 0);
            //----------------------------------------------------------------------------//
            //boundery.transform.rotation = Quaternion.Euler(0, 0, 0);
            //boundery.transform.position = new Vector3(-3530, -6.4f, -706);
            //Boundry2.SetActive(true);
            //Boundry2.transform.position = new Vector3(3601, 37, 543);
            //Boundry2.transform.rotation = Quaternion.Euler(0, 0, 0);


        }
        else if (Num == 7)
        {
            MegaLevels[7].SetActive(true);
            //Endpoint[3].SetActive(true);
            //Endpoint[3].transform.position = new Vector3(836, 118.9f, -3806.3f);
            //Endpoint[3].transform.rotation = Quaternion.Euler(-91, 90, 0);
            //----------------------------------------------------------------------------//
            //boundery.transform.rotation = Quaternion.Euler(0, 0, 0);
            //boundery.transform.position = new Vector3(-1121, -6.4f, -386);
            //Boundry2.SetActive(true);
            //Boundry2.transform.position = new Vector3(-1384, 64, -3577);
            //Boundry2.transform.rotation = Quaternion.Euler(0, 0, 0);

        }
        else if (Num == 8)
        {
            MegaLevels[8].SetActive(true);
            //Endpoint[1].SetActive(true);
            //Endpoint[1].transform.localScale = new Vector3(60, 60, 60);
            //Endpoint[1].transform.position = new Vector3(5452, 367, -279);
            //Endpoint[1].transform.rotation = Quaternion.Euler(-87.857f, -90, -11);
            //----------------------------------------------------------------------------//
            //boundery.transform.rotation = Quaternion.Euler(0, 0, 0);
            //boundery.transform.position = new Vector3(-3166, -17, -386);
            //Boundry2.SetActive(true);
            //Boundry2.transform.position = new Vector3(3942, 228, -825);
            //Boundry2.transform.rotation = Quaternion.Euler(0, 0, 3);

        }
        else if (Num == 9)
        {
            MegaLevels[9].SetActive(true);
            //Endpoint[3].SetActive(true);
            //Endpoint[3].transform.position = new Vector3(5369, 405, 595);
            //Endpoint[3].transform.rotation = Quaternion.Euler(-90, 81, -90);
            //----------------------------------------------------------------------------//
            //boundery.transform.rotation = Quaternion.Euler(0, 0, 0);
            //boundery.transform.position = new Vector3(-3166, -17, -386);
            //Boundry2.SetActive(true);
            //Boundry2.transform.position = new Vector3(3942, 228, -64);
            //Boundry2.transform.rotation = Quaternion.Euler(0, 0, 3);
        }
        else if (Num == 10)
        {
            MegaLevels[10].SetActive(true);
            //Endpoint[0].SetActive(true);
            //Endpoint[0].transform.position = new Vector3(6365, 212, 66.5f);
            //Endpoint[0].transform.rotation = Quaternion.Euler(-90, 0, 0);
            //----------------------------------------------------------------------------//
            //boundery.transform.rotation = Quaternion.Euler(0, 0, 0);
            //boundery.transform.position = new Vector3(-1700, -17, 122);
            //Boundry2.SetActive(true);
            //Boundry2.transform.position = new Vector3(5560, 50, -4);
            //Boundry2.transform.rotation = Quaternion.Euler(0, 0, 0);

        }
        else if (Num == 11)
        {
            MegaLevels[11].SetActive(true);
            ////Endpoint[2].SetActive(true);
            ////Endpoint[2].transform.position = new Vector3(10644, -101, 624);
            ////Endpoint[2].transform.rotation = Quaternion.Euler(0, 14, 0);
            //Endpoint[7].SetActive(true);
            //Endpoint[7].transform.position = new Vector3(10240, 164, 723);
            //Endpoint[7].transform.rotation = Quaternion.Euler(0, 103.629f, 0);
            //boundery.transform.position = new Vector3(736, -17, 297);
            //boundery.transform.rotation = Quaternion.Euler(0, -60, 0);
            //Boundry2.SetActive(true);
            //Boundry2.transform.position = new Vector3(5560, 50, 2290);
            //Boundry2.transform.rotation = Quaternion.Euler(0, 25, 0);

        }
        else if (Num == 12)
        {
            MegaLevels[12].SetActive(true);
            //Endpoint[3].SetActive(true);
            //Endpoint[3].transform.position = new Vector3(7099.4f, 52.1f, 4694.7f);
            //Endpoint[3].transform.rotation = Quaternion.Euler(-90, 0, -22);
            //boundery.transform.position = new Vector3(1046, -17, -383);
            //boundery.transform.rotation = Quaternion.Euler(0, -24, 0);
            //Boundry2.SetActive(true);
            //Boundry2.transform.position = new Vector3(7837, -141, 2290);
            //Boundry2.transform.rotation = Quaternion.Euler(0, -115, 0);

        }
        else if (Num == 13)
        {
            MegaLevels[13].SetActive(true);
            //Endpoint[1].transform.localScale = new Vector3(60, 60, 60);
            //Endpoint[1].SetActive(true);
            //Endpoint[1].transform.position = new Vector3(7548, 20, -1602);
            //Endpoint[1].transform.rotation = Quaternion.Euler(-90, 0, 295);
            //----------------------------------------------------------------------------//
            //boundery.transform.rotation = Quaternion.Euler(0, 0, 0);
            //boundery.transform.position = new Vector3(1362, -17, -383);
            //Boundry2.SetActive(true);
            //Boundry2.transform.position = new Vector3(8513, -32, -1224);
            //Boundry2.transform.rotation = Quaternion.Euler(0, 0, 0);

        }
        else if (Num == 14)
        {
            MegaLevels[14].SetActive(true);
            //Endpoint[3].SetActive(true);
            //Endpoint[3].transform.position = new Vector3(1980, 102, -6397);
            //Endpoint[3].transform.rotation = Quaternion.Euler(-90, 0, 90);
            //----------------------------------------------------------------------------//
            //boundery.transform.rotation = Quaternion.Euler(0, 0, 0);
            //boundery.transform.position = new Vector3(1362, -10, -1124);
            //Boundry2.SetActive(true);
            //Boundry2.transform.position = new Vector3(1964, -11, -4196);
            //Boundry2.transform.rotation = Quaternion.Euler(0, 90, 0);

        }
        else if (Num == 15)
        {
            MegaLevels[15].SetActive(true);
            ////Endpoint[2].SetActive(true);
            ////Endpoint[2].transform.position = new Vector3(2946, -22, -1308);
            ////Endpoint[2].transform.rotation = Quaternion.Euler(0, -165, 0);
            //Endpoint[6].SetActive(true);
            //Endpoint[6].transform.position = new Vector3(3579, 257.6f, -1475.1f);
            //Endpoint[6].transform.rotation = Quaternion.Euler(-77.86f, -252.5f, 0);
            //----------------------------------------------------------------------------//
            //boundery.transform.rotation = Quaternion.Euler(0, 0, 0);
            //boundery.transform.position = new Vector3(1362, -10, 707);
            //Boundry2.SetActive(true);
            //Boundry2.transform.position = new Vector3(1160, 47, -2760);
            //Boundry2.transform.rotation = Quaternion.Euler(0, 0, 0);

        }
        else if (Num == 16)
        {
            MegaLevels[16].SetActive(true);
            ////Endpoint[1].transform.localScale = new Vector3(60, 60, 60);
            ////Endpoint[1].SetActive(true);
            ////Endpoint[1].transform.position = new Vector3(11089, 46, -2078);
            ////Endpoint[1].transform.rotation = Quaternion.Euler(-90, 0, -99);
            //Endpoint[4].SetActive(true);
            //Endpoint[4].transform.position = new Vector3(10916.1f, 86, -2115.8f);
            //Endpoint[4].transform.rotation = Quaternion.Euler(-90, 0, -99);
            //----------------------------------------------------------------------------//
            //boundery.transform.rotation = Quaternion.Euler(0, 0, 0);
            //boundery.transform.position = new Vector3(834, -75, -321);
            //Boundry2.SetActive(true);
            //Boundry2.transform.position = new Vector3(8025, -91, -1519);
            //Boundry2.transform.rotation = Quaternion.Euler(0, 0, 0);

        }
        else if (Num == 17)
        {
            MegaLevels[17].SetActive(true);
            //Endpoint[0].transform.localScale = new Vector3(40, 40, 40);
            //Endpoint[0].SetActive(true);
            //Endpoint[0].transform.position = new Vector3(7170.4f, -34.5f, -6067.2f);
            //Endpoint[0].transform.rotation = Quaternion.Euler(-90, 0, 100);
            //----------------------------------------------------------------------------//
            //boundery.transform.position = new Vector3(-4720, -46, -321);
            //boundery.transform.rotation = Quaternion.Euler(0, 0, 0);

            //----------------------------------------------------------------------------//
            //Boundry2.SetActive(true);
            //Boundry2.transform.position = new Vector3(2676, -9, 176);
            //Boundry2.transform.rotation = Quaternion.Euler(0, 0, 0);

            //----------------------------------------------------------------------------//
            //Boundry3.SetActive(true);
            //Boundry3.transform.position = new Vector3(9459, 376, -470);
            //Boundry3.transform.rotation = Quaternion.Euler(0, 21.3f, 0);
            //----------------------------------------------------------------------------//
            //Boundry4.SetActive(true);
            //Boundry4.transform.position = new Vector3(8296, 3.9f, -3454);
            //Boundry4.transform.rotation = Quaternion.Euler(0, 21.3f, 0);

        }
        else if (Num == 18)
        {
            MegaLevels[18].SetActive(true);
            //Endpoint[3].SetActive(true);
            //Endpoint[3].transform.position = new Vector3(25170, 313, 6695);
            //Endpoint[3].transform.rotation = Quaternion.Euler(-90, 0, -21);
            //----------------------------------------------------------------------------//
            //boundery.transform.rotation = Quaternion.Euler(0, 90, 0);
            //boundery.transform.position = new Vector3(1329.4f, -10, -1034);
            //----------------------------------------------------------------------------//
            //Boundry2.SetActive(true);
            //Boundry2.transform.position = new Vector3(4353, 0, -4752);
            //Boundry2.transform.rotation = Quaternion.Euler(0, -24, 0);
            //----------------------------------------------------------------------------//
            //Boundry4.SetActive(true);
            //Boundry4.transform.position = new Vector3(8146, 3.9f, -375);
            //Boundry4.transform.rotation = Quaternion.Euler(0, 70, 0);
        }
        else if (Num == 19)
        {
            MegaLevels[19].SetActive(true);
            //Endpoint[0].SetActive(true);
            //Endpoint[0].transform.localScale = new Vector3(40, 40, 40);
            //Endpoint[0].transform.position = new Vector3(11527, 83.8f, 365);
            //Endpoint[0].transform.rotation = Quaternion.Euler(-90, 121, 100);
            //----------------------------------------------------------------------------//
            //boundery.transform.rotation = Quaternion.Euler(0, 0, 0);
            //boundery.transform.position = new Vector3(1329, -10, 123);
            //----------------------------------------------------------------------------//
            //Boundry2.SetActive(true);
            //Boundry2.transform.position = new Vector3(8410, 0, -1453);
            //Boundry2.transform.rotation = Quaternion.Euler(0, -24, 0);
            //----------------------------------------------------------------------------//
            //Boundry3.SetActive(true);
            //Boundry3.transform.position = new Vector3(14591, 182, -5431);
            //Boundry3.transform.rotation = Quaternion.Euler(0, 21.3f, 0);
            //----------------------------------------------------------------------------//
            //Boundry4.SetActive(true);
            //Boundry4.transform.position = new Vector3(16707, 3.9f, -3398);
            //Boundry4.transform.rotation = Quaternion.Euler(0, -46.78f, 0);
        }
        else if (Num == 20)
        {
            MegaLevels[20].SetActive(true);
            //Endpoint[1].SetActive(true);
            //Endpoint[1].transform.localScale = new Vector3(80, 80, 80);
            //Endpoint[1].transform.position = new Vector3(-19946, 535, -1516);
            //Endpoint[1].transform.rotation = Quaternion.Euler(-90, 0, 58);
            //----------------------------------------------------------------------------//
            //boundery.transform.rotation = Quaternion.Euler(0, 90, 0);
            //boundery.transform.position = new Vector3(838, -10, 5519);
            //----------------------------------------------------------------------------//
            //Boundry2.SetActive(true);
            //Boundry2.transform.position = new Vector3(148, 231, 8523);
            //Boundry2.transform.rotation = Quaternion.Euler(0, -91, 0);
            //----------------------------------------------------------------------------//
            //Boundry3.SetActive(true);
            //Boundry3.transform.position = new Vector3(-18900, 420, -1354);
            //Boundry3.transform.rotation = Quaternion.Euler(0, -31.83f, 0);
            //----------------------------------------------------------------------------//
            //Boundry4.SetActive(true);
            //Boundry4.transform.position = new Vector3(-2273, 143, 10417);
            //Boundry4.transform.rotation = Quaternion.Euler(0, -117.5f, 0);
        }
        else if (Num == 21)
        {
            MegaLevels[21].SetActive(true);
            ////Endpoint[2].SetActive(true);
            ////Endpoint[2].transform.position = new Vector3(8406, -237, -186.6f);
            ////Endpoint[2].transform.rotation = Quaternion.Euler(0, 0, 0);
            //Endpoint[5].SetActive(true);
            //Endpoint[5].transform.position = new Vector3(7761.3f, 27.8f, -196);
            //Endpoint[5].transform.rotation = Quaternion.Euler(-90, -90, 0);
            //----------------------------------------------------------------------------//
            //boundery.transform.rotation = Quaternion.Euler(0, 0, 0);
            //boundery.transform.position = new Vector3(812, -90, 192);
            //----------------------------------------------------------------------------//
            //Boundry3.SetActive(true);
            //Boundry3.transform.position = new Vector3(7965, -13, -602);
            //Boundry3.transform.rotation = Quaternion.Euler(0, 0, 0);
        }
        else if (Num == 22)
        {
            MegaLevels[22].SetActive(true);
            ////Endpoint[3].SetActive(true);
            ////Endpoint[3].transform.position = new Vector3(7563, 48.9f, 4758.7f);
            ////Endpoint[3].transform.rotation = Quaternion.Euler(-90, -7, 0);
            //Endpoint[7].SetActive(true);
            //Endpoint[7].transform.position = new Vector3(7794.32f, 48.4f, 4789);
            //Endpoint[7].transform.rotation = Quaternion.Euler(0, 82, 0);
            //----------------------------------------------------------------------------//
            //boundery.transform.rotation = Quaternion.Euler(0, -19.56f, 0);
            //boundery.transform.position = new Vector3(812, -90, 192);
            //----------------------------------------------------------------------------//
            //Boundry2.SetActive(true);
            //Boundry2.transform.position = new Vector3(3716, -255, 5033);
            //Boundry2.transform.rotation = Quaternion.Euler(0, 0, 0);
        }
        else if (Num == 23)
        {
            MegaLevels[23].SetActive(true);
            //Endpoint[3].SetActive(true);
            //Endpoint[3].transform.position = new Vector3(14371, 47, -10281);
            //Endpoint[3].transform.rotation = Quaternion.Euler(-90, 13, 0);
            //----------------------------------------------------------------------------//
            //boundery.transform.rotation = Quaternion.Euler(0, 22.88f, 0);
            //boundery.transform.position = new Vector3(1363, -19, 538);
            //----------------------------------------------------------------------------//
            //Boundry2.SetActive(true);
            //Boundry2.transform.position = new Vector3(8229, -255, -2224);
            //Boundry2.transform.rotation = Quaternion.Euler(0, 27.57f, 0);
            //----------------------------------------------------------------------------//
            //Boundry3.SetActive(true);
            //Boundry3.transform.position = new Vector3(7000, -222, -5339);
            //Boundry3.transform.rotation = Quaternion.Euler(0, 17.7f, 0);
            //----------------------------------------------------------------------------//
            //Boundry4.SetActive(true);
            //Boundry4.transform.position = new Vector3(-1279, -253, -5715);
            //Boundry4.transform.rotation = Quaternion.Euler(0, 105.5f, 0);
        }
        else if (Num == 24)
        {
            MegaLevels[24].SetActive(true);
            //Endpoint[3].SetActive(true);
            //Endpoint[3].transform.position = new Vector3(7693, 44.1f, 934.9f);
            //Endpoint[3].transform.rotation = Quaternion.Euler(-90, 0, -158);
            //boundery.transform.position = new Vector3(0, -55f, 0);
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
				CarModle [k].SetActive (false);
                CarScpecification[k].SetActive(false);
            }
			CarModle [0].SetActive (true);
            ModleNum = 0;
            SpecificNum = 0;
            CarCheck();
		}

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
				CarModle [k].SetActive (false);
                CarScpecification[k].SetActive(false);
            }
            CarModle [9].SetActive (true);
            ModleNum = 9;
            SpecificNum = 9;
            CarCheck();
		}


	}
	public void ModleSelctionBtn()
	{
        StartCoroutine(Active_levelsandCar());
        Invoke("FirstSkipOn", 5f);
	}

    private IEnumerator Active_levelsandCar()
    {
        addloading.SetActive(true);
        yield return new WaitForSeconds(2.5f);
        if (PlayerPrefs.GetInt("mode") == 0)
        {
            this.gameObject.GetComponent<Level_Time>().enabled = false;
            TimeBar.SetActive(false);
            LevelSelection();

        }
        else if (PlayerPrefs.GetInt("mode") == 1)
        {
            this.gameObject.GetComponent<Level_Time>().enabled = true;
            TimeBar.SetActive(true);
            LevelSelection();
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
        //DemoManager.Instance.Demos[PlayerPrefs.GetInt("level_number")].SetActive(true);
        //DemoManager.Instance.Car_List[PlayerPrefs.GetInt("MNum")].SetActive(true);
        DemoManager.Instance.Swpan();
        CarSelectionPanel.SetActive(false);
        SelectionCamera.SetActive(false);
        addloading.SetActive(false);
        StopCoroutine(Active_levelsandCar());
    }
    public void  ActiveCar()
    {
        CarModle[ModleNum].SetActive(true);

    }
    public void OneTwoThreeGo()
    {
        StartCoroutine(Cut_Scene());  //ali
    }
    IEnumerator  Go_Off()
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
        RcPanel.SetActive (true);
        rccam.SetActive (true);
    }
    public void  PreviousCar()
	{
        for (int counter=0;counter <CarScpecification.Length;counter++)
        {
            CarScpecification[counter].SetActive(false);
        }
		CarModle [ModleNum].SetActive (false);
		ModleNum--;
        SpecificNum--;
        CarModle [ModleNum].SetActive(true);
        CarScpecification[SpecificNum].SetActive(true);     
        CarCheck();

	}
    public void  NextCar()
    {
        for (int counter = 0; counter < CarScpecification.Length; counter++)
        {
            CarScpecification[counter].SetActive(false);
        }
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
        RCC.nos_IsActive = true;
    }
    public void nos_Down()
    {
        //N = false;
        RCC.nos_IsActive = false;
        RCC.Nos_stop();
        NosHover.SetActive(true);
    }
    //----------------Car_shop----------------------------------------------------

    private void CarCheck()
	{
		if (ModleNum == 0) {
			buybtn.SetActive (false);
			Selectbtn.SetActive (true);
			LockImage.SetActive (false);
           // Car1.SetActive(true);

        }
		else if (ModleNum == 1 && PlayerPrefs.GetInt ("car1") == 1) {
			buybtn.SetActive (false);
			Selectbtn.SetActive (true);
			LockImage.SetActive (false);
           // Car2.SetActive(true);

        } else if (ModleNum == 2 && PlayerPrefs.GetInt ("car2") == 1) {
			buybtn.SetActive (false);
			Selectbtn.SetActive (true);
			LockImage.SetActive (false);
            //Car3.SetActive(true);

        } else if (ModleNum == 3 && PlayerPrefs.GetInt ("car3") == 1) {
			buybtn.SetActive (false);
			Selectbtn.SetActive (true);
			LockImage.SetActive (false);
            //Car4.SetActive(true);

        } else if (ModleNum == 4 && PlayerPrefs.GetInt ("car4") == 1) {
			buybtn.SetActive (false);
			Selectbtn.SetActive (true);
			LockImage.SetActive (false);
           // Car5.SetActive(true);

        } else if (ModleNum == 5 && PlayerPrefs.GetInt ("car5") == 1) {
			buybtn.SetActive (false);
			Selectbtn.SetActive (true);
			LockImage.SetActive (false);
            //Car6.SetActive(true);

        } else if (ModleNum == 6 && PlayerPrefs.GetInt ("car6") == 1) {
			buybtn.SetActive (false);
			Selectbtn.SetActive (true);
			LockImage.SetActive (false);
            //Car7.SetActive(true);

        } else if (ModleNum == 7 && PlayerPrefs.GetInt ("car7") == 1) {
			buybtn.SetActive (false);
			Selectbtn.SetActive (true);
			LockImage.SetActive (false);
            //Car8.SetActive(true);

        } else if (ModleNum == 8 && PlayerPrefs.GetInt ("car8") == 1) {
			buybtn.SetActive (false);
			Selectbtn.SetActive (true);
			LockImage.SetActive (false);
            //Car9.SetActive(true);
        } else if (ModleNum == 9 && PlayerPrefs.GetInt ("car9") == 1) {
			buybtn.SetActive (false);
			Selectbtn.SetActive (true);
			LockImage.SetActive (false);
           // Car10.SetActive(true);

        }
        else
		{
			buybtn.SetActive (true);
			Selectbtn.SetActive (false);
			LockImage.SetActive (true);
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
				CashRequired.text = (" 1500");
			}
			else if (ModleNum == 8) 
			{
				CashRequired.text = (" 5000");
			}
			else if (ModleNum == 9) 
			{
				CashRequired.text = (" 6000");
			}

			
		}
	} 

	public void UnlockCar()
	{
		PlayerPrefs.SetInt ("carunlock1",1);
			PlayerPrefs.SetInt ("car1",1);
			PlayerPrefs.SetInt ("car2",1);
			PlayerPrefs.SetInt ("car3",1);
			PlayerPrefs.SetInt ("car4",1);
			PlayerPrefs.SetInt ("car5",1);
			PlayerPrefs.SetInt ("car6",1);
			PlayerPrefs.SetInt ("car7",1);
			PlayerPrefs.SetInt ("car8",1);
			PlayerPrefs.SetInt ("car9",1);
	
		CarCheck();
	}

	public void buyCars()
	{

		if (ModleNum == 1 && PlayerPrefs.GetInt ("cashin") >= 1500) 
		{
			PlayerPrefs.SetInt ("cashin", PlayerPrefs.GetInt ("cashin") - 1500);
			PlayerPrefs.SetInt ("car1",1);
			cash.text = (" " + PlayerPrefs.GetInt ("cashin"));
			buybtn.SetActive (false);
			PurchasedText.SetActive (true);
			Invoke ("textoff", 3f);
		}

		else if (ModleNum == 2 && PlayerPrefs.GetInt ("cashin") >= 2000) 
		{
			PlayerPrefs.SetInt ("cashin", PlayerPrefs.GetInt ("cashin") - 2000);
			PlayerPrefs.SetInt ("car2",1);
			cash.text = (" " + PlayerPrefs.GetInt ("cashin"));
			buybtn.SetActive (false);
			PurchasedText.SetActive (true);
			Invoke ("textoff", 3f);
		}

		else if (ModleNum == 3 && PlayerPrefs.GetInt ("cashin") >= 2500) 
		{
			PlayerPrefs.SetInt ("cashin", PlayerPrefs.GetInt ("cashin") - 2500);
			PlayerPrefs.SetInt ("car3",1);
			cash.text = (" " + PlayerPrefs.GetInt ("cashin"));
			buybtn.SetActive (false);
			PurchasedText.SetActive (true);
			Invoke ("textoff", 3f);
		}

		else if (ModleNum == 4 && PlayerPrefs.GetInt ("cashin") >= 3000) 
		{
			PlayerPrefs.SetInt ("cashin", PlayerPrefs.GetInt ("cashin") - 3000);
			PlayerPrefs.SetInt ("car4",1);
			cash.text = (" " + PlayerPrefs.GetInt ("cashin"));
			buybtn.SetActive (false);
			PurchasedText.SetActive (true);
			Invoke ("textoff", 3f);
		}
		else if (ModleNum == 5 && PlayerPrefs.GetInt ("cashin") >= 3500) 
		{
			PlayerPrefs.SetInt ("cashin", PlayerPrefs.GetInt ("cashin") - 3500);
			PlayerPrefs.SetInt ("car5",1);
			cash.text = (" " + PlayerPrefs.GetInt ("cashin"));
			buybtn.SetActive (false);
			PurchasedText.SetActive (true);
			Invoke ("textoff", 3f);
		}

		else if (ModleNum == 6 && PlayerPrefs.GetInt ("cashin") >= 4000) 
		{
			PlayerPrefs.SetInt ("cashin", PlayerPrefs.GetInt ("cashin") - 4000);
			PlayerPrefs.SetInt ("car6",1);
			cash.text = (" " + PlayerPrefs.GetInt ("cashin"));
			buybtn.SetActive (false);
			PurchasedText.SetActive (true);
			Invoke ("textoff", 3f);
		}
		else if (ModleNum == 7 && PlayerPrefs.GetInt ("cashin") >= 4500) 
		{
			PlayerPrefs.SetInt ("cashin", PlayerPrefs.GetInt ("cashin") - 4500);
			PlayerPrefs.SetInt ("car7",1);
			cash.text = (" " + PlayerPrefs.GetInt ("cashin"));
			buybtn.SetActive (false);
			PurchasedText.SetActive (true);
			Invoke ("textoff", 3f);
		}
		else if (ModleNum == 8 && PlayerPrefs.GetInt ("cashin") >= 5000) 
		{
			PlayerPrefs.SetInt ("cashin", PlayerPrefs.GetInt ("cashin") - 5000);
			PlayerPrefs.SetInt ("car8",1);
			cash.text = (" " + PlayerPrefs.GetInt ("cashin"));
			buybtn.SetActive (false);
			PurchasedText.SetActive (true);
			Invoke ("textoff", 3f);
		}


		else if (ModleNum == 9 && PlayerPrefs.GetInt ("cashin") >= 6000) 
		{
			PlayerPrefs.SetInt ("cashin", PlayerPrefs.GetInt ("cashin") - 60000);
			PlayerPrefs.SetInt ("car9",1);
			cash.text = (" " + PlayerPrefs.GetInt ("cashin"));
			buybtn.SetActive (false);
			PurchasedText.SetActive (true);
			Invoke ("textoff", 3f);
		}
		else
		{
            LowCashText.SetActive (true);
			Invoke ("textoff", 3f);
		}

		CarCheck ();
		
	}
	private void textoff()
	{
        PurchasedText.SetActive (false);
		LowCashText.SetActive (false);
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


    public void set_CurrentVehiclestatus(bool val)
    {
        CarModle[ModleNum].SetActive(val);
        rccam.SetActive(val);
    }
}
