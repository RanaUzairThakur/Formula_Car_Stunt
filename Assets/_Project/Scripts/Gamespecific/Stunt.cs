using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Stunt : MonoBehaviour
{
    public List<GameObject> objecton;
    public List<GameObject> objectoff;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    void OnTriggerEnter(Collider col)
    {


        if (col.gameObject.CompareTag("Player"))
        {

            if (this.tag == "start_stunt")
            {
                foreach (GameObject g in objectoff)
                    g.SetActive(false);
                foreach (GameObject g in objecton)
                    g.SetActive(true);
            }

            else if (this.tag == "End_stunt")
            {
                foreach (GameObject g in objectoff)
                    g.SetActive(true);
                foreach (GameObject g in objecton)
                    g.SetActive(false);
            }
        }
    }
}
