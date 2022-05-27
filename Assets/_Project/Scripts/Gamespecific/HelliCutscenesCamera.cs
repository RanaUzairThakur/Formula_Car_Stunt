using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class HelliCutscenesCamera : MonoBehaviour
{
    // Start is called before the first frame update
    public GameObject[] Cameras;
    public GameObject Dust;
    void Start()
    {
        
    }

    public void Camera0Active()
    {
        foreach (GameObject g in Cameras)
            g.SetActive(false);
        Cameras[0].SetActive(true);
    }
    public void Camera1Active()
    {

        foreach (GameObject g in Cameras)
            g.SetActive(false);
        Cameras[1].SetActive(true);
    }
    public void Camera2Active()
    {

        foreach (GameObject g in Cameras)
            g.SetActive(false);
        Cameras[2].SetActive(true);
    }
    public void Camera3Active()
    {

        foreach (GameObject g in Cameras)
            g.SetActive(false);
        Cameras[3].SetActive(true);
    }
    public void DustOn()
    {
        Dust.SetActive(true);
        //Toolbox.CutsceneManager.FinishCutscene();
    }
    //public void End()
    //{
    //  Toolbox.CutsceneManager.FinishCutscene(3f);
    //}

}
