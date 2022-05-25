using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RocketMeshHandler : MonoBehaviour
{
    public MeshRenderer Rocket;

    // Start is called before the first frame update
    public void EnableRocket()
    {
        Debug.Log("En rocket");
        Rocket.enabled = true;
    }
    public void DisableRocket()
    {
        Debug.Log("Dis rocket");
        Rocket.enabled = false;

    }
}
