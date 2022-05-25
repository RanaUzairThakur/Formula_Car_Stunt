using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GunChangePopup : MonoBehaviour
{
    // Start is called before the first frame update
    void OnEnable()
    {
        Time.timeScale = 0f;
    }
    public void Cross()
    {
        this.gameObject.SetActive(false);
        Time.timeScale = 1f;
    }
   
}
