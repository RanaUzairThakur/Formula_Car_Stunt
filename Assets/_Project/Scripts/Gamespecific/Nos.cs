using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Nos : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        
    }


    void OnTriggerEnter(Collider col)
    {

           // print("Nos");

        if (col.gameObject.CompareTag("Player"))
        {
            if (this.tag == "Nos")
            {
                //print("Nos1");
                HUDListner.OnPress_Nos();
                HUDListner.onpress_Gas();
            }
            else if (this.tag == "Noscut")
            {
                HUDListner.OnPress_ReleaseNos();
                HUDListner.onpress_ReleaseGas();
            }
        }
    }
}
