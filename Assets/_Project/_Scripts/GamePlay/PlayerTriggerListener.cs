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
            col.gameObject.SetActive(false);
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
            Toolbox.GameplayController.Lives -= 1;
            Toolbox.GameplayController.LevelFail_Delay(3f);
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
            this.GetComponent<HandleTyreGrip>().enabled = false;
            if (this.GetComponent<AirStabiity>())
                this.GetComponent<AirStabiity>().stablerotation = false;
        }
        else
        {
            
        }

    }

}
