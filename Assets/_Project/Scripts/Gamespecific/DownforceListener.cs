using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DownforceListener : MonoBehaviour
{
    public float tyregrip;
    public float downforce =250f;
    GameObject player;
    //private bool downforceactive;
    //private float smoothrotation =3f;
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
                if (col.gameObject.GetComponentInParent<RCC_CarControllerV3>())
                    col.gameObject.GetComponentInParent<RCC_CarControllerV3>().downForce = downforce;
                //if (col.gameObject.GetComponentInParent<HandleTyreGrip>())
                //{
                //    col.gameObject.GetComponentInParent<HandleTyreGrip>().enabled = true;
                //    col.gameObject.GetComponentInParent<HandleTyreGrip>().tireGrip = tyregrip;
                //    col.gameObject.GetComponentInParent<HandleTyreGrip>().downforce = downforce;


                    //}
            }
            else if (this.tag == "DownForceOff")
            {
                if (col.gameObject.GetComponentInParent<RCC_CarControllerV3>())
                    col.gameObject.GetComponentInParent<RCC_CarControllerV3>().downForce = downforce;
                //if (col.gameObject.GetComponentInParent<HandleTyreGrip>())
                //{
                //    col.gameObject.GetComponentInParent<HandleTyreGrip>().enabled = false;
                //    col.gameObject.GetComponentInParent<HandleTyreGrip>().tireGrip = tyregrip;
                //    col.gameObject.GetComponentInParent<HandleTyreGrip>().downforce = downforce;

                //}
            }
        }
    }
}

