using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Destroy : MonoBehaviour
{
    public float DestroyTime;
    // Start is called before the first frame update
    void Start()
    {
        Destroy(this.gameObject,DestroyTime);
    }

    public void Destroyingcamera()
    {
        Destroy(this.gameObject, DestroyTime);
    }

}
