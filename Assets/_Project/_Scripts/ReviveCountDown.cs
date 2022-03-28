using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class ReviveCountDown : MonoBehaviour
{
    public static ReviveCountDown Instance;
    public float timeLeft = 10f;
    public GameObject myaudio;
    public Text text;
    bool OneTime = false;
    private void OnEnable()
    {                                                        
        timeLeft = 10f;
        OneTime = false;
        StartCoroutine(CountDown());
    }
    void Start()
    {                                                                                                                                          
        Instance = this;
     
    }


    IEnumerator CountDown()
    {

        yield return new WaitForSecondsRealtime(1f);
        timeLeft--;
        text.text = "" + timeLeft;
        if (timeLeft < 1 && OneTime == false)
        {
            OneTime = true;
            this.gameObject.SetActive(false);
            if (PlayerPrefs.GetInt("mode") == 0)
            {
                //FirebaseHandler.instance.logLevelStarted("Fail_M_T_L_", (PlayerPrefs.GetInt("level_number")).ToString());
            }
            if (PlayerPrefs.GetInt("mode") == 1)
            {
                //FirebaseHandler.instance.logLevelStarted("Fail_M_C_L_", (PlayerPrefs.GetInt("level_number")).ToString());
            }
            if (PlayerPrefs.GetInt("mode") == 2)
            {
                //FirebaseHandler.instance.logLevelStarted("Fail_M_M_L_", (PlayerPrefs.GetInt("level_number")).ToString());
            }
            GCFailScript.Instance.FailPanel.SetActive(true);
            Time.timeScale = 0;

        }
        else
        {
            StartCoroutine(CountDown());
        }
    }
}
