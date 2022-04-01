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
    }
    void OnTriggerEnter(Collider col)
    {



        if (col.gameObject.tag == "SavePoint")
        {

            Lastsavepoint = col.gameObject.transform;
            SoundsManager._instance.PlaySound(SoundsManager._instance.Savepointclip);
            col.gameObject.SetActive(false);
           // Debug.Log("Stunt On");
        }
        if (col.gameObject.tag == "Coin")
        {
            Totalcoins++;
            SoundsManager._instance.PlaySound(SoundsManager._instance.singleCoinsSound);
            col.gameObject.SetActive(false);
          //  Debug.Log("Stunt On");
        }
        //if (col.tag == "downforce2")
        //{
        //   tyregrip.tireGrip = 2500;
        //   tyregrip.downforce = 10000;
        //}
        //if (col.tag == "downforce3")
        //{
        //    tyregrip.tireGrip = 10000;
        //    tyregrip.downforce = 25000;
        //}

    }


    public void set_StatusVehicleReset()
    {
        if (Lastsavepoint)
        {
            this.transform.position = Lastsavepoint.position;
            this.transform.rotation = Lastsavepoint.rotation;
            this.GetComponent<Rigidbody>().velocity = Vector3.zero;
            this.GetComponent<Rigidbody>().angularVelocity = Vector3.zero;
        }
        else
        {
            
        }

    }

}
