using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class OBjectMove : MonoBehaviour
{
    public Animator Move;

    private void OnTriggerEnter(Collider other)
    {
        Move.enabled = true;
    }
}
