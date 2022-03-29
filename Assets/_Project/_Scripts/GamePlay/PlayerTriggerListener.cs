using UnityEngine;

public class PlayerTriggerListener : MonoBehaviour
{
    public Vector3 Lastsaveposition;
    public int Totalcoins;

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
            SoundsManager._instance.PlaySound(SoundsManager._instance.singleCoinsSound);
            col.gameObject.SetActive(false);
          //  Debug.Log("Stunt On");
        }


    }

}
