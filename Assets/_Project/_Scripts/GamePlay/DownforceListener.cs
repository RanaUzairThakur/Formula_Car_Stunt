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
                if (col.gameObject.GetComponentInParent<HandleTyreGrip>())
                {
                    col.gameObject.GetComponentInParent<HandleTyreGrip>().enabled = true;
                    col.gameObject.GetComponentInParent<HandleTyreGrip>().tireGrip = tyregrip;
                    col.gameObject.GetComponentInParent<HandleTyreGrip>().downforce = downforce;

                }
            }
           else if (this.tag == "DownForceOff")
            {
                if (col.gameObject.GetComponentInParent<HandleTyreGrip>())
                {
                    col.gameObject.GetComponentInParent<HandleTyreGrip>().enabled = false;
                    col.gameObject.GetComponentInParent<HandleTyreGrip>().tireGrip = tyregrip;
                    col.gameObject.GetComponentInParent<HandleTyreGrip>().downforce = downforce;
                   // col.transform.rotation = Quaternion.Euler(0f, col.transform.eulerAngles.y , 0f);

                }
            }
        }
    }
}
