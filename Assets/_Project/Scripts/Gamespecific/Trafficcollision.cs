using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Trafficcollision : MonoBehaviour
{
    public Rigidbody carrb;
    //Rigidbody otherrb;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    void OnTriggerEnter(Collider col)
    {


        if (col.gameObject.CompareTag("Player"))
        {
            if (carrb)
            {
                carrb.isKinematic = false;
                carrb.AddForce(Vector3.up * 80, ForceMode.Acceleration);
                carrb.AddForce(Vector3.forward * 80, ForceMode.Acceleration);
            }
        }
    }

}
