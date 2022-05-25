using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class DailyRewardHandler : MonoBehaviour
{
    public Text dailyRewardTimeTxt;
    // Start is called before the first frame update
    private void OnEnable()
    {
        if (Toolbox.DB.Prefs.Dailyrewardclaimed)
             DailyRewardTxtHandling();
        
    }
    private void OnDisable()
    {
        StopCoroutine(CR_TimeHandling());
    }
    #region DailyReward Handling 
    public void DailyRewardTxtHandling()
    {

        if (DateTime.Now >= Toolbox.DB.Prefs.NextDailyRewardTime)
        {
            dailyRewardTimeTxt.text = "Ready";
        }

        else
        {
            StartCoroutine(CR_TimeHandling());
        }
    }

    IEnumerator CR_TimeHandling()
    {
        while (true)
        {
            dailyRewardTimeTxt.text = Get_DailyRewardTimeString();
            yield return new WaitForSeconds(1);
        }
    }

    string Get_DailyRewardTimeString()
    {

        TimeSpan diff = Toolbox.DB.Prefs.NextDailyRewardTime - DateTime.Now;
        int hours = diff.Hours;
        hours += (diff.Days * 24);
        return string.Format("{0}H {1}M {2}S", hours, diff.Minutes, diff.Seconds);
    }

    #endregion

}
