using UnityEngine;
using System.Collections.Generic;
public class EffectListener : MonoBehaviour
{
    public GameObject Booseffect;
    public GameObject nos_AirEffect;
    public GameObject TyreTrail;
    public GameObject NeonTyreleft;
    public GameObject NeonTyreRight;
    public List<GameObject> Countingobj;
    public List<GameObject> CountingCameras;
    //private bool ischeapdevice = false;
    //private void Awake()
    //{
    //    if (Toolbox.DB.Prefs.IsDetectVeryCheapDevice)
    //    {
    //        ischeapdevice = true;
    //    }
    //    else if (Toolbox.DB.Prefs.IsDetectLowCheapDevice)
    //    {
    //        ischeapdevice = false;
    //    }
    //    else if (Toolbox.DB.Prefs.IsDetectMediumCheapDevice)
    //    {
    //        ischeapdevice = false;
    //    }
    //    else
    //    {
    //        ischeapdevice = false;
    //    }
    //}

    public void set_statusAirEffect(bool val, bool isgrounded)
    {
        //if (ischeapdevice)
        //    return;

        nos_AirEffect.SetActive(val);
        Booseffect.SetActive(val);
        if (val)
        {
            if (isgrounded)
            {
                TyreTrail.SetActive(val);
                NeonTyreleft.SetActive(val);
                NeonTyreRight.SetActive(val);
            }
            // print("Boost");
        }
        else
        {
            TyreTrail.SetActive(val);
            NeonTyreleft.SetActive(val);
            NeonTyreRight.SetActive(val);

        }
    }

    public void set_colorStatus(Color _color)
    {
        NeonTyreleft.gameObject.GetComponent<MeshRenderer>().material.color = _color;
        NeonTyreleft.gameObject.transform.GetChild(0).gameObject.GetComponent<MeshRenderer>().material.color = _color;
        NeonTyreRight.gameObject.GetComponent<MeshRenderer>().material.color = _color;
        NeonTyreRight.gameObject.transform.GetChild(0).gameObject.GetComponent<MeshRenderer>().material.color = _color;
        for (int i = 0; i < TyreTrail.transform.childCount; i++)
        {
            TyreTrail.transform.GetChild(i).GetComponent<TrailRenderer>().material.color = _color;
        }
    }


    // Counting 1 ,2,3 


    public void Startcountdown()
    {
        Invoke(nameof(count_One),4f);
        Toolbox.GameplayController.Rcccamera.SetActive(false);

    }
    public void count_One()
    {
        foreach(GameObject g in Countingobj)
        {
            g.SetActive(false);
        }
        foreach (GameObject c in CountingCameras)
        {
            c.SetActive(false);
        }
        Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.Countingvoiceovers[0]);
        Countingobj[0].SetActive(true);
        CountingCameras[0].SetActive(true);
        Invoke(nameof(count_Two),1.01f);
        CancelInvoke(nameof(count_One));
    }
    public void count_Two()
    {
        foreach (GameObject g in Countingobj)
        {
            g.SetActive(false);
        }
        foreach (GameObject c in CountingCameras)
        {
            c.SetActive(false);
        }
        Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.Countingvoiceovers[1]);
        Countingobj[1].SetActive(true);
        CountingCameras[1].SetActive(true);
        Invoke(nameof(count_Three), 1.01f);
        CancelInvoke(nameof(count_Two));
    }
    public void count_Three()
    {
        foreach (GameObject g in Countingobj)
        {
            g.SetActive(false);
        }
        foreach (GameObject c in CountingCameras)
        {
            c.SetActive(false);
        }
        Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.Countingvoiceovers[2]);
        Countingobj[2].SetActive(true);
        CountingCameras[2].SetActive(true);
        Invoke(nameof(count_Go), 1.01f);
        CancelInvoke(nameof(count_Three));
    }
    public void count_Go()
    {
        foreach (GameObject g in Countingobj)
        {
            g.SetActive(false);
        }
        foreach (GameObject c in CountingCameras)
        {
            c.SetActive(false);
        }
        Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.Countingvoiceovers[3]);
        Countingobj[3].SetActive(true);
        Toolbox.GameplayController.Rcccamera.transform.position = CountingCameras[2].transform.position;
        Toolbox.GameplayController.Rcccamera.transform.position = CountingCameras[2].transform.position;

        Toolbox.GameplayController.Rcccamera.SetActive(true);
        Toolbox.GameplayController.HUD_Status(true);
        Invoke(nameof(Go_off),2f);
        //CountingCameras[0].SetActive(false);
    }
    private void Go_off()
    {
        foreach (GameObject g in Countingobj)
        {
            g.SetActive(false);
        }
        foreach (GameObject c in CountingCameras)
        {
            c.SetActive(false);
        }
        Toolbox.Soundmanager.PlayMusic_Game(Random.Range(0, Toolbox.Soundmanager.gameBG.Length));
    }

}
