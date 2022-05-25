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
    
	}
	
	
 public	void OnTriggerEnter(Collider Target)
	{
		if (Target.tag== "Player")
        {
            RCC_CarControllerV3.instance.skid = true;
            GamePlayManager.inst.Fadescreen.SetActive(true);		
			GamePlayManager.inst.RcPanel.SetActive (false);
            shashka.SetActive(true);
            GamePlayManager.inst.rccam.GetComponent<RCC_Camera>().RemoveTarget();
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

        //SoundsManager._instance.PlaySound(SoundsManager._instance.WinAppreciationsound);
        //SoundsManager._instance.Stop_PlayingMusic();
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
