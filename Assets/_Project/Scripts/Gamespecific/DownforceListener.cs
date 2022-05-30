using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DownforceListener : MonoBehaviour
{
    public float tyregrip;
    public float downforce;
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
                if (col.gameObject.GetComponentInParent<HandleTyreGrip>())
                {
                  //  player = col.gameObject.GetComponentInParent<HandleTyreGrip>().gameObject;
                    col.gameObject.GetComponentInParent<HandleTyreGrip>().enabled = true;
                    col.gameObject.GetComponentInParent<HandleTyreGrip>().tireGrip = tyregrip;
                    col.gameObject.GetComponentInParent<HandleTyreGrip>().downforce = downforce;

                    //col.gameObject.transform.parent.transform.rotation = Quaternion.Euler(col.gameObject.transform.parent.rotation.x, 0, col.gameObject.transform.parent.rotation.z);
                    // downforceactive = true;
                }
            }
           else if (this.tag == "DownForceOff")
            {
                if (col.gameObject.GetComponentInParent<HandleTyreGrip>())
                {
                    // downforceactive = false;
                    col.gameObject.GetComponentInParent<HandleTyreGrip>().enabled = false;
                    col.gameObject.GetComponentInParent<HandleTyreGrip>().tireGrip = tyregrip;
                    col.gameObject.GetComponentInParent<HandleTyreGrip>().downforce = downforce;
                   // col.transform.rotation = Quaternion.Euler(0f, col.transform.eulerAngles.y , 0f);

                }
            }
        }
    }

    //private void Update()
    //{
    //    if (downforceactive && player)
    //    {
    //        Quaternion target = Quaternion.Euler(player.transform.rotation.x, 0f, player.transform.rotation.z);
    //        player.transform.rotation = Quaternion.Slerp(player.transform.rotation,target,Time.deltaTime*smoothrotation);
    //    }

    //}
}
