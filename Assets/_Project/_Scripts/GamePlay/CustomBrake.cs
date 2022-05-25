using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CustomBrake : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        
    }
    //public void SetTorque(WheelCollider wheel, float TargetVelocity, float time)
    //{
    //    if (float.IsNaN(currentMomentOfInertia))
    //    {
    //        currentMomentOfInertia = 1f;
    //    }
    //    wheel.motorTorque = Mathf.Clamp(wheel.motorTorque, 1f, Mathf.Infinity);
    //    mass = (wheel.mass + 1575f);
    //    radius = wheel.radius;
    //    finalAngularVelocity = TargetVelocity / radius;
    //    rpm = wheel.rpm;
    //    currentAngularVelocity = rpm * ratio;
    //    currentLinearVelocity = radius * currentAngularVelocity;
    //    currentAngularMomentum = mass  currentLinearVelocity radius;
    //    currentMomentOfInertia = currentAngularMomentum / currentAngularVelocity;
    //    currentTorque = (currentMomentOfInertia * (finalAngularVelocity - currentAngularVelocity)) / time;
    //    wheel.motorTorque = TargetVelocity;
    //}
    // Update is called once per frame
    void Update()
    {
        
    }
}
