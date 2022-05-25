using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class parachutemanager : MonoBehaviour
{
    public Animator Anim;
    // Start is called before the first frame update
    void Start()
    {
        
    }


    public void Startlanding()
    {
        Anim.SetTrigger("isLanding");
    }
    public void StartGame()
    {
     //   Toolbox.Cutscenemanager.ParachuteAnimscene.SetActive(false);
        Toolbox.HUDListner.OnPress_OkTutorial();
    }
    public void chnagespeed()
    {

        Anim.SetFloat("speed",0.5f);
    }

}
