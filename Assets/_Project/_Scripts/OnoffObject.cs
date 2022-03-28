using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class OnoffObject : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        DemoManager.Instance.OffObject(false);
    }

    
}
