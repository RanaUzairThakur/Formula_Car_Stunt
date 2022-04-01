using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RewindPopUp : MonoBehaviour
{
    RCC_CarControllerV3 car;
    public WheelCollider[] Col;
    WheelHit wheelTouch;
    public float Value = 0f;
    public GameObject RewindButton,left,right;

    private void Start()
    {
        car = gameObject.GetComponent<RCC_CarControllerV3>();
    }

    void FixedUpdate()
    {
        //if (!IsGrounded())
        //{
        //    RaycastHit hit;
        //    if (Physics.Raycast(transform.position, Vector3.down, out hit, Value))
        //    {
        //        RewindButton.GetComponent<Animator>().enabled = false;
        //        left.GetComponent<Animator>().enabled = false;
        //        right.GetComponent<Animator>().enabled = false;
        //    }                                                        
        //    else
        //    {                           
        //        RewindButton.GetComponent<Animator>().enabled = true;
        //        left.GetComponent<Animator>().enabled = true;
        //        right.GetComponent<Animator>().enabled = true;

        //    }
        //}
    }

    bool IsGrounded()
    {

        //foreach (WheelCollider w in Col)
        //{
        //    if (w.GetGroundHit(out wheelTouch))

        //        return true;
        //}
        //return false;
    }
}
