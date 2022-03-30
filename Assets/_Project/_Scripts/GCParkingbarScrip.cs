using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class GCParkingbarScrip: MonoBehaviour {


	public GameObject CompletePanel,rcpanel,PointsPanel, addloading,SuccessCam;
	public Slider TimeSlider,BonusSlider,StuntsSlider;
	private bool unlockL,bslider=false,tslider=false,sslider=false;
	public Animator anim;
	public GameObject finalCam,shashka,driver;
	public Text BBonusText, SStuntsText, TTimeText,cashEarned;
	public int Timer, bonuser, stunter,dumpingvalue,cashnmber=300;
	public GameObject /*winsound,GPSound,*/Star;
    //public GameObject[] EndCams;
    [HideInInspector]
    public int CashReward;
    public static bool Showads; 
    public static GCParkingbarScrip instance;
    public bool rotating;
    public List<GameObject> Dummycars;
    void Start ()
    {
        instance = this;
        unlockL = true;
        Timer = Random.Range(20, 101);
		stunter= Random.Range(30, 150);
		bonuser= Random.Range(10, 50);
	}
	
	// Update is called once per frame
	void Update () 
	{
		if (tslider)
		{
			if (TimeSlider.value < Timer) 
			{
				TimeSlider.value += 40f * Time.deltaTime;
				dumpingvalue = (int)TimeSlider.value;
				TTimeText.text=("+"+dumpingvalue);
			} 
			else 
			{
				tslider = false;
				sslider = true;
				PlayerPrefs.SetInt ("cashin", PlayerPrefs.GetInt ("cashin") +dumpingvalue);
				cashnmber = cashnmber+dumpingvalue;
			}
		}

		else if (sslider)
		{
			if(StuntsSlider.value<stunter)
			{
				StuntsSlider.value+= 50f * Time.deltaTime;
				dumpingvalue = (int)StuntsSlider.value;
				SStuntsText.text=("+"+dumpingvalue);
			}
			else
			{
				sslider=false;
				bslider=true;
				PlayerPrefs.SetInt ("cashin", PlayerPrefs.GetInt ("cashin") +dumpingvalue);
				cashnmber = cashnmber+dumpingvalue;
			}
		}
		else if (bslider)
		{
			if (BonusSlider.value < bonuser)
			{
				BonusSlider.value+= 40f * Time.deltaTime;
				dumpingvalue = (int)BonusSlider.value;
				BBonusText.text=("+"+dumpingvalue);
				
			}
			else 
			{
				bslider = false;
				cashnmber = cashnmber+dumpingvalue;
				cashEarned.text=(" "+cashnmber);
				PlayerPrefs.SetInt ("cashin", PlayerPrefs.GetInt ("cashin") +dumpingvalue);
				//StartCoroutine ("completed");
			}
		}

	
	}

 public	void OnTriggerEnter(Collider Target)
	{
		if (Target.tag== "Player")
        {
            RCC_CarControllerV3.instance.skid = true;
			//anim.SetBool ("cal", false);
            GamePlayManager.inst.Fadescreen.SetActive(true);		
			rcpanel.SetActive (false);
			PlayerPrefs.SetInt ("cashin", PlayerPrefs.GetInt ("cashin") + 300);
			if (PlayerPrefs.GetInt ("level_number") > 4 && PlayerPrefs.GetInt ("level_number") < 9)
            {
                CashReward = 200;
                PlayerPrefs.SetInt ("cashin", PlayerPrefs.GetInt ("cashin") + 200);	
			}
			else 
			{
                CashReward = 700;
                PlayerPrefs.SetInt ("cashin", PlayerPrefs.GetInt ("cashin") + 700);
			}
               StartCoroutine("Ddelay");
            Invoke(nameof(Vehicle_withdriver),1.7f);
		}
	}
	void OnTriggerExit(Collider Tragert)
	{
		//anim.SetBool ("Paint", true);
	}

    public void Success()
    {
        Star.SetActive(false);
        PointsPanel.SetActive(false);
        CompletePanel.SetActive(true);
        Level_Time.ispause = false;
        Time.timeScale = 0;
    }

	IEnumerator Ddelay()
	{
        yield return new WaitForSeconds(2f);
        if (rotating)
        {
            finalCam.GetComponent<Animator>().enabled = false;
            finalCam.GetComponent<camorbit>().enabled = true;
        }
        yield return new WaitForSeconds (7f);
        //winsound.SetActive(false);
		tslider = true;
        finalCam.SetActive(false);
        SuccessCam.SetActive(true);
        PointsPanel.SetActive(true);
        StartCoroutine ("completed");
    }
    IEnumerator completed()
	{

        yield return new WaitForSeconds (1f);
        if (unlockL && !Showads)
        {
            //if (PlayerPrefs.GetInt("mode") == 0)
            //{
            //    FirebaseHandler.instance.logLevelStarted("Success_M_T_L_", (PlayerPrefs.GetInt("level_number")).ToString());
            //}
            //if (PlayerPrefs.GetInt("mode") == 1)
            //{
            //    FirebaseHandler.instance.logLevelStarted("Success_M_C_L_", (PlayerPrefs.GetInt("level_number")).ToString());
            //}
            //if (PlayerPrefs.GetInt("mode") == 2)
            //{
            //    FirebaseHandler.instance.logLevelStarted("Success_M_M_L_", (PlayerPrefs.GetInt("level_number")).ToString());
            //}
            PlayerPrefs.SetInt ("level_number",PlayerPrefs.GetInt ("level_number")+1);
            if (PlayerPrefs.GetInt("mode") == 0)
            {
                int min = PlayerPrefs.GetInt("level_number");
                int max = PlayerPrefs.GetInt("compare");
                if (max < min)
                {
                    PlayerPrefs.SetInt("compare", min);
                }
            }

            if (PlayerPrefs.GetInt("mode") == 1)
            {
                int min1 = PlayerPrefs.GetInt("level_number");
                int max1 = PlayerPrefs.GetInt("compare2");
                if (max1 < min1)
                {
                    PlayerPrefs.SetInt("compare2", min1);

                }
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
        }
        PlayerPrefs.SetInt("Weather", Random.Range(0, 5));
        finalCam.SetActive(false);
		unlockL = false;
        Showads = false;
        AudioListener.volume = 1;
        PlayerPrefs.SetInt("Gift", 0);
        StopAllCoroutines();

	}
    IEnumerator skid()
    {
        yield return new WaitForSeconds(1f);
        Time.timeScale = 0;
    }

    private void Vehicle_withdriver()
    {

        GamePlayManager.inst.set_CurrentVehiclestatus(false);
        shashka.SetActive(true);
        driver.SetActive(true);
        foreach (GameObject g in Dummycars)
            g.SetActive(false);
        Dummycars[GamePlayManager.inst.ModleNum].SetActive(true);
        finalCam.SetActive(true);
    }
}
