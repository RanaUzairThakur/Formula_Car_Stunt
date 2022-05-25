using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GCFailScript : MonoBehaviour {
    public static GCFailScript Instance;
    public GameObject FailPanel,RevivePanel, FailText,rcpanel,rccam;

    public void Start()
    {
        Instance = this;
    }
    void OnTriggerEnter(Collider Target)
	{
		if (Target.tag== "Player") 
		{
            SoundsManager1._instance.PlaySound(SoundsManager1._instance.levelFail);
            SoundsManager1._instance.Stop_PlayingSound();
            // GamePlayManager.inst.TutorailPanel.SetActive(false);
            // FailPanel.SetActive(true);
            //  Time.timeScale=0f;
            GamePlayManager.inst.Resetvehicle();

        }

	}
    public void WatchVideo()
    {
        // TimeRevive.Instance.StartRewind(1);
        //RevivePanel.SetActive(false);
        //Time.timeScale = 1f;
    }

}
