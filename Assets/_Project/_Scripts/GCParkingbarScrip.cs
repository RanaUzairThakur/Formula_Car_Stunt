using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class GCParkingbarScrip: MonoBehaviour {

	//public Slider TimeSlider,BonusSlider,StuntsSlider;
	private bool unlockL,bslider=false,tslider=false,sslider=false;
	//public Animator anim;
	public GameObject finalCam,shashka,driver;
	//public Text BBonusText, SStuntsText, TTimeText,cashEarned;
	//public int Timer, bonuser, stunter,dumpingvalue,cashnmber=300;
	//public GameObject /*winsound,GPSound,*/Star;
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
  //      Timer = Random.Range(20, 101);
		//stunter= Random.Range(30, 150);
		//bonuser= Random.Range(10, 50);
	}
	
	// Update is called once per frame
	//void Update () 
	//{
	//	if (tslider)
	//	{
	//		if (TimeSlider.value < Timer) 
	//		{
	//			TimeSlider.value += 40f * Time.deltaTime;
	//			dumpingvalue = (int)TimeSlider.value;
	//			TTimeText.text=("+"+dumpingvalue);
	//		} 
	//		else 
	//		{
	//			tslider = false;
	//			sslider = true;
	//			PlayerPrefs.SetInt ("cashin", PlayerPrefs.GetInt ("cashin") +dumpingvalue);
	//			cashnmber = cashnmber+dumpingvalue;
	//		}
	//	}

	//	else if (sslider)
	//	{
	//		if(StuntsSlider.value<stunter)
	//		{
	//			StuntsSlider.value+= 50f * Time.deltaTime;
	//			dumpingvalue = (int)StuntsSlider.value;
	//			SStuntsText.text=("+"+dumpingvalue);
	//		}
	//		else
	//		{
	//			sslider=false;
	//			bslider=true;
	//			PlayerPrefs.SetInt ("cashin", PlayerPrefs.GetInt ("cashin") +dumpingvalue);
	//			cashnmber = cashnmber+dumpingvalue;
	//		}
	//	}
	//	else if (bslider)
	//	{
	//		if (BonusSlider.value < bonuser)
	//		{
	//			BonusSlider.value+= 40f * Time.deltaTime;
	//			dumpingvalue = (int)BonusSlider.value;
	//			BBonusText.text=("+"+dumpingvalue);
				
	//		}
	//		else 
	//		{
	//			bslider = false;
	//			cashnmber = cashnmber+dumpingvalue;
	//			cashEarned.text=(" "+cashnmber);
	//			PlayerPrefs.SetInt ("cashin", PlayerPrefs.GetInt ("cashin") +dumpingvalue);
	//			//StartCoroutine ("completed");
	//		}
	//	}

	
	//}

 public	void OnTriggerEnter(Collider Target)
	{
		if (Target.tag== "Player")
        {
            RCC_CarControllerV3.instance.skid = true;
			//anim.SetBool ("cal", false);
            GamePlayManager.inst.Fadescreen.SetActive(true);		
			GamePlayManager.inst.RcPanel.SetActive (false);
            Invoke(nameof(Vehicle_withdriver),1.7f);
		}
	}
   

	private void complete()
	{
        GamePlayManager.inst.Set_statusCongartulations(); 
		CancelInvoke(nameof(complete));
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
		Invoke(nameof(complete),7f);
		CancelInvoke(nameof(Vehicle_withdriver));
	}
}
