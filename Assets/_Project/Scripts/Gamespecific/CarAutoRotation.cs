using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CarAutoRotation : MonoBehaviour
{
    public float TakeOff = 5f;
    float RotationAngle;
    RCC_CarControllerV3 Player;
    bool CarRotation, onetime;
    Rigidbody Rb;
    


    void Start()
    {
        Player = gameObject.GetComponent<RCC_CarControllerV3>();
        Rb = gameObject.GetComponent<Rigidbody>();
    }

    private void FixedUpdate()
    {
        if (CarRotation)
        {
            autorotation();
        }

    }


    private void autorotation()
    {

        RotationAngle += Time.unscaledDeltaTime * 200f;
        transform.rotation = Quaternion.Euler(transform.eulerAngles.x, transform.eulerAngles.y, RotationAngle);
        Rb.angularVelocity = Vector3.zero;
        if (RotationAngle > 359)
        {
            CarRotation = false;
            RotationAngle = 0f;
            Rb.transform.rotation = Quaternion.Euler(0f, transform.eulerAngles.y, 0f);
        }
    }
    void OnTriggerEnter(Collider col)
    {
        if (col.gameObject.tag == "Jump")
        {
            CarRotation = true;

        }
      
    }

}
