using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SpawnableHelli : MonoBehaviour
{
    // Start is called before the first frame update
    public GameObject ActivateObject;
    //public Transform sawnpoint;
    private Vector3 pos;
    void Start()
    {
       
    }
    void OnTriggerEnter(Collider col)
    {
        if (col.gameObject.tag == "Player")
        {
            ActivateObject.SetActive(true);
            pos = ActivateObject.transform.position;
        }
    }
    private void OnTriggerExit(Collider col)
    {
        if (col.gameObject.tag == "Player")
        {
            //ActivateObject.SetActive(false);
            //ActivateObject.transform.position = pos;
        }
    }

    public void Off_spawnableObject()
    {
        ActivateObject.SetActive(false);
        ActivateObject.transform.position = pos;
    }
}
