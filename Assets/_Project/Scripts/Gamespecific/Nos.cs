using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Nos : MonoBehaviour
{
    public bool ChangeColour = false;
    public List<Color> Noscolours;
    int ran = 0;
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
                if (ChangeColour)
                {
                    ran = Random.Range(0,Noscolours.Count);
                    Toolbox.GameplayController.Effectsfx.set_colorStatus(Noscolours[ran]);
                }

            }
            else if (this.tag == "Noscut")
            {
                HUDListner.OnPress_ReleaseNos();
                HUDListner.onpress_ReleaseGas();
            }
        }
    }
}
