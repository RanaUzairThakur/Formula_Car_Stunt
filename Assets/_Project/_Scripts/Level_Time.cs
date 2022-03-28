using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Level_Time : MonoBehaviour {
    float time;
    public int[] play_time;
    int PT;
    float TL;
    public Text timetext;
    public static bool ispause = true;
    public GameObject FAILPANANL;
    void Start()
    {
        ispause = true;
        Screen.sleepTimeout = SleepTimeout.NeverSleep;
        PT = play_time[PlayerPrefs.GetInt("level_number")];
        StartCoroutine("LoseTime");
        time = TL;
    }
    void Update()
    {
        TL = PT;
        string minutes = ((int)TL / 60).ToString("0");
        string seconds = (TL % 60).ToString("00");
        timetext.text =  minutes + ":" + seconds;
        TL = Mathf.Clamp01(TL) * TL;
        if (ispause==true)
        {
            if (TL <= 0)
            {
                StopCoroutine("LoseTime");
                GCFailScript.Instance.FailPanel.SetActive(true);
                Time.timeScale = 0;
                //if (PlayerPrefs.GetInt("mode") == 0)
                //{
                //    FirebaseHandler.instance.logLevelStarted("TimeUp_M_T_L_", (PlayerPrefs.GetInt("level_number")).ToString());
                //}
                //if (PlayerPrefs.GetInt("mode") == 1)
                //{
                //    FirebaseHandler.instance.logLevelStarted("TimeUp_M_C_L_", (PlayerPrefs.GetInt("level_number")).ToString());
                //}
                //if (PlayerPrefs.GetInt("mode") == 2)
                //{
                //    FirebaseHandler.instance.logLevelStarted("TimeUp_M_M_L_", (PlayerPrefs.GetInt("level_number")).ToString());
                //}
                ispause = false;
            }

        }
    }
 
    IEnumerator LoseTime()
    {
        while (true)
        {
            yield return new WaitForSeconds(1);
            if (ispause == true)
            {
                PT = --(PT);
            }
        }
    }
}
