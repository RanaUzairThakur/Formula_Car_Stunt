using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ApplyForce : MonoBehaviour
{
    Rigidbody rb;
    public int multiplyer;
    // Start is called before the first frame update
    void Start()
    {
        rb = GetComponent<Rigidbody>();
        rb.AddForce(new Vector3(Random.Range(0, 1), Random.Range(0, 1), Random.Range(0, 1)),ForceMode.Impulse);
    }
}
