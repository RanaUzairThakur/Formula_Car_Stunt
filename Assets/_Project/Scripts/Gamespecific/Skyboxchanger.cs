using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Skyboxchanger : MonoBehaviour
{
    public Material Skybox;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    private void OnTriggerEnter(Collider col)
    {
        if(col.gameObject.CompareTag("Player"))
        {
            RenderSettings.skybox = Skybox;
        }
    }
}
