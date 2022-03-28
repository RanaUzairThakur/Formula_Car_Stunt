using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Respwan : MonoBehaviour
{
    public static Respwan Instance;

    public float threshold;

    private void Start()
    {
        Instance = this;
    }
    void FixedUpdate()
    {
        if (transform.position.y < threshold)
            transform.position = new Vector3(0, 0, 0);
    }
}
