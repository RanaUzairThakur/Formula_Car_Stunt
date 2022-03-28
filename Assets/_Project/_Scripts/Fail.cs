using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Fail : MonoBehaviour
{
    public WheelCollider[] WhellColliders;
    WheelHit wheelHit;
    public GameObject PlayerCar;
    public GameObject FailPanel,RCCCam,RccPanel;

    [SerializeField] private float duration;
    private float timer = 0f;

    // Update is called once per frame
    void Update()
    {
        timer += Time.deltaTime;

        //if (timer >= duration)
        //{
        //    RccPanel.SetActive(false);
        //    FailPanel.SetActive(true);
        //}

        if (!HitSurface())
        {
            if (timer >= duration)
            {
                RccPanel.SetActive(false);
                FailPanel.SetActive(true);
            }
           // Invoke("FailOn", 30f);
        }
    }
    public void FailOn()
    {
       // RCCCam.GetComponent<RCC_Camera>().enabled = false;
        RccPanel.SetActive(false);
        FailPanel.SetActive(true);
    }
    bool HitSurface()
    {

        foreach (WheelCollider w in WhellColliders)
        {
            if (w.GetGroundHit(out wheelHit))

                timer = 0f;

            return true;
        }
        return false;
    }
}
