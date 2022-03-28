using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Stayable : MonoBehaviour
{
    public WheelCollider[] WhellCol;
    WheelHit wheelHit;
    public float number=4f;
    public GameObject carModel;
    private float speed = 50f;
    private Vector3 forwardDirection;
    private float rotationAmount;
    RCC_CarControllerV3 car;
    bool check;
    // private RaycastHit hit;
    // public Transform raycastPoint;
    Rigidbody Rb;
    private void Start()
    {
        car = gameObject.GetComponent<RCC_CarControllerV3>();
        Rb = gameObject.GetComponent<Rigidbody>();
    }
    void FixedUpdate()
    {
        if (!IsGrounded())
        {
            RaycastHit hit;
            if (Physics.Raycast(transform.position, Vector3.down, out hit,number))
            {
                if (!check)
                    check = true;
                return;
            }
            else
            {
                var slopeRotation = Quaternion.FromToRotation(transform.up, hit.normal);
                transform.rotation = Quaternion.Slerp(transform.rotation, slopeRotation * transform.rotation, 0.5f * Time.fixedDeltaTime);
                rotationAmount = car.steerInput * -40f;
                rotationAmount *= Time.deltaTime;
                float _X = carModel.transform.position.x;
                float _y = carModel.transform.position.y;
                float _z = carModel.transform.position.z;
                _z += rotationAmount;
                carModel.transform.position = new Vector3(_X, _y, _z);
                if (check)
                {
                    Rb.angularVelocity = Vector3.zero;
                    check = false;
                }

            }
           

        }

    }
    public void In()
    {

        rotationAmount = car.steerInput* -40f;
        rotationAmount *= Time.deltaTime;
        float _X = carModel.transform.position.x;
        float _y = carModel.transform.position.y;
        float _z = carModel.transform.position.z;
        _z += rotationAmount;
        carModel.transform.position  = new Vector3(_X ,_y,_z);
        Invoke("Out", 1f);

    }
    public void Out()
    {
        Time.timeScale = 1f;
    }
    bool IsGrounded()
    {

        foreach (WheelCollider w in WhellCol)
        {
            if (w.GetGroundHit(out wheelHit))

                return true;
        }
        return false;
    }
    
}
