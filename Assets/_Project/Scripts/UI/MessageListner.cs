﻿using UnityEngine;
using UnityEngine.UI;

public class MessageListner : MonoBehaviour
{
    public Text messageTxt;
    public Text HeaderTxt;
   
    public void UpdateTxt(string _str,string str) {
        this.gameObject.SetActive(true);
        messageTxt.text = _str;
        HeaderTxt.text = str;
    }

    public void OnPress_Okay() 
    {
        Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.buttonPress);
        this.gameObject.SetActive(false);
        if (Toolbox.GameManager.Reviveplayer)
        {
            if (FindObjectOfType<GameplayController>())
            {
                Time.timeScale = 1.0f;
                FindObjectOfType<GameplayController>().LevelFailHandling();
                
            }
            Toolbox.GameManager.Reviveplayer = false;
        }
        if(Toolbox.GameplayController.LevelComplete)
        {
            if (FindObjectOfType<LevelCompleteListner>())
                FindObjectOfType<LevelCompleteListner>().Ads();
        }
        //    Destroy(this.gameObject);
    }

   

}
