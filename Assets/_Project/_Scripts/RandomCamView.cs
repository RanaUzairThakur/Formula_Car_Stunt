using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RandomCamView : MonoBehaviour
{

    public float speed;
    public GameObject[] camera,camera2,camera3;
    public GameObject[] ImageText,SignalLights;
    public int value;
    public GameObject skipbtn;
    bool skippss;
    bool Go;
    public static RandomCamView ins;
    void Start()
    {
        if(value==0)
        {
            StartCoroutine(Offnow());
        }
        ins = this;

    }

    bool once;
 
    IEnumerator Offnow()
    {
        ImageText[0].SetActive(true);
        yield return new WaitForSeconds(1.5f);
        ImageText[0].SetActive(false);
        ImageText[1].SetActive(true);
        camera[0].gameObject.SetActive(false);
        camera[1].gameObject.SetActive(true);
        yield return new WaitForSeconds(2f);
        ImageText[1].SetActive(false);
        ImageText[2].SetActive(true);
        camera[1].gameObject.SetActive(false);
        camera[2].gameObject.SetActive(true);
        yield return new WaitForSeconds(2f);
        ImageText[2].SetActive(false);
        camera[2].gameObject.SetActive(false);
        skipbtn.SetActive(false);
        ImageText[4].SetActive(true);
        ImageText[5].SetActive(true);
        SignalLights[0].SetActive(true);
        yield return new WaitForSeconds(4f);
        SignalLights[1].SetActive(true);
        SignalLights[0].SetActive(false);
        yield return new WaitForSeconds(3f);
        SignalLights[2].SetActive(true);
        SignalLights[1].SetActive(false);
        yield return new WaitForSeconds(1f);
        ImageText[4].SetActive(false);
        ImageText[5].SetActive(false);
        ImageText[3].SetActive(true);
        camera[3].gameObject.GetComponent<Camera>().enabled = true;
        yield return new WaitForSeconds(2f);
        ImageText[3].SetActive(false);
        StopAllCoroutines();
    }

    IEnumerator Offnow2()
    {
 
        camera[0].gameObject.SetActive(false);
        camera[1].gameObject.SetActive(true);
        yield return new WaitForSeconds(1.5f);
        camera[1].gameObject.SetActive(false);
        camera[2].gameObject.SetActive(true);
        yield return new WaitForSeconds(1.5f);
        camera[2].gameObject.SetActive(false);
        camera[3].gameObject.GetComponent<Camera>().enabled = true;
        StopAllCoroutines();

    }
    IEnumerator Offnow3()
    {

        camera[0].gameObject.SetActive(false);
        camera[1].gameObject.SetActive(true);
        yield return new WaitForSeconds(1.5f);
        camera[1].gameObject.SetActive(false);
        camera[2].gameObject.SetActive(true);
        yield return new WaitForSeconds(1.5f);
        camera[2].gameObject.SetActive(false);
        camera[3].gameObject.GetComponent<Camera>().enabled = true;
        StopAllCoroutines();


    }
    public void GoOff()
    {
        if (Go==true)
        {

        }
    }
    public void Skip()
    {
        skippss = true;
        camera[0].gameObject.SetActive(false);
        camera[1].gameObject.SetActive(false);
        camera[2].gameObject.SetActive(false);
        ImageText[0].SetActive(false);
        ImageText[1].SetActive(false);
        ImageText[2].SetActive(false);
        ImageText[3].SetActive(true);
        camera[3].gameObject.GetComponent<Camera>().enabled = true;
        StopAllCoroutines();
        Invoke("NowStart", 2f);

    }
    void NowStart()
    {
        ImageText[3].SetActive(false);  
    }


}
