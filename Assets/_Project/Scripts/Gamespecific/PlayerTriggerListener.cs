using UnityEngine;

public class PlayerTriggerListener : MonoBehaviour
{
   // [HideInInspector]
    public Transform Lastsavepoint;
    public int Totalcoins;
    private HandleTyreGrip tyregrip ; 
        private void Start()
    {
        if (!tyregrip)
            tyregrip = this.gameObject.GetComponent<HandleTyreGrip>();
        if (!Lastsavepoint)
            Lastsavepoint = Toolbox.GameplayController.VehicleSpawnPoint;
    }
    void OnTriggerEnter(Collider col)
    {



        if (col.gameObject.tag == "SavePoint")
        {

            Lastsavepoint = col.gameObject.transform;
            Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.Savepointclip);
            Toolbox.HUDListner.set_StatusStunt(true,"CHECKPOINT");
            //col.gameObject.SetActive(false);
        }
        if (col.gameObject.tag == "Coin")
        {
            Totalcoins++;
            Toolbox.Soundmanager.PlaySound(Toolbox.Soundmanager.singleCoinsSound);
            col.gameObject.SetActive(false);
        }

        if (col.gameObject.tag == "Finish")
        {
            Toolbox.GameplayController.finish_Effect();
        }
        if (col.gameObject.tag == "GameOver")
        {
            //print("Name :"+col.gameObject.name);
            Toolbox.GameplayController.Lives -= 1;
            Toolbox.GameplayController.LevelFail_Delay(3f);
        }
        if (col.gameObject.tag == "RB")
        {

            col.gameObject.GetComponent<Rigidbody>().isKinematic = false;
            //col.gameObject.SetActive(false);
        }
        if (col.gameObject.tag == "Stalag")
        {

            col.gameObject.GetComponentInChildren<Animator>().enabled = true;
            //col.gameObject.SetActive(false);
        }
    }


    public void set_StatusVehicleReset()
    {
        if (Lastsavepoint)
        {
            this.transform.position = Lastsavepoint.position;
            this.transform.rotation = Lastsavepoint.rotation;
            this.GetComponent<Rigidbody>().velocity = Vector3.zero;
            this.GetComponent<Rigidbody>().angularVelocity = Vector3.zero;
             this.GetComponent<RCC_CarControllerV3>().downForce = 15f;
            HUDListner.OnPress_ReleaseNos();
            if (this.GetComponent<AirStabiity>())
                this.GetComponent<AirStabiity>().Axis = RotationAxis.None;
        }
        else
        {
            
        }

    }

}
