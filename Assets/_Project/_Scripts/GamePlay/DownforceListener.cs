using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DownforceListener : MonoBehaviour
{
    public float tyregrip;
    public float downforce;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    void OnTriggerEnter(Collider col)
    {


        if (col.gameObject.CompareTag("Player"))
        {

            if (this.tag == "DownForceOn")
            {
                if (col.gameObject.GetComponent<HandleTyreGrip>())
                {
                    col.gameObject.GetComponent<HandleTyreGrip>().enabled = true;
                    col.gameObject.GetComponent<HandleTyreGrip>().tireGrip = tyregrip;
                    col.gameObject.GetComponent<HandleTyreGrip>().downforce = downforce;
                }   
            }
           else if (this.tag == "DownForceOff")
            {
                if (col.gameObject.GetComponent<HandleTyreGrip>())
                {
                    col.gameObject.GetComponent<HandleTyreGrip>().enabled = false;
                    col.gameObject.GetComponent<HandleTyreGrip>().tireGrip = tyregrip;
                    col.gameObject.GetComponent<HandleTyreGrip>().downforce = downforce;
                }
            }
        }
    }
}
