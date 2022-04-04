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
            SoundsManager._instance.PlaySound(SoundsManager._instance.levelFail);
            SoundsManager._instance.Stop_PlayingMusic();
            GamePlayManager.inst.TutorailPanel.SetActive(false);
             FailPanel.SetActive(true);
            //RevivePanel.SetActive(true);
            //RevivePanel.gameObject.GetComponent<ReviveCountDown>().timeLeft = 10f;
            Time.timeScale=0f;

        }

	}
    public void WatchVideo()
    {
        // TimeRevive.Instance.StartRewind(1);
        //RevivePanel.SetActive(false);
        //Time.timeScale = 1f;
    }

}
