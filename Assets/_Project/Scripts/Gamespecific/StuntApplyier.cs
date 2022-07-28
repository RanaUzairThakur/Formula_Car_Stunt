using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class StuntApplyier : MonoBehaviour
{

    public bool X = false;
    public bool Y = false;
    public bool Z = false;
    public float speed = 300f;
    private bool jump = false;
    public bool stuntcameraenable = false;
    //int ran = 0;
    // Start is called before the first frame update
    void Start()
    {

    }

    void OnTriggerEnter(Collider col)
    {


        if (col.gameObject.CompareTag("Player") /*&& !jump*/)
        {

            if (this.tag == "stuntrotation")
            {
                //jump = true;
                if (X)
                {
                    col.gameObject.GetComponentInParent<CarstuntHandler>().Set_Statustantrotation(transform.rotation, StuntRotationAxis.X, speed);
                    Toolbox.HUDListner.set_StatusStunt(true,"Flat spin stunt");
                }
                else if (Y)
                {
                    col.gameObject.GetComponentInParent<CarstuntHandler>().Set_Statustantrotation(transform.rotation, StuntRotationAxis.Y, speed);
                    Toolbox.HUDListner.set_StatusStunt(true, "Flat spin stunt");
                }
                else if (Z)
                {
                    col.gameObject.GetComponentInParent<CarstuntHandler>().Set_Statustantrotation(transform.rotation, StuntRotationAxis.Z, speed);
                    Toolbox.HUDListner.set_StatusStunt(true, "Barrel spin stunt");
                }

                if (stuntcameraenable)
                    if (Toolbox.GameplayController.stuntcamera)
                        Toolbox.GameplayController.stuntcamera.set_StatusStunt();

                    Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.Stuntvoiceovers[Random.Range(0, Toolbox.Soundmanager.Stuntvoiceovers.Count)]);
                Toolbox.Soundmanager.Pause();
                Invoke(nameof(UnpauseMusic), 1f);
            }
           
        }

    }
   
    private void UnpauseMusic()
    {
        Toolbox.Soundmanager.UnPause();
        CancelInvoke(nameof(UnpauseMusic));
    }

}
