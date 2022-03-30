using UnityEngine;

public class PlayerTriggerListener : MonoBehaviour
{
    public Vector3 Lastsaveposition;
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

            Lastsaveposition = col.gameObject.transform.localPosition;
            SoundsManager._instance.PlaySound(SoundsManager._instance.Savepointclip);
            col.gameObject.SetActive(false);
           // Debug.Log("Stunt On");
        }
        if (col.gameObject.tag == "Coin")
        {
            Totalcoins++;
            //SoundsManager._instance.PlaySound(SoundsManager._instance.singleCoinsSound);
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

}
