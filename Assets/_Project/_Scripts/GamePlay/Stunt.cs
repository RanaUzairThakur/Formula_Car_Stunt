using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Stunt : MonoBehaviour
{
    public enum StuntAxis {x,y,z };
    public StuntAxis stuntaxis;
    RCC_CarControllerV3 Player;
    CarAutoRotation carstunt;
    Rigidbody Rb;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    //void OnTriggerEnter(Collider col)
    //{
    //    if (col.gameObject.tag == "Player")
    //    {

    //        Player = gameObject.GetComponent<RCC_CarControllerV3>();
    //        Rb = gameObject.GetComponent<Rigidbody>();
    //        if(StuntAxis.x)
    //        carstunt. = true;

    //    }

    //}
}
