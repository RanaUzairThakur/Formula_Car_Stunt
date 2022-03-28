using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class statment_off : MonoBehaviour
{
    public GameObject Mode_Info;

    private void OnEnable()
    {
        Invoke("cancel", 3f); 
    }
    private void cancel()
    {
        Mode_Info.SetActive(false);
    }
}
